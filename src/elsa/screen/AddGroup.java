package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Group;
import elsa.database.Subject;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.net.URL;
import java.sql.SQLException;
import java.text.ParseException;
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
public class AddGroup extends Screen<AddGroup> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextField year;

    private boolean edit = false;
    private Integer id;
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

        if (title.getText().isEmpty() || year.getText().isEmpty()) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        try {
            Integer.parseInt(year.getText());
        } catch (NumberFormatException e) {
            Information.display("Rok studia musí být číslo.");
            return;
        }

        if (edit) {
            try {
                db.editGroup(id, year.getText(), title.getText());

                Information.display("Úprava skupiny úspěšná.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při úpravě došlo k chybě.");
            }

        } else {
            try {
                db.addGroup(year.getText(), title.getText());

                Information.display("Vložení skupiny úspěšné.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při vložení došlo k chybě.");
            }
        }
        close();
    }

    public void load(Group s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        year.setText(s.getYear());
        id = s.getId();
    }
}
