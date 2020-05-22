package elsa.screen.module;

import elsa.database.DatabaseManager;
import elsa.database.User;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Main extends Module<Main, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private Label title;

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

        if (user.getLastName().equals(" ")) {
            title.setText(user.getFirstName());
        } else {
            title.setText(user.getFirstName() + " " + user.getLastName());
        }
    }
}
