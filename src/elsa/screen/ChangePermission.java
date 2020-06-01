package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.QuestionType;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.util.StringConverter;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class ChangePermission extends Screen<ChangePermission> implements Initializable {

    private DatabaseManager db;
    private User user;

    @FXML
    private JFXComboBox<Permission> permission;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        permission.setItems(FXCollections.observableArrayList(Permission.values()));
        permission.getSelectionModel().select(0);

        permission.setConverter(new StringConverter<Permission>() {
            @Override
            public String toString(Permission object) {
                return object.getText();
            }

            @Override
            public Permission fromString(String string) {
                for (Permission p : Permission.values()) {
                    if (p.getText().equals(string)) {
                        return p;
                    }
                }
                return null;
            }
        });
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

        if (permission.getSelectionModel().getSelectedItem() == null) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        try {
            db.changePermission(user, permission.getSelectionModel().getSelectedItem());

            Information.display("Úprava oprávnění úspěšná.");
        } catch (SQLException ex) {
            // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
            Information.display("Při úpravě došlo k chybě.");
        }
        close();
    }

    public void load(User s) {
        user = s;
        permission.getSelectionModel().select(s.getPermission());
    }
}
