package elsa.screen;

import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DBException;
import elsa.database.DatabaseManager;
import elsa.screen.handlers.Screen;
import elsa.screen.handlers.ScreenLoader;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Login extends Screen<Login> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField login;
    @FXML
    private JFXPasswordField password;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void setDb(DatabaseManager db) {
        this.db = db;
    }

    @FXML
    private void login(ActionEvent event) {

        if (login.getText().isEmpty() || password.getText().isEmpty()) {
            return;
        }

        try {
            db.login(login.getText(), password.getText());
            close();
        } catch (SQLException | IOException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DBException ex) {
            Alert a = new Alert(Alert.AlertType.ERROR);
            a.setContentText(ex.getMessage());
            a.showAndWait();
        }
    }

    @FXML
    private void exit(ActionEvent event) {
        close();
    }

    @FXML
    private void register(ActionEvent event) throws IOException {
        ScreenLoader<Register> reg = new ScreenLoader<>("Register");
        reg.setupStage("Login", stage, Modality.WINDOW_MODAL);
        reg.setTransparent(true);
        reg.getController().setDb(db);
        reg.getStage().showAndWait();
    }

}
