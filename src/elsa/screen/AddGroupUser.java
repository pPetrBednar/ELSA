package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import elsa.database.DatabaseManager;
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
public class AddGroupUser extends Screen<AddGroupUser> implements Initializable {

    private DatabaseManager db;

    private ArrayList<User> users;

    @FXML
    private JFXButton btnAdd;
    @FXML
    private JFXComboBox<User> user;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }

    public void setDb(DatabaseManager db) {
        this.db = db;

        try {
            users = db.getAllUsers();
            user.setItems(FXCollections.observableArrayList(users));
            user.getSelectionModel().select(0);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        user.setConverter(new StringConverter<User>() {
            @Override
            public String toString(User object) {
                return object.getFirstName() + " " + object.getLastName();
            }

            @Override
            public User fromString(String string) {
                for (User t : users) {
                    if ((t.getFirstName() + " " + t.getLastName()).equals(string)) {
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

        if (user.getSelectionModel().getSelectedItem() == null) {
            Information.display("Nic nebylo vyplněno.");
            return;
        }

        try {
            db.addUserToGroup(db.getSelectedGroup(), user.getValue());
            Information.display("Uživatel přidán do skupiny.");
        } catch (SQLException ex) {
            Information.display("Při vložení došlo k chybě.");
        }
        close();
    }
}
