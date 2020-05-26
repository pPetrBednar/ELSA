package elsa.database;

import elsa.tools.BCrypt;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
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
import javax.imageio.stream.ImageInputStream;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class DatabaseManager extends DatabaseConfig {

    private User user;
    private Subject selectedSubject;
    private StudyMaterial selectedStudyMaterial;
    private Quiz selectedQuiz;

    /*
    
    Přihlašovací údaje k databázi jsou skryty ve zkompilovaném kódu
    
     */
    public DatabaseManager() throws SQLException {
        OracleConnector.setUpConnection("fei-sql1.upceucebny.cz", 1521, "IDAS", getLogin(), getPassword());
    }

    private String encryptPassword(String pass) {
        return BCrypt.hashpw(pass, BCrypt.gensalt(12));
    }

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

    /*
    
    LOGIN / REGISTER
    
     */
    public void login(String login, String password) throws SQLException, DBException, IOException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT heslo FROM UZIVATEL WHERE login = '" + login + "'");
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

        throw new DBException("Uživatel nenalezen");
    }

    private void login(String login) throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        //PreparedStatement stmt = con.prepareStatement("SELECT id_uzivatel, jmeno, prijmeni, email, telefon, adresa, image, opravneni FROM uzivatel INNER JOIN role ON uzivatel.role_id = role.id_role WHERE uzivatel.login = '" + login + "'");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM UZIVATELE WHERE login = '" + login + "'");
        ResultSet rset = stmt.executeQuery();

        while (rset.next()) {

            if (user != null) {
                return;
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

        loadUsersSubjects();
    }

    private Image getImageFromBlob(Blob blob) throws SQLException, IOException {
        if (blob == null) {
            return null;
        }

        InputStream is = blob.getBinaryStream();
        return SwingFXUtils.toFXImage(ImageIO.read(is), null);
    }

    private void loadUsersSubjects() throws SQLException {
        Connection con = OracleConnector.getConnection();
        //PreparedStatement stmt = con.prepareStatement("SELECT * FROM predmety_uzivatele INNER JOIN predmet ON predmety_uzivatele.predmet_id = predmet.id_predmet WHERE uzivatel_id = '" + user.getId() + "'");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM odebirane_predmety WHERE uzivatel_id = '" + user.getId() + "'");
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

    public void register(String login, String password, String firstName, String lastName, String email) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO UZIVATEL(id_uzivatel, login, heslo, jmeno, prijmeni, email, role_id) VALUES(UZIVATEL_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 3)");

        stmt.setString(1, login);
        stmt.setString(2, encryptPassword(password));
        stmt.setString(3, firstName);
        stmt.setString(4, lastName);
        stmt.setString(5, email);
        stmt.executeUpdate();
        con.commit();

    }

    /*
    
    GET DATA
    
     */
    public ArrayList<StudyMaterial> getAllMaterialsForSubject(Subject subject) throws SQLException {
        ArrayList<StudyMaterial> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        //PreparedStatement stmt = con.prepareStatement("SELECT * FROM studijni_material INNER JOIN uzivatel ON studijni_material.uzivatel_id = uzivatel.id_uzivatel WHERE studijni_material.predmet_id = '" + subject.getId() + "' ORDER BY studijni_material.datumvytvoreni ASC");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM studijni_materialy WHERE predmet_id = '" + subject.getId() + "' ORDER BY datumvytvoreni ASC");
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
                    rset.getString("jmeno") + " " + rset.getString("prijmeni")
            );

            s.setType(getAllTypesForStudyMaterial(s.getId()));

            data.add(s);
        }
        return data;
    }

    public ArrayList<Quiz> getAllQuizesForMaterial(StudyMaterial material) throws SQLException {
        ArrayList<Quiz> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM kvizy WHERE studijni_material_id = '" + material.getId() + "' ORDER BY nazev ASC");
        ResultSet rset = stmt.executeQuery();
        while (rset.next()) {
            Quiz s = new Quiz(
                    rset.getInt("id_kviz"),
                    rset.getString("nazev"),
                    rset.getString("popis"),
                    rset.getString("jmeno") + " " + rset.getString("prijmeni")
            );

            data.add(s);
        }
        return data;
    }

    public ArrayList<Question> getAllQuestionsForQuiz(Quiz quiz) throws SQLException {
        ArrayList<Question> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM otazky WHERE kviz_id = '" + quiz.getId() + "' ORDER BY poradi ASC");
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
                    rset.getString("jmeno") + " " + rset.getString("prijmeni")
            );
            data.add(s);
        }
        return data;
    }

    public ArrayList<Subject> getAllSubjects() throws SQLException {

        ArrayList<Subject> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM PREDMET");
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
        return data;
    }

    public ArrayList<Comment> getAllCommentsOfStudyMaterial(Integer id) throws SQLException {

        ArrayList<Comment> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM komentare WHERE studijni_material_id = '" + id + "' ORDER BY datumpridani DESC");
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
        return data;
    }

    public ArrayList<QuestionType> getAllQuestionTypes() throws SQLException {

        ArrayList<QuestionType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM druh_otazky");
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
        return data;
    }

    public ArrayList<StudyMaterialType> getAllStudyMaterialTypes() throws SQLException {

        ArrayList<StudyMaterialType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM kategorie_materialu");
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
        return data;
    }

    public ArrayList<StudyMaterialType> getAllTypesForStudyMaterial(Integer id) throws SQLException {

        ArrayList<StudyMaterialType> data = new ArrayList<>();
        Connection con = OracleConnector.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM kategorie_studijniho_materialu WHERE studijni_material_id = '" + id + "' ORDER BY nazev DESC");
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
        return data;
    }

    /*
    
    SUB / UNSUB SUBJECT
    
     */
    public void subscribeSubject(Subject s) throws SQLException {

        if (user.getSubjects() != null) {
            user.getSubjects().add(s);
        } else {
            user.setSubjects(new ArrayList<>());
            user.getSubjects().add(s);
        }

        Connection con = OracleConnector.getConnection();
        PreparedStatement add = con.prepareStatement("INSERT INTO predmety_uzivatele(uzivatel_id, predmet_id) VALUES('" + user.getId() + "', '" + s.getId() + "')");
        add.executeUpdate();
        con.commit();
    }

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
        PreparedStatement del = con.prepareStatement("DELETE FROM predmety_uzivatele WHERE predmet_id = '" + s.getId() + "' AND uzivatel_id = '" + user.getId() + "'");
        del.executeUpdate();
        con.commit();
    }

    /*
    
    ADD DATA
    
     */
    public void addSubject(String title, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement in = con.prepareStatement("INSERT INTO predmet(id_predmet, nazev, zkratka, popis) VALUES(PREDMET_SEQ.NEXTVAL, ?, ?, ?)");

        in.setString(1, title);
        in.setString(2, shortcut.toUpperCase());
        in.setString(3, description);

        in.executeUpdate();
        con.commit();
    }

    public void addStudyMaterial(String title, Integer pages, String description, File file) throws SQLException, FileNotFoundException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement in = con.prepareStatement("INSERT INTO studijni_material(id_studijniMaterial, nazev, stran, datumvytvoreni, datumzmeny, popis, soubor, predmet_id, uzivatel_id) VALUES(STUDIJNI_MATERIAL_SEQ.NEXTVAL, ?, ?, SYSDATE, SYSDATE, ?, ?, ?, ?)");

        in.setString(1, title);
        in.setInt(2, pages);
        in.setString(3, description);

        if (file == null) {
            in.setNull(4, 0);
        } else {
            in.setBinaryStream(4, new FileInputStream(file));
        }

        in.setInt(5, selectedSubject.getId());
        in.setInt(6, user.getId());

        in.executeUpdate();
        con.commit();
    }

    public void addQuiz(String title, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement in = con.prepareStatement("INSERT INTO KVIZ(id_kviz, nazev, popis, studijni_material_id, uzivatel_id) VALUES(KVIZ_SEQ.NEXTVAL, ?, ?, ?, ?)");

        in.setString(1, title);
        in.setString(2, description);
        in.setInt(3, selectedStudyMaterial.getId());
        in.setInt(4, user.getId());

        in.executeUpdate();
        con.commit();
    }

    public void addQuestion(String title, String question, String answer, Integer points, Integer index, QuestionType type) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement in = con.prepareStatement("INSERT INTO OTAZKA(id_otazka, nazev, otazka, odpoved, body, poradi, kviz_id, druh_otazky_id, uzivatel_id) VALUES(OTAZKA_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? , ?)");

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

    public void addComment(String text) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement in = con.prepareStatement("INSERT INTO komentar(id_komentar, text, datumpridani, datumzmeny, studijni_material_id, uzivatel_id) VALUES(KOMENTAR_SEQ.NEXTVAL, ?, SYSDATE, SYSDATE, ?, ?)");

        in.setString(1, text);
        in.setInt(2, selectedStudyMaterial.getId());
        in.setInt(3, user.getId());

        in.executeUpdate();
        con.commit();
    }

    /*
    
    REMOVE DATA
    
     */
    public void removeSubject(Subject s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        PreparedStatement del = con.prepareStatement("DELETE FROM predmet WHERE id_predmet = '" + s.getId() + "'");

        del.executeUpdate();
        con.commit();

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

    public void removeStudyMaterial(StudyMaterial s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        PreparedStatement del = con.prepareStatement("DELETE FROM studijni_material WHERE id_studijniMaterial = '" + s.getId() + "'");

        del.executeUpdate();
        con.commit();
    }

    public void removeQuiz(Quiz s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        PreparedStatement del = con.prepareStatement("DELETE FROM kviz WHERE id_kviz = '" + s.getId() + "'");

        del.executeUpdate();
        con.commit();
    }

    public void removeQuestion(Question s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        PreparedStatement del = con.prepareStatement("DELETE FROM otazka WHERE id_otazka = '" + s.getId() + "'");

        del.executeUpdate();
        con.commit();
    }

    public void removeComment(Comment s) throws SQLException {
        Connection con = OracleConnector.getConnection();

        PreparedStatement del = con.prepareStatement("DELETE FROM komentar WHERE id_komentar = '" + s.getId() + "'");

        del.executeUpdate();
        con.commit();
    }

    /*
    
    UPDATE DATA
    
     */
    public void editSubject(Integer id, String title, String shortcut, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE predmet SET nazev = ?, zkratka = ?, popis = ? WHERE id_predmet = '" + id + "'");

        up.setString(1, title);
        up.setString(2, shortcut.toUpperCase());
        up.setString(3, description);

        up.executeUpdate();
        con.commit();

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

    public void editStudyMaterial(Integer id, String title, Integer pages, String description, File file) throws SQLException, FileNotFoundException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up;
        if (file == null) {
            up = con.prepareStatement("UPDATE studijni_material SET nazev = ?, stran = ?, datumzmeny = SYSDATE, popis = ? WHERE id_studijnimaterial = '" + id + "'");
        } else {
            up = con.prepareStatement("UPDATE studijni_material SET nazev = ?, stran = ?, datumzmeny = SYSDATE, popis = ?, soubor = ? WHERE id_studijnimaterial = '" + id + "'");
        }

        up.setString(1, title);
        up.setInt(2, pages);
        up.setString(3, description);

        if (file == null) {

        } else {
            up.setBinaryStream(4, new FileInputStream(file));
        }

        up.executeUpdate();
        con.commit();

        addStudyMaterialChange(id);
    }

    private void addStudyMaterialChange(Integer id) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("INSERT INTO upravy_studijniho_materialu(uzivatel_id, studijni_material_id, datum) VALUES(?, ?, SYSDATE)");

        up.setInt(1, user.getId());
        up.setInt(2, id);

        up.executeUpdate();
        con.commit();
    }

    public void editQuiz(Integer id, String title, String description) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE kviz SET nazev = ?, popis = ? WHERE id_kviz = '" + id + "'");

        up.setString(1, title);
        up.setString(2, description);

        up.executeUpdate();
        con.commit();
    }

    public void editQuestion(Integer id, String title, String question, String answer, Integer points, Integer index, QuestionType type) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE otazka SET nazev = ?, otazka = ?, odpoved = ?, body = ?, poradi = ?, druh_otazky_id = ? WHERE id_otazka = '" + id + "'");

        up.setString(1, title);
        up.setString(2, question);
        up.setString(3, answer);
        up.setInt(4, points);
        up.setInt(5, index);
        up.setInt(6, type.getId());

        up.executeUpdate();
        con.commit();
    }

    public void editImage(Image image) throws SQLException, IOException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE uzivatel SET image = ? WHERE id_uzivatel = '" + user.getId() + "'");

        BufferedImage bImage = SwingFXUtils.fromFXImage(image, null);
        ByteArrayOutputStream s = new ByteArrayOutputStream();
        ImageIO.write(bImage, "png", s);
        byte[] res = s.toByteArray();

        up.setBinaryStream(1, new ByteArrayInputStream(res));
        up.executeUpdate();
        con.commit();
    }

    public void editProfileInformation(String firstName, String lastName, String email, String phone, String address) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE uzivatel SET jmeno = ?, prijmeni = ?, email = ?, telefon = ?, adresa = ? WHERE id_uzivatel = '" + user.getId() + "'");

        up.setString(1, firstName);
        up.setString(2, lastName);
        up.setString(3, email);
        up.setString(4, phone);
        up.setString(5, address);

        up.executeUpdate();
        con.commit();

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
    }

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

        user.setLogin(login);
    }

    public void editComment(Integer id, String text) throws SQLException {
        Connection con = OracleConnector.getConnection();
        PreparedStatement up = con.prepareStatement("UPDATE komentar SET text = ?, datumzmeny = SYSDATE WHERE id_komentar = '" + id + "'");

        up.setString(1, text);

        up.executeUpdate();
        con.commit();
    }

}
