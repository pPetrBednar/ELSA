package elsa.screen;

import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
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
public class Register extends Screen<Register> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField login;
    @FXML
    private JFXPasswordField password;
    @FXML
    private JFXTextField firstName;
    @FXML
    private JFXTextField lastName;
    @FXML
    private JFXTextField email;
    @FXML
    private JFXPasswordField passwordAgain;

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
    private void register(ActionEvent event) {

        if (!password.getText().equals(passwordAgain.getText())) {
            Alert a = new Alert(Alert.AlertType.WARNING);
            a.setContentText("Hesla se neshodují.");
            a.showAndWait();
            return;
        }

        if (login.getText().isEmpty() || password.getText().isEmpty() || firstName.getText().isEmpty() || lastName.getText().isEmpty() || email.getText().isEmpty()) {
            Alert a = new Alert(Alert.AlertType.WARNING);
            a.setContentText("Některé údaje nebyly vyplněny.");
            a.showAndWait();
            return;
        }

        try {
            db.register(login.getText(), password.getText(), firstName.getText(), lastName.getText(), email.getText());

            Alert a = new Alert(Alert.AlertType.INFORMATION);
            a.setContentText("Registrace byla úspěšná.");
            a.showAndWait();
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        close();
    }

}
