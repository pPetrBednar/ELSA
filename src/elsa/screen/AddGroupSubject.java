package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextArea;
import elsa.database.Comment;
import elsa.database.DatabaseManager;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.util.StringConverter;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddGroupSubject extends Screen<AddGroupSubject> implements Initializable {

    private DatabaseManager db;

    private ArrayList<Subject> subjects;

    @FXML
    private JFXButton btnAdd;
    @FXML
    private JFXComboBox<Subject> subject;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }

    public void setDb(DatabaseManager db) {
        this.db = db;

        try {
            subjects = db.getAllSubjects();
            subject.setItems(FXCollections.observableArrayList(subjects));
            subject.getSelectionModel().select(0);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        subject.setConverter(new StringConverter<Subject>() {
            @Override
            public String toString(Subject object) {
                return object.getTitle() + " (" + object.getShortcut() + ")";
            }

            @Override
            public Subject fromString(String string) {
                for (Subject t : subjects) {
                    if ((t.getTitle() + " (" + t.getShortcut() + ")").equals(string)) {
                        return t;
                    }
                }
                return null;
            }
        });
    }

    @FXML
    private void exit(ActionEvent event) {
        close();
    }

    @FXML
    private void add(ActionEvent event) {

        if (subject.getSelectionModel().getSelectedItem() == null) {
            Information.display("Nic nebylo vyplněno.");
            return;
        }

        try {
            db.addSubjectToGroup(db.getSelectedGroup(), subject.getValue());
            Information.display("Předmět přidán do skupiny.");
        } catch (SQLException ex) {
            Information.display("Při vložení došlo k chybě.");
        }
        close();
    }
}
