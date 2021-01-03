package elsa.screen;

import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
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
public class EditProfile extends Screen<EditProfile> implements Initializable {
    
    private DatabaseManager db;
    
    @FXML
    private JFXTextField login;
    @FXML
    private JFXPasswordField password;
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
    
    public void load() {
        login.setText(db.getUser().getLogin());
    }
    
    @FXML
    private void exit(ActionEvent event) {
        close();
    }
    
    @FXML
    private void edit(ActionEvent event) {
        
        if (!password.getText().isEmpty()) {
            if (!password.getText().equals(passwordAgain.getText())) {
                Information.display("Hesla se neshodují.");
                return;
            }
        }
        
        if (login.getText().isEmpty()) {
            Information.display("Přihlašovací jméno nebylo vyplněno.");
            return;
        }
        
        try {
            db.editLoginInformation(login.getText(), password.getText());
            Information.display("Úprava údajů byla úspěšná.");
        } catch (SQLException ex) {
            // Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);

            Information.display("Úprava údajů byla neúspěšná.");
        }
        close();
    }
    
}
