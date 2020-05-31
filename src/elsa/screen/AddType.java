package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.QuestionType;
import elsa.database.StudyMaterialType;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddType extends Screen<AddType> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextField shortcut;
    @FXML
    private JFXTextArea description;

    private int type = 0;
    private boolean edit = false;
    private Integer id;
    @FXML
    private JFXButton btnAdd;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    public void setDb(DatabaseManager db) {
        this.db = db;
    }

    @FXML
    private void exit(ActionEvent event) {
        close();
    }

    @FXML
    private void add(ActionEvent event) {

        if (title.getText().isEmpty() || shortcut.getText().isEmpty()) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        if (type == 1) {
            if (edit) {
                try {
                    db.editQuestionType(id, title.getText(), shortcut.getText(), description.getText());

                    Information.display("Úprava druhu otázky úspěšná.");
                } catch (SQLException ex) {
                    // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                    Information.display("Při úpravě došlo k chybě.");
                }

            } else {
                try {
                    db.createQuestionType(title.getText(), shortcut.getText(), description.getText());

                    Information.display("Vložení druhu otázky úspěšné.");
                } catch (SQLException ex) {
                    // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                    Information.display("Při vložení došlo k chybě.");
                }
            }
        }

        if (type == 2) {
            if (edit) {
                try {
                    db.editStudyMaterialType(id, title.getText(), shortcut.getText(), description.getText());

                    Information.display("Úprava kategorie studijního materiálu úspěšná.");
                } catch (SQLException ex) {
                    // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                    Information.display("Při úpravě došlo k chybě.");
                }

            } else {
                try {
                    db.createStudyMaterialType(title.getText(), shortcut.getText(), description.getText());

                    Information.display("Vložení kategorie studijního materiálu úspěšné.");
                } catch (SQLException ex) {
                    // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                    Information.display("Při vložení došlo k chybě.");
                }
            }
        }
        close();
    }

    public void load(int type) {
        this.type = type;
    }

    public void load(StudyMaterialType s) {
        edit = true;
        btnAdd.setText("Upravit");
        type = 2;

        title.setText(s.getText());
        shortcut.setText(s.getShortcut());
        description.setText(s.getDescription());
        id = s.getId();
    }

    public void load(QuestionType s) {
        edit = true;
        btnAdd.setText("Upravit");
        type = 1;

        title.setText(s.getText());
        shortcut.setText(s.getShortcut());
        description.setText(s.getDescription());
        id = s.getId();
    }
}
