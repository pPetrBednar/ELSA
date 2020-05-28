package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Quiz;
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
public class AddQuiz extends Screen<AddQuiz> implements Initializable {

    private DatabaseManager db;
    private boolean edit = false;
    private Integer id;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextArea description;
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

        if (edit) {
            try {
                db.editQuiz(id, title.getText(), description.getText());

                Information.display("Úprava kvízu úspěšná.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při úpravě došlo k chybě.");
            }
        } else {
            try {
                db.addQuiz(title.getText(), description.getText());

                Information.display("Vložení kvízu úspěšné.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při vložení došlo k chybě.");
            }
        }
        close();
    }

    public void load(Quiz s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        description.setText(s.getDescription());
        id = s.getId();
    }

}
