package elsa.database;

import elsa.tools.BCrypt;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.image.Image;
import javax.imageio.ImageIO;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class DatabaseManager extends DatabaseConfig {

    private User user;
    private Subject selectedSubject;
    private StudyMaterial selectedStudyMaterial;
    private Quiz selectedQuiz;
    private User selectedPublicProfile;

    /**
     * DB Connection
     *
     * @throws SQLException
     */
    public DatabaseManager() throws SQLException {
        OracleConnector.setUpConnection("fei-sql1.upceucebny.cz", 1521, "IDAS", DatabaseConfig.LOGIN, DatabaseConfig.PASSWORD);
    }

    /**
     * Encrypts inputed password via BCrypt
     *
     * @param pass
     * @return
     */
    private String encryptPassword(String pass) {
        return BCrypt.hashpw(pass, BCrypt.gensalt(12));
    }

    /**
     * Checks if passwords equal
     *
     * @param pass1 Plain-text pass
     * @param pass2 Encrypted pass
     * @return
     */
    private boolean checkPassword(String pass1, String pass2) {
        return BCrypt.checkpw(pass1, pass2);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Subject getSelectedSubject() {
        return selectedSubject;
    }

    public void setSelectedSubject(Subject selectedSubject) {
        this.selectedSubject = selectedSubject;
    }

    public StudyMaterial getSelectedStudyMaterial() {
        return selectedStudyMaterial;
    }

    public void setSelectedStudyMaterial(StudyMaterial selectedStudyMaterial) {
        this.selectedStudyMaterial = selectedStudyMaterial;
    }

    public Quiz getSelectedQuiz() {
        return selectedQuiz;
    }

    public void setSelectedQuiz(Quiz selectedQuiz) {
        this.selectedQuiz = selectedQuiz;
    }

    public User getSelectedPublicProfile() {
        return selectedPublicProfile;
    }

    public void setSelectedPublicProfile(User selectedPublicProfile) {
        this.selectedPublicProfile = selectedPublicProfile;
    }

    /*
    
    LOGIN / REGISTER
    
     */
    /**
     * Checks if login data are correct, then proceeds to login user.
     *
     * @param login Login name
     * @param password Account's password
     * @throws SQLException
     * @throws DBException if password isn't correct or user doesn't exist.
     * @throws IOException
     */
    public void login(String login, String password) throws SQLException, DBException, IOException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT heslo FROM UZIVATEL WHERE login = '" + login + "'")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                String pass = rset.getString("heslo");

                if (checkPassword(password, pass)) {
                    login(login);
                    return;
                } else {
                    throw new DBException("Špatné heslo");
                }
            }
        }
        throw new DBException("Uživatel nenalezen");
    }

    /**
     * Loads information about selected user
     *
     * @param login
     * @throws SQLException
     * @throws IOException
     */
    private void login(String login) throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE WHERE login = '" + login + "'")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {

                if (user != null) {
                    break;
                }

                user = new User(
                        rset.getInt("id_uzivatel"),
                        login,
                        Permission.valueOf(rset.getString("opravneni")),
                        rset.getString("jmeno"),
                        rset.getString("prijmeni"),
                        rset.getString("email"),
                        rset.getString("telefon"),
                        rset.getString("adresa"),
                        getImageFromBlob(rset.getBlob("image"))
                );
            }
        }

        loadUsersSubjects();
    }

    /**
     * Loads information about selected user's profile.
     *
     * @return
     * @throws SQLException
     * @throws IOException
     */
    public User getPublicUserData() throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE WHERE id_uzivatel = '" + selectedPublicProfile.getId() + "'")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {

                return new User(
                        rset.getInt("id_uzivatel"),
                        null,
                        Permission.valueOf(rset.getString("opravneni")),
                        rset.getString("jmeno"),
                        rset.getString("prijmeni"),
                        rset.getString("email"),
                        rset.getString("telefon"),
                        rset.getString("adresa"),
                        getImageFromBlob(rset.getBlob("image"))
                );
            }
        }
        return null;
    }

    /**
     * Converts Blob image into JavaFX Image
     *
     * @param blob
     * @return
     * @throws SQLException
     * @throws IOException
     */
    private Image getImageFromBlob(Blob blob) throws SQLException, IOException {
        if (blob == null) {
            return null;
        }

        InputStream is = blob.getBinaryStream();
        return SwingFXUtils.toFXImage(ImageIO.read(is), null);
    }

    /**
     * Loads subscribed subjects of current user.
     *
     * @throws SQLException
     */
    private void loadUsersSubjects() throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM odebirane_predmety WHERE uzivatel_id = '" + user.getId() + "'")) {
            ResultSet rset = stmt.executeQuery();
            user.setSubjects(new ArrayList<>());

            while (rset.next()) {
                user.getSubjects().add(new Subject(
                        rset.getInt("id_predmet"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        rset.getString("popis")
                ));
            }
        }
    }

    /**
     * Registers user via provided parameters
     *
     * @param login
     * @param password
     * @param firstName
     * @param lastName
     * @param email
     * @throws SQLException
     */
    public void register(String login, String password, String firstName, String lastName, String email) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("INSERT INTO UZIVATEL(id_uzivatel, login, heslo, jmeno, prijmeni, email, role_id) VALUES(UZIVATEL_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 3)")) {
            stmt.setString(1, login);
            stmt.setString(2, encryptPassword(password));
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, email);
            stmt.executeUpdate();
            con.commit();
        }
    }

    /*
    
    GET DATA
    
     */
    /**
     * Loads all Study Materials for selected Subject
     *
     * @param subject Selected subject
     * @return ArrayList<StudyMaterial>
     * @throws SQLException
     */
    public ArrayList<StudyMaterial> getAllMaterialsForSubject(Subject subject) throws SQLException {
        ArrayList<StudyMaterial> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM studijni_materialy WHERE predmet_id = '" + subject.getId() + "' ORDER BY datumvytvoreni ASC")) {
            ResultSet rset = stmt.executeQuery();
            while (rset.next()) {
                StudyMaterial s = new StudyMaterial(
                        rset.getInt("id_studijniMaterial"),
                        rset.getString("nazev"),
                        rset.getInt("stran"),
                        rset.getDate("datumVytvoreni"),
                        rset.getDate("datumZmeny"),
                        rset.getString("popis"),
                        rset.getBlob("soubor"),
                        rset.getString("pripona"),
                        rset.getString("jmeno") + " " + rset.getString("prijmeni"),
                        rset.getInt("uzivatel_id")
                );
                
                s.setType(getAllTypesForStudyMaterial(s.getId()));
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Quizes of selected Study Material
     *
     * @param material
     * @return ArrayList<Quiz>
     * @throws SQLException
     */
    public ArrayList<Quiz> getAllQuizesForMaterial(StudyMaterial material) throws SQLException {
        ArrayList<Quiz> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM kvizy WHERE studijni_material_id = '" + material.getId() + "' ORDER BY nazev ASC")) {
            ResultSet rset = stmt.executeQuery();
            while (rset.next()) {
                Quiz s = new Quiz(
                        rset.getInt("id_kviz"),
                        rset.getString("nazev"),
                        rset.getString("popis"),
                        rset.getString("jmeno") + " " + rset.getString("prijmeni"),
                        rset.getInt("uzivatel_id")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Questions of selected Quiz
     *
     * @param quiz
     * @return ArrayList<Question>
     * @throws SQLException
     */
    public ArrayList<Question> getAllQuestionsForQuiz(Quiz quiz) throws SQLException {
        ArrayList<Question> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM otazky WHERE kviz_id = '" + quiz.getId() + "' ORDER BY poradi ASC")) {
            ResultSet rset = stmt.executeQuery();
            while (rset.next()) {
                Question s = new Question(
                        rset.getInt("id_otazka"),
                        rset.getInt("poradi"),
                        rset.getString("nazev"),
                        rset.getString("otazka"),
                        rset.getString("odpoved"),
                        rset.getInt("body"),
                        new QuestionType(rset.getInt("id_druh_otazky"), rset.getString("nazev_druh_otazky"), rset.getString("zkratka_druh_otazky"), rset.getString("popis_druh_otazky")),
                        rset.getString("jmeno") + " " + rset.getString("prijmeni"),
                        rset.getInt("uzivatel_id")
                );
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Subjects in database
     *
     * @return ArrayList<Subject>
     * @throws SQLException
     */
    public ArrayList<Subject> getAllSubjects() throws SQLException {

        ArrayList<Subject> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM PREDMET")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                Subject s = new Subject(
                        rset.getInt("id_predmet"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        rset.getString("popis")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Comments of selected Study Material
     *
     * @param id Study Material ID
     * @return ArrayList<Comment>
     * @throws SQLException
     */
    public ArrayList<Comment> getAllCommentsOfStudyMaterial(Integer id) throws SQLException {

        ArrayList<Comment> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM komentare WHERE studijni_material_id = '" + id + "' ORDER BY datumpridani DESC")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                Comment s = new Comment(
                        rset.getInt("id_komentar"),
                        rset.getString("text"),
                        rset.getDate("datumpridani"),
                        rset.getDate("datumzmeny"),
                        rset.getString("jmeno") + " " + rset.getString("prijmeni"),
                        rset.getInt("uzivatel_id")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Question Types from database
     *
     * @return ArrayList<QuestionType>
     * @throws SQLException
     */
    public ArrayList<QuestionType> getAllQuestionTypes() throws SQLException {

        ArrayList<QuestionType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM druh_otazky")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                QuestionType s = new QuestionType(
                        rset.getInt("id_druhotazky"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        rset.getString("popis")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Study Material Types from database
     *
     * @return ArrayList<StudyMaterialType>
     * @throws SQLException
     */
    public ArrayList<StudyMaterialType> getAllStudyMaterialTypes() throws SQLException {

        ArrayList<StudyMaterialType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM kategorie_materialu")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                StudyMaterialType s = new StudyMaterialType(
                        rset.getInt("id_kategoriematerialu"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        rset.getString("popis")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads all Study Material Types for selected Study Material
     *
     * @param id Study Material ID
     * @return ArrayList<StudyMaterialType>
     * @throws SQLException
     */
    public ArrayList<StudyMaterialType> getAllTypesForStudyMaterial(Integer id) throws SQLException {

        ArrayList<StudyMaterialType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM kategorie_studijniho_materialu WHERE studijni_material_id = '" + id + "' ORDER BY nazev DESC")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                StudyMaterialType s = new StudyMaterialType(
                        rset.getInt("id_kategoriematerialu"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        rset.getString("popis")
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /**
     * Loads list of all users in database
     *
     * @return ArrayList<User>
     * @throws SQLException
     */
    public ArrayList<User> getAllUsers() throws SQLException {

        ArrayList<User> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE")) {
            ResultSet rset = stmt.executeQuery();
            
            while (rset.next()) {
                User s = new User(
                        rset.getInt("id_uzivatel"),
                        rset.getString("login"),
                        Permission.valueOf(rset.getString("opravneni")),
                        rset.getString("jmeno"),
                        rset.getString("prijmeni"),
                        null,
                        null,
                        null,
                        null
                );
                
                data.add(s);
            }
        }
        return data;
    }

    /*
    
    SUB / UNSUB SUBJECT
    
     */
    /**
     * Subscribes current user to selected Subject
     *
     * @param s Selected Subject
     * @throws SQLException
     */
    public void subscribeSubject(Subject s) throws SQLException {

        if (user.getSubjects() != null) {
            user.getSubjects().add(s);
        } else {
            user.setSubjects(new ArrayList<>());
            user.getSubjects().add(s);
        }

        Connection con = OracleConnector.getConnection();
        try (PreparedStatement add = con.prepareStatement("INSERT INTO predmety_uzivatele(uzivatel_id, predmet_id) VALUES('" + user.getId() + "', '" + s.getId() + "')")) {
            add.executeUpdate();
            con.commit();
        }
    }

    /**
     * Unsubscribes current user from selected Subject
     *
     * @param s Selected Subject
     * @throws SQLException
     */
    public void unsubscribeSubject(Subject s) throws SQLException {

        if (user.getSubjects() != null) {
            Subject toRemove = null;
            for (Subject sub : user.getSubjects()) {
                if (sub.getId().equals(s.getId())) {
                    toRemove = sub;
                }
            }

            if (toRemove != null) {
                user.getSubjects().remove(toRemove);
            }
        }

        Connection con = OracleConnector.getConnection();
        try (PreparedStatement del = con.prepareStatement("DELETE FROM predmety_uzivatele WHERE predmet_id = '" + s.getId() + "' AND uzivatel_id = '" + user.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /*
    
    ADD DATA
    
     */
    /**
     * Adds new Subject into database
     *
     * @param title
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void addSubject(String title, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO predmet(id_predmet, nazev, zkratka, popis) VALUES(PREDMET_SEQ.NEXTVAL, ?, ?, ?)")) {
            in.setString(1, title);
            in.setString(2, shortcut.toUpperCase());
            in.setString(3, description);
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Study Material into database under currently selected Subject
     *
     * @param title
     * @param pages
     * @param description
     * @param file
     * @param types
     * @throws SQLException
     * @throws FileNotFoundException
     */
    public void addStudyMaterial(String title, Integer pages, String description, File file, ArrayList<StudyMaterialType> types) throws SQLException, FileNotFoundException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO studijni_material(id_studijniMaterial, nazev, stran, datumvytvoreni, datumzmeny, popis, soubor, pripona, predmet_id, uzivatel_id) VALUES(STUDIJNI_MATERIAL_SEQ.NEXTVAL, ?, ?, SYSDATE, SYSDATE, ?, ?, ?, ?, ?)")) {
            in.setString(1, title);
            in.setInt(2, pages);
            in.setString(3, description);
            
            if (file == null) {
                in.setNull(4, 0);
                in.setString(5, null);
            } else {
                in.setBinaryStream(4, new FileInputStream(file));
                in.setString(5, getFileExtension(file.getName()));
            }
            
            in.setInt(6, selectedSubject.getId());
            in.setInt(7, user.getId());
            
            in.executeUpdate();
            con.commit();
        }

        if (types == null || types.isEmpty()) {
            return;
        }

        try (PreparedStatement get = con.prepareStatement("SELECT STUDIJNI_MATERIAL_SEQ.CURRVAL AS id FROM studijni_material")) {
            ResultSet rset = get.executeQuery();
            Integer id = null;
            
            while (rset.next() && id == null) {
                id = rset.getInt("id");
            }
            
            for (StudyMaterialType t : types) {
                addStudyMaterialType(id, t);
            }
        }
    }

    /**
     * Adds selected Study Material Type tag to selected Study Material
     *
     * @param id Selected Study Material ID
     * @param type Selected Study Material Type
     * @throws SQLException
     */
    public void addStudyMaterialType(Integer id, StudyMaterialType type) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO kategorizace_materialu(studijni_material_id, kategorie_materialu_id) VALUES(?, ?)")) {
            in.setInt(1, id);
            in.setInt(2, type.getId());
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Quiz into database under currently selected Study Material
     *
     * @param title
     * @param description
     * @throws SQLException
     */
    public void addQuiz(String title, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO KVIZ(id_kviz, nazev, popis, studijni_material_id, uzivatel_id) VALUES(KVIZ_SEQ.NEXTVAL, ?, ?, ?, ?)")) {
            in.setString(1, title);
            in.setString(2, description);
            in.setInt(3, selectedStudyMaterial.getId());
            in.setInt(4, user.getId());
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Question into database under currently selected Quiz
     *
     * @param title
     * @param question
     * @param answer
     * @param points
     * @param index
     * @param type
     * @throws SQLException
     */
    public void addQuestion(String title, String question, String answer, Integer points, Integer index, QuestionType type) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO OTAZKA(id_otazka, nazev, otazka, odpoved, body, poradi, kviz_id, druh_otazky_id, uzivatel_id) VALUES(OTAZKA_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? , ?)")) {
            in.setString(1, title);
            in.setString(2, question);
            in.setString(3, answer);
            in.setInt(4, points);
            in.setInt(5, index);
            in.setInt(6, selectedQuiz.getId());
            in.setInt(7, type.getId());
            in.setInt(8, user.getId());
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Comment into database under currently selected Study Material
     *
     * @param text
     * @throws SQLException
     */
    public void addComment(String text) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO komentar(id_komentar, text, datumpridani, datumzmeny, studijni_material_id, uzivatel_id) VALUES(KOMENTAR_SEQ.NEXTVAL, ?, SYSDATE, SYSDATE, ?, ?)")) {
            in.setString(1, text);
            in.setInt(2, selectedStudyMaterial.getId());
            in.setInt(3, user.getId());
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Study Material Type into database
     *
     * @param text
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void createStudyMaterialType(String text, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO kategorie_materialu(id_kategoriematerialu, nazev, zkratka, popis) VALUES(KATEGORIE_MATERIALU_SEQ.NEXTVAL, ?, ?, ?)")) {
            in.setString(1, text);
            in.setString(2, shortcut);
            in.setString(3, description);
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new Question Type into database
     *
     * @param text
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void createQuestionType(String text, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("INSERT INTO druh_otazky(id_druhotazky, nazev, zkratka, popis) VALUES(DRUH_OTAZKY_SEQ.NEXTVAL, ?, ?, ?)")) {
            in.setString(1, text);
            in.setString(2, shortcut);
            in.setString(3, description);
            
            in.executeUpdate();
            con.commit();
        }
    }

    /*
    
    REMOVE DATA
    
     */
    /**
     * Removes selected Subject from database
     *
     * @param s Selected Subject
     * @throws SQLException
     */
    public void removeSubject(Subject s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM predmet WHERE id_predmet = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }

        if (user.getSubjects() != null) {

            Subject toRemove = null;
            for (Subject sub : user.getSubjects()) {
                if (sub.getId().equals(s.getId())) {
                    toRemove = sub;
                }
            }

            if (toRemove != null) {
                user.getSubjects().remove(toRemove);
            }
        }
    }

    /**
     * Removes selected Study Material from database
     *
     * @param s Selected Study Material
     * @throws SQLException
     */
    public void removeStudyMaterial(StudyMaterial s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM studijni_material WHERE id_studijniMaterial = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Quiz from database
     *
     * @param s Selected Quiz
     * @throws SQLException
     */
    public void removeQuiz(Quiz s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM kviz WHERE id_kviz = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Question from database
     *
     * @param s Selected Question
     * @throws SQLException
     */
    public void removeQuestion(Question s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM otazka WHERE id_otazka = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Comment from database
     *
     * @param s Selected Comment
     * @throws SQLException
     */
    public void removeComment(Comment s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM komentar WHERE id_komentar = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Study Material Type from selected Study Material
     *
     * @param id Selected Study Material
     * @param type Selected Study Material Type
     * @throws SQLException
     */
    public void removeStudyMaterialType(Integer id, StudyMaterialType type) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM kategorizace_materialu WHERE studijni_material_id = '" + id + "' AND kategorie_materialu_id = '" + type.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Study Material Type from database
     *
     * @param s Selected Study Material Type
     * @throws SQLException
     */
    public void deleteStudyMaterialType(StudyMaterialType s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM kategorie_materialu WHERE id_kategoriematerialu = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Question Type from database
     *
     * @param s Selected Question Type
     * @throws SQLException
     */
    public void deleteQuestionType(QuestionType s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM druh_otazky WHERE id_druhotazky = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected User from database
     *
     * @param s Selected User
     * @throws SQLException
     */
    public void removeUser(User s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (PreparedStatement del = con.prepareStatement("DELETE FROM uzivatel WHERE id_uzivatel = '" + s.getId() + "'")) {
            del.executeUpdate();
            con.commit();
        }
    }

    /*
    
    UPDATE DATA
    
     */
    /**
     * Updates information about selected Subject
     *
     * @param id Selected Subject ID
     * @param title
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void editSubject(Integer id, String title, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE predmet SET nazev = ?, zkratka = ?, popis = ? WHERE id_predmet = '" + id + "'")) {
            up.setString(1, title);
            up.setString(2, shortcut.toUpperCase());
            up.setString(3, description);
            
            up.executeUpdate();
            con.commit();
        }

        Subject toChange = null;
        for (Subject sub : user.getSubjects()) {
            if (sub.getId().equals(id)) {
                toChange = sub;
            }
        }

        if (toChange != null) {
            toChange.setTitle(title);
            toChange.setShortcut(shortcut);
            toChange.setDescription(description);
        }
    }

    /**
     * Updates information about selected Study Material
     *
     * @param id Selected Study Material ID
     * @param title
     * @param pages
     * @param description
     * @param file
     * @param types
     * @throws SQLException
     * @throws FileNotFoundException
     */
    public void editStudyMaterial(Integer id, String title, Integer pages, String description, File file, ArrayList<StudyMaterialType> types) throws SQLException, FileNotFoundException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up;
        if (file == null) {
            up = con.prepareStatement("UPDATE studijni_material SET nazev = ?, stran = ?, datumzmeny = SYSDATE, popis = ? WHERE id_studijnimaterial = '" + id + "'");
        } else {
            up = con.prepareStatement("UPDATE studijni_material SET nazev = ?, stran = ?, datumzmeny = SYSDATE, popis = ?, soubor = ?, pripona = ? WHERE id_studijnimaterial = '" + id + "'");
        }

        up.setString(1, title);
        up.setInt(2, pages);
        up.setString(3, description);

        if (file == null) {

        } else {
            up.setBinaryStream(4, new FileInputStream(file));
            up.setString(5, getFileExtension(file.getName()));
        }

        up.executeUpdate();
        con.commit();
        up.close();

        addStudyMaterialChange(id);
        studyMaterialTypeEdit(id, types);
    }

    /**
     * Updates information about selected Study Material's tags
     *
     * @param id Selected Study Material ID
     * @param types
     * @throws SQLException
     */
    private void studyMaterialTypeEdit(Integer id, ArrayList<StudyMaterialType> types) throws SQLException {

        if (selectedSubject == null || selectedSubject.getMaterials() == null || types == null) {
            return;
        }

        StudyMaterial selected = null;
        for (StudyMaterial sm : selectedSubject.getMaterials()) {
            if (sm.getId().equals(id)) {
                selected = sm;
            }
        }

        if (selected == null) {
            return;
        }

        ArrayList<StudyMaterialType> toRemove = new ArrayList<>();
        ArrayList<StudyMaterialType> same = new ArrayList<>();

        for (StudyMaterialType sm : selected.getType()) {

            StudyMaterialType found = null;
            for (StudyMaterialType t : types) {
                if (sm.getId().equals(t.getId())) {
                    found = t;
                    break;
                }
            }

            if (found != null) {
                same.add(found);
            } else {
                toRemove.add(sm);
            }
        }

        for (StudyMaterialType sm : same) {
            types.remove(sm);
        }

        for (StudyMaterialType sm : toRemove) {
            removeStudyMaterialType(id, sm);
        }

        for (StudyMaterialType sm : types) {
            addStudyMaterialType(id, sm);
        }
    }

    /**
     * Adds information about change of selected Study Material
     *
     * @param id Selected Study Material ID
     * @throws SQLException
     */
    private void addStudyMaterialChange(Integer id) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("INSERT INTO uprava_materialu(id_upravamaterialu, datum, uzivatel_id, studijni_material_id) VALUES(UPRAVA_MATERIALU_SEQ.NEXTVAL, SYSDATE, ?, ?)")) {
            up.setInt(1, user.getId());
            up.setInt(2, id);
            
            up.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about selected Quiz
     *
     * @param id Selected Quiz ID
     * @param title
     * @param description
     * @throws SQLException
     */
    public void editQuiz(Integer id, String title, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE kviz SET nazev = ?, popis = ? WHERE id_kviz = '" + id + "'")) {
            up.setString(1, title);
            up.setString(2, description);
            
            up.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about selected Question
     *
     * @param id Selected Question ID
     * @param title
     * @param question
     * @param answer
     * @param points
     * @param index
     * @param type
     * @throws SQLException
     */
    public void editQuestion(Integer id, String title, String question, String answer, Integer points, Integer index, QuestionType type) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE otazka SET nazev = ?, otazka = ?, odpoved = ?, body = ?, poradi = ?, druh_otazky_id = ? WHERE id_otazka = '" + id + "'")) {
            up.setString(1, title);
            up.setString(2, question);
            up.setString(3, answer);
            up.setInt(4, points);
            up.setInt(5, index);
            up.setInt(6, type.getId());
            
            up.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates selected user's profile picture
     *
     * @param image New profile picture
     * @throws SQLException
     * @throws IOException
     */
    public void editImage(Image image) throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE uzivatel SET image = ? WHERE id_uzivatel = '" + user.getId() + "'")) {
            BufferedImage bImage = SwingFXUtils.fromFXImage(image, null);
            ByteArrayOutputStream s = new ByteArrayOutputStream();
            ImageIO.write(bImage, "png", s);
            byte[] res = s.toByteArray();
            
            up.setBinaryStream(1, new ByteArrayInputStream(res));
            up.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about current User
     *
     * @param firstName
     * @param lastName
     * @param email
     * @param phone
     * @param address
     * @throws SQLException
     */
    public void editProfileInformation(String firstName, String lastName, String email, String phone, String address) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE uzivatel SET jmeno = ?, prijmeni = ?, email = ?, telefon = ?, adresa = ? WHERE id_uzivatel = '" + user.getId() + "'")) {
            up.setString(1, firstName);
            up.setString(2, lastName);
            up.setString(3, email);
            up.setString(4, phone);
            up.setString(5, address);
            
            up.executeUpdate();
            con.commit();
        }

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
    }

    /**
     * Updates login information about current User
     *
     * @param login
     * @param password
     * @throws SQLException
     */
    public void editLoginInformation(String login, String password) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up;

        if (password.isEmpty()) {
            up = con.prepareStatement("UPDATE uzivatel SET login = ? WHERE id_uzivatel = '" + user.getId() + "'");
            up.setString(1, login);
        } else {
            up = con.prepareStatement("UPDATE uzivatel SET login = ?, heslo = ? WHERE id_uzivatel = '" + user.getId() + "'");
            up.setString(1, login);
            up.setString(2, encryptPassword(password));
        }

        up.executeUpdate();
        con.commit();
        up.close();

        user.setLogin(login);
    }

    /**
     * Updates information about selected Comment
     *
     * @param id Selected Comment ID
     * @param text
     * @throws SQLException
     */
    public void editComment(Integer id, String text) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE komentar SET text = ?, datumzmeny = SYSDATE WHERE id_komentar = '" + id + "'")) {
            up.setString(1, text);
            
            up.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about selected Study Material Type
     *
     * @param id Selected Study Material Type ID
     * @param text
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void editStudyMaterialType(Integer id, String text, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("UPDATE kategorie_materialu SET nazev = ?, zkratka = ?, popis = ? WHERE id_kategoriematerialu = '" + id + "'")) {
            in.setString(1, text);
            in.setString(2, shortcut);
            in.setString(3, description);
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about selected Question Type
     *
     * @param id Selected Question Type
     * @param text
     * @param shortcut
     * @param description
     * @throws SQLException
     */
    public void editQuestionType(Integer id, String text, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement in = con.prepareStatement("UPDATE druh_otazky SET nazev = ?, zkratka = ?, popis = ? WHERE id_druhotazky = '" + id + "'")) {
            in.setString(1, text);
            in.setString(2, shortcut);
            in.setString(3, description);
            
            in.executeUpdate();
            con.commit();
        }
    }

    /**
     * Updates information about selected User's permission
     *
     * @param u Selected User
     * @param permit Selected Permission
     * @throws SQLException
     */
    public void changePermission(User u, Permission permit) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement up = con.prepareStatement("UPDATE uzivatel SET role_id = ? WHERE id_uzivatel = '" + u.getId() + "'")) {
            switch (permit) {
                case ADMINISTRATOR:
                    up.setInt(1, 1);
                    break;
                case TEACHER:
                    up.setInt(1, 2);
                    break;
                case STUDENT:
                    up.setInt(1, 3);
                    break;
            }
            
            up.executeUpdate();
            con.commit();
        }
    }

    /*
    
    TOOLS
    
     */
    /**
     * Gets file extension name from file name
     *
     * @param fileName
     * @return
     */
    private String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return null; // empty extension
        }
        return fileName.substring(lastIndexOf + 1);
    }

}
