package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import elsa.database.CloudFile;
import elsa.database.DatabaseManager;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.io.File;
import java.io.FileNotFoundException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.FileChooser;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddCloudFile extends Screen<AddCloudFile> implements Initializable {

    private DatabaseManager db;

    @FXML
    private JFXTextField title;

    private boolean edit = false;
    private Integer id;
    private File selectedFile;

    @FXML
    private JFXButton btnAdd;
    @FXML
    private StackPane fileBox;

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

        if (edit) {

            if (title.getText().isEmpty()) {
                Information.display("Některé údaje nebyly vyplněny.");
                return;
            }

            try {
                db.editCloudFile(id, title.getText());

                Information.display("Úprava názvu úspěšná.");
            } catch (SQLException ex) {
                Information.display("Při úpravě došlo k chybě.");
            }

        } else {

            if (title.getText().isEmpty() || selectedFile == null) {
                Information.display("Některé údaje nebyly vyplněny.");
                return;
            }

            try {
                db.addCloudFile(title.getText(), selectedFile);

                Information.display("Vložení nového souboru bylo úspěšné.");
            } catch (SQLException ex) {
                Information.display("Při vložení došlo k chybě.");
            } catch (FileNotFoundException ex) {
                Information.display("Při vložení došlo k chybě.");
            }
        }
        close();
    }

    public void load(CloudFile s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        fileBox.setDisable(true);
        id = s.getId();
    }

    @FXML
    private void addFile(ActionEvent event) {
        FileChooser f = new FileChooser();
        File file = f.showOpenDialog(stage);

        if (file.exists()) {
            selectedFile = file;

            Label l = new Label(file.getName());
            l.setStyle("-fx-text-fill: #ffffffd5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            fileBox.getChildren().clear();
            fileBox.getChildren().add(l);
        }
    }
}
