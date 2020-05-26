package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import elsa.database.Comment;
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
public class AddComment extends Screen<AddComment> implements Initializable {

    private DatabaseManager db;
    private boolean edit = false;
    private Integer id;

    @FXML
    private JFXButton btnAdd;
    @FXML
    private JFXTextArea comment;

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

        if (comment.getText().isEmpty()) {
            Information.display("Nic nebylo vyplněno.");
            return;
        }

        if (edit) {
            try {
                db.editComment(id, comment.getText());

                Information.display("Úprava komentáře úspěšná.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při úpravě došlo k chybě.");
            }
        } else {
            try {
                db.addComment(comment.getText());

                Information.display("Vložení komentáře úspěšné.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při vložení došlo k chybě.");
            }
        }
        close();
    }

    public void load(Comment s) {
        edit = true;
        btnAdd.setText("Upravit");

        comment.setText(s.getText());
        id = s.getId();
    }
}
