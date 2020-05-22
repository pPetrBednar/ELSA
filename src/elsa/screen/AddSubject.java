package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Subject;
import elsa.screen.handlers.Screen;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddSubject extends Screen<AddSubject> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextField shortcut;
    @FXML
    private JFXTextArea description;

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
            Alert a = new Alert(Alert.AlertType.WARNING);
            a.setContentText("Některé údaje nebyly vyplněny.");
            a.showAndWait();
            return;
        }

        if (edit) {
            try {
                db.editSubject(id, title.getText(), shortcut.getText(), description.getText());

                Alert a = new Alert(Alert.AlertType.INFORMATION);
                a.setContentText("Úprava předmětu úspěšná.");
                a.showAndWait();
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Při úpravě došlo k chybě.");
                a.showAndWait();
            }

        } else {
            try {
                db.addSubject(title.getText(), shortcut.getText(), description.getText());

                Alert a = new Alert(Alert.AlertType.INFORMATION);
                a.setContentText("Vložení předmětu úspěšné.");
                a.showAndWait();
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Při vložení došlo k chybě.");
                a.showAndWait();
            }
        }
        close();
    }

    public void load(Subject s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        shortcut.setText(s.getShortcut());
        description.setText(s.getDescription());
        id = s.getId();
    }
}
