package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.User;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.stage.FileChooser;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Profile extends Module<Profile, Root> implements Initializable {

    private DatabaseManager db;
    private boolean edit = false;

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
    private JFXButton btnEdit;
    @FXML
    private Label type;

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
        User user = db.getUser();

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

    @FXML
    private void changeAvatar(MouseEvent event) throws FileNotFoundException {
        FileChooser f = new FileChooser();
        File file = f.showOpenDialog(callback.getStage());

        if (file.exists()) {
            if (checkType(file.getName())) {
                Image image = new Image(new FileInputStream(file));
                avatar.setImage(image);

                try {
                    db.editImage(avatar.getImage());
                } catch (SQLException | IOException ex) {
                    Alert a = new Alert(Alert.AlertType.INFORMATION);
                    a.setContentText("Nastala chyba při změně avataru.");
                    a.showAndWait();
                    return;
                }

                Alert a = new Alert(Alert.AlertType.INFORMATION);
                a.setContentText("Avatar byl úspěšně změněn.");
                a.showAndWait();
            }
        }
    }

    private String getFileExtension(String fileName) {
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return null; // empty extension
        }
        return fileName.substring(lastIndexOf + 1);
    }

    private boolean checkType(String file) {

        String ext = getFileExtension(file);

        switch (ext) {
            case "png":
            case "jpg":
            case "jpeg":
                return true;
            default:
                return false;
        }
    }

    private void lock() {
        firstName.setEditable(edit);
        lastName.setEditable(edit);
        email.setEditable(edit);
        phone.setEditable(edit);
        address.setEditable(edit);
    }

    @FXML
    private void edit(ActionEvent event) {

        if (edit) {
            Alert a = new Alert(Alert.AlertType.INFORMATION);
            a.setContentText("Profil byl úspěšně upraven.");
            a.showAndWait();
            edit = false;
            btnEdit.setText("Upravit");
            lock();
        } else {
            edit = true;
            btnEdit.setText("Potvrdit");
            lock();
        }
    }

    @FXML
    private void changeLogin(ActionEvent event) {
    }
}
