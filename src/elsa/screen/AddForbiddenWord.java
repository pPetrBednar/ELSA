package elsa.screen;

import com.jfoenix.controls.JFXButton;
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
public class AddForbiddenWord extends Screen<AddForbiddenWord> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField title;

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

        if (title.getText().isEmpty()) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        try {
            db.addForbiddenWord(title.getText());

            Information.display("Vložení nevhodného slova úspěšné.");
        } catch (SQLException ex) {
            // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
            Information.display("Při vložení došlo k chybě.");
        }

        close();
    }
}
