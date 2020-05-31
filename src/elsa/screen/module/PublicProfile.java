package elsa.screen.module;

import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.User;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class PublicProfile extends Module<PublicProfile, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private ImageView avatar;
    @FXML
    private JFXTextField firstName;
    @FXML
    private JFXTextField lastName;
    @FXML
    private JFXTextField email;
    @FXML
    private JFXTextField phone;
    @FXML
    private JFXTextField address;
    @FXML
    private Label type;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        lock();
    }

    public void setDb(DatabaseManager db) {
        this.db = db;
    }

    public void load() {
        User user = null;
        try {
            user = db.getPublicUserData();
        } catch (SQLException ex) {
            Logger.getLogger(PublicProfile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PublicProfile.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (user == null) {
            return;
        }

        firstName.setText(user.getFirstName());
        lastName.setText(user.getLastName());
        email.setText(user.getEmail());
        phone.setText(user.getPhone());
        address.setText(user.getAddress());
        type.setText(user.getPermission().getText());
        avatar.setImage(user.getAvatar());
    }

    private void lock() {
        firstName.setEditable(false);
        lastName.setEditable(false);
        email.setEditable(false);
        phone.setEditable(false);
        address.setEditable(false);
    }
}
