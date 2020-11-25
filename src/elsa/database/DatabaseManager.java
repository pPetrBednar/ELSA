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
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static java.sql.Types.BLOB;
import static java.sql.Types.VARCHAR;
import java.util.ArrayList;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.image.Image;
import javax.imageio.ImageIO;
import static oracle.jdbc.OracleTypes.CURSOR;

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
    private User selectedCommunication;
    private Group selectedGroup;

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

    public User getSelectedCommunication() {
        return selectedCommunication;
    }

    public void setSelectedCommunication(User selectedCommunication) {
        this.selectedCommunication = selectedCommunication;
    }

    public Group getSelectedGroup() {
        return selectedGroup;
    }

    public void setSelectedGroup(Group selectedGroup) {
        this.selectedGroup = selectedGroup;
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
        CallableStatement call = con.prepareCall("{? = call ELSA.getPassword(?)}");
        call.registerOutParameter(1, VARCHAR);
        call.setString(2, login);

        try {
            call.executeUpdate();
            String pass = call.getString(1);
            call.close();

            if (checkPassword(password, pass)) {
                login(login);
                return;
            } else {
                throw new DBException("Špatné heslo");
            }
        } catch (SQLException e) {
            throw new DBException("Uživatel nenalezen");
        }
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
     * Loads information about selected user
     *
     * @param login
     * @throws SQLException
     * @throws IOException
     */
    public void loginAs(User u) throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE WHERE login = '" + u.getLogin() + "'")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {

                if (user != null) {
                    break;
                }

                user = new User(
                        rset.getInt("id_uzivatel"),
                        u.getLogin(),
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

    /**
     * Loads list of all teachers in database
     *
     * @return ArrayList<User>
     * @throws SQLException
     */
    public ArrayList<User> getAllTeachers() throws SQLException {

        ArrayList<User> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE WHERE role_id = 2")) {
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
        try (CallableStatement call = con.prepareCall("call ELSA.subscribeSubject(?, ?)")) {
            call.setInt(1, user.getId());
            call.setInt(2, s.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.unsubscribeSubject(?, ?)")) {
            call.setInt(1, user.getId());
            call.setInt(2, s.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addSubject(?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, shortcut.toUpperCase());
            call.setString(3, description);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addStudyMaterial(?, ?, ?, ?, ?, ?, ?)")) {
            call.setString(1, title);
            call.setInt(2, pages);
            call.setString(3, description);

            if (file == null) {
                call.setNull(4, 0);
                call.setString(5, null);
            } else {
                call.setBinaryStream(4, new FileInputStream(file));
                call.setString(5, getFileExtension(file.getName()));
            }

            call.setInt(6, selectedSubject.getId());
            call.setInt(7, user.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addStudyMaterialType(?, ?)")) {
            call.setInt(1, id);
            call.setInt(2, type.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addQuiz(?, ?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, description);
            call.setInt(3, selectedStudyMaterial.getId());
            call.setInt(4, user.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addQuestion(?, ?, ?, ?, ?, ?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, question);
            call.setString(3, answer);
            call.setInt(4, points);
            call.setInt(5, index);
            call.setInt(6, selectedQuiz.getId());
            call.setInt(7, type.getId());
            call.setInt(8, user.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addComment(?, ?, ?)")) {
            call.setString(1, text);
            call.setInt(2, selectedStudyMaterial.getId());
            call.setInt(3, user.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.createStudyMaterialType(?, ?, ?)")) {
            call.setString(1, text);
            call.setString(2, shortcut);
            call.setString(3, description);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.createQuestionType(?, ?, ?)")) {
            call.setString(1, text);
            call.setString(2, shortcut);
            call.setString(3, description);

            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeSubject(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeStudyMaterial(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeQuiz(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeQuestion(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeComment(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeStudyMaterialType(?, ?)")) {
            call.setInt(1, id);
            call.setInt(2, type.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.deleteStudyMaterialType(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.deleteQuestionType(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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

        try (CallableStatement call = con.prepareCall("call ELSA.removeUser(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editSubject(?, ?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, shortcut.toUpperCase());
            call.setString(3, description);
            call.setInt(4, id);

            call.executeUpdate();
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
        if (file == null) {
            try (CallableStatement call = con.prepareCall("call ELSA.editStudyMaterial(?, ?, ?, ?)")) {
                call.setString(1, title);
                call.setInt(2, pages);
                call.setString(3, description);
                call.setInt(4, id);

                call.executeUpdate();
                con.commit();
            }
        } else {
            try (CallableStatement call = con.prepareCall("call ELSA.editStudyMaterialFile(?, ?, ?, ?, ?, ?)")) {
                call.setString(1, title);
                call.setInt(2, pages);
                call.setString(3, description);
                call.setBinaryStream(4, new FileInputStream(file));
                call.setString(5, getFileExtension(file.getName()));
                call.setInt(6, id);

                call.executeUpdate();
                con.commit();
            }
        }

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
        try (CallableStatement call = con.prepareCall("call ELSA.addStudyMaterialChange(?, ?)")) {
            call.setInt(1, user.getId());
            call.setInt(2, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.addStudyMaterialChange(?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, description);
            call.setInt(3, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editQuestion(?, ?, ?, ?, ?, ?, ?)")) {
            call.setString(1, title);
            call.setString(2, question);
            call.setString(3, answer);
            call.setInt(4, points);
            call.setInt(5, index);
            call.setInt(6, type.getId());
            call.setInt(7, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editImage(?, ?)")) {
            BufferedImage bImage = SwingFXUtils.fromFXImage(image, null);
            ByteArrayOutputStream s = new ByteArrayOutputStream();
            ImageIO.write(bImage, "png", s);
            byte[] res = s.toByteArray();

            call.setBinaryStream(1, new ByteArrayInputStream(res));
            call.setInt(2, user.getId());

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editProfileInformation(?, ?, ?, ?, ?, ?)")) {
            call.setString(1, firstName);
            call.setString(2, lastName);
            call.setString(3, email);
            call.setString(4, phone);
            call.setString(5, address);
            call.setInt(6, user.getId());

            call.executeUpdate();
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
            try (CallableStatement call = con.prepareCall("call ELSA.editLoginInformation(?, ?)")) {
                call.setString(1, login);
                call.setInt(2, user.getId());

                call.executeUpdate();
                con.commit();
            }
        } else {
            try (CallableStatement call = con.prepareCall("call ELSA.editLoginInformationPassword(?, ?, ?)")) {
                call.setString(1, login);
                call.setString(2, encryptPassword(password));
                call.setInt(3, user.getId());

                call.executeUpdate();
                con.commit();
            }
        }

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
        try (CallableStatement call = con.prepareCall("call ELSA.editComment(?, ?)")) {
            call.setString(1, text);
            call.setInt(2, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editStudyMaterialType(?, ?, ?, ?)")) {
            call.setString(1, text);
            call.setString(2, shortcut);
            call.setString(3, description);
            call.setInt(4, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.editQuestionType(?, ?, ?, ?)")) {
            call.setString(1, text);
            call.setString(2, shortcut);
            call.setString(3, description);
            call.setInt(4, id);

            call.executeUpdate();
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
        try (CallableStatement call = con.prepareCall("call ELSA.changePermission(?, ?)")) {
            switch (permit) {
                case ADMINISTRATOR:
                    call.setInt(1, 1);
                    break;
                case TEACHER:
                    call.setInt(1, 2);
                    break;
                case STUDENT:
                    call.setInt(1, 3);
                    break;
            }
            call.setInt(2, u.getId());

            call.executeUpdate();
            con.commit();
        }
    }

    public ArrayList<StudyMaterial> find(String title, Subject subject, StudyMaterialType type, User teacher) throws SQLException {
        ArrayList<StudyMaterial> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.find(?, ?, ?, ?, ?)")) {

            call.setString(1, title);
            call.setInt(2, subject.getId());
            call.setInt(3, type.getId());
            call.setInt(4, teacher.getId());
            call.registerOutParameter(5, CURSOR);
            call.executeUpdate();

            ResultSet rs = (ResultSet) call.getObject(5);

            while (rs.next()) {
                data.add(new StudyMaterial(
                        rs.getInt("id_studijnimaterial"),
                        rs.getString("nazev"),
                        rs.getInt("stran"),
                        rs.getDate("datumvytvoreni"),
                        rs.getDate("datumzmeny"),
                        rs.getString("nazev_predmet"),
                        null,
                        null,
                        rs.getString("jmeno") + " " + rs.getString("prijmeni"),
                        rs.getInt("predmet_id")
                ));
            }

        }
        return data;
    }

    public ArrayList<User> getCommunications() throws SQLException {
        ArrayList<User> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.getCommunications(?, ?)")) {

            call.setInt(1, user.getId());
            call.registerOutParameter(2, CURSOR);
            call.executeUpdate();

            ResultSet rs = (ResultSet) call.getObject(2);

            while (rs.next()) {
                data.add(new User(
                        rs.getInt("prijemce_id"),
                        null,
                        null,
                        rs.getString("jmeno"),
                        rs.getString("prijmeni"),
                        null,
                        null,
                        null,
                        null
                ));
            }

        }
        return data;
    }

    /**
     * Loads all Messages from database
     *
     * @return ArrayList<Message>
     * @throws SQLException
     */
    public ArrayList<Message> getAllMessagesFromUser(User u) throws SQLException {

        ArrayList<Message> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.getCommunication(?, ?, ?)")) {

            call.setInt(1, user.getId());
            call.setInt(2, u.getId());
            call.registerOutParameter(3, CURSOR);
            call.executeUpdate();

            ResultSet rs = (ResultSet) call.getObject(3);

            while (rs.next()) {
                data.add(new Message(
                        rs.getInt("id_zprava"),
                        rs.getString("text"),
                        rs.getDate("datum"),
                        new User(
                                rs.getInt("odesilatel_id"),
                                null,
                                null,
                                rs.getString("odesilatel_jmeno"),
                                rs.getString("odesilatel_prijmeni"),
                                null,
                                null,
                                null,
                                null
                        ),
                        new User(
                                rs.getInt("prijemce_id"),
                                null,
                                null,
                                rs.getString("prijemce_jmeno"),
                                rs.getString("prijemce_prijmeni"),
                                null,
                                null,
                                null,
                                null
                        )
                ));
            }

        }
        return data;
    }

    /**
     * Sends Message to selected user
     *
     * @throws SQLException
     */
    public void addMessage(User recipient, String text) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.addMessage(?, ?, ?)")) {
            call.setString(1, text);
            call.setInt(2, user.getId());
            call.setInt(3, recipient.getId());

            call.executeUpdate();
            con.commit();
        }
    }

    /**
     * Removes selected Message from database
     *
     * @param s Selected Message
     * @throws SQLException
     */
    public void removeMessage(Message s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeMessage(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    /**
     * Loads all Files in database
     *
     * @return ArrayList<CloudFile>
     * @throws SQLException
     */
    public ArrayList<CloudFile> getAllCloudFiles() throws SQLException {

        ArrayList<CloudFile> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM SOUBORY_UZIVATELU WHERE uzivatel_id = " + user.getId())) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new CloudFile(
                        rset.getInt("id_soubor"),
                        rset.getString("nazev"),
                        null,
                        rset.getString("pripona"),
                        rset.getDate("nahrano"),
                        rset.getDate("upraveno")
                ));
            }
        }
        return data;
    }

    /**
     * Updates information about selected Cloud File
     *
     * @param id Selected CoudFile
     * @param title
     * @throws SQLException
     */
    public void editCloudFile(Integer id, String title) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.editCloudFile(?, ?)")) {
            call.setString(1, title);
            call.setInt(2, id);

            call.executeUpdate();
            con.commit();
        }
    }

    /**
     * Adds new CloudFile
     *
     * @param
     * @throws SQLException
     */
    public void addCloudFile(String title, File file) throws SQLException, FileNotFoundException {
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.addCloudFile(?, ?, ?, ?)")) {
            call.setString(1, title);

            if (file == null) {
                return;
            } else {
                call.setBinaryStream(2, new FileInputStream(file));
                call.setString(3, getFileExtension(file.getName()));
            }

            call.setInt(4, user.getId());

            call.executeUpdate();
            con.commit();
        }
    }

    public Blob getFileFromCloudFile(Integer id) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.getFileFromCloudFile(?, ?)")) {

            call.setInt(1, id);
            call.registerOutParameter(2, BLOB);
            call.executeUpdate();

            return (Blob) call.getObject(2);
        }
    }

    public void removeCloudFile(CloudFile s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeCloudFile(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public ArrayList<ForbiddenWord> getAllForbiddenWords() throws SQLException {

        ArrayList<ForbiddenWord> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM NEVHODNA_SLOVA")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new ForbiddenWord(
                        rset.getInt("id_nevhodne_slovo"),
                        rset.getString("text")
                ));
            }
        }
        return data;
    }

    public void removeForbiddenWord(ForbiddenWord s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeForbiddenWord(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public void addForbiddenWord(String text) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.addForbiddenWord(?)")) {
            call.setString(1, text);
            call.executeUpdate();
            con.commit();
        }
    }

    public ArrayList<Group> getAllGroups() throws SQLException {

        ArrayList<Group> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM SKUPINY")) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new Group(
                        rset.getInt("id_skupina"),
                        rset.getString("rok_studia"),
                        rset.getString("obor")
                ));
            }
        }
        return data;
    }

    public ArrayList<Group> getAllGroupsOfUser() throws SQLException {

        ArrayList<Group> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE_SKUPIN WHERE uzivatel_id = " + user.getId())) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new Group(
                        rset.getInt("skupina_id"),
                        rset.getString("rok_studia"),
                        rset.getString("obor")
                ));
            }
        }
        return data;
    }

    public void removeGroup(Group s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeGroup(?)")) {
            call.setInt(1, s.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public void addGroup(String year, String title) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.addGroup(?, ?)")) {
            call.setString(1, year);
            call.setString(2, title);
            call.executeUpdate();
            con.commit();
        }
    }

    public void editGroup(Integer id, String year, String title) throws SQLException {
        Connection con = OracleConnector.getConnection();
        try (CallableStatement call = con.prepareCall("call ELSA.editGroup(?, ?, ?)")) {
            call.setString(1, year);
            call.setString(2, title);
            call.setInt(3, id);

            call.executeUpdate();
            con.commit();
        }
    }

    public ArrayList<Subject> getAllSubjectsOfGroup(Group g) throws SQLException {

        ArrayList<Subject> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM PREDMETY_SKUPIN WHERE skupina_id = " + g.getId())) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new Subject(
                        rset.getInt("predmet_id"),
                        rset.getString("nazev"),
                        rset.getString("zkratka"),
                        null
                ));
            }
        }
        return data;
    }

    public ArrayList<User> getAllUsersOfGroup(Group g) throws SQLException {

        ArrayList<User> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE_SKUPIN WHERE skupina_id = " + g.getId())) {
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                data.add(new User(
                        rset.getInt("uzivatel_id"),
                        null,
                        null,
                        rset.getString("jmeno"),
                        rset.getString("prijmeni"),
                        null,
                        null,
                        null,
                        null
                ));
            }
        }
        return data;
    }

    public void addUserToGroup(Group g, User u) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.addUserToGroup(?, ?)")) {
            call.setInt(1, u.getId());
            call.setInt(2, g.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public void addSubjectToGroup(Group g, Subject s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.addSubjectToGroup(?, ?)")) {
            call.setInt(1, s.getId());
            call.setInt(2, g.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public void removeUserFromGroup(Group g, User u) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeUserFromGroup(?, ?)")) {
            call.setInt(1, u.getId());
            call.setInt(2, g.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public void removeSubjectFromGroup(Group g, Subject s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        try (CallableStatement call = con.prepareCall("call ELSA.removeSubjectFromGroup(?, ?)")) {
            call.setInt(1, s.getId());
            call.setInt(2, g.getId());
            call.executeUpdate();
            con.commit();
        }
    }

    public StudyMaterial getStudyMateria(Integer id) throws SQLException {

        Connection con = OracleConnector.getConnection();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM studijni_materialy WHERE id_studijnimaterial = '" + id + "' ORDER BY datumvytvoreni ASC")) {
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

                return s;
            }
        }
        return null;
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
