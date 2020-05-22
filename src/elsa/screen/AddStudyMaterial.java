package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.StudyMaterial;
import elsa.screen.handlers.Screen;
import java.io.File;
import java.io.FileNotFoundException;
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
import javafx.scene.layout.StackPane;
import javafx.stage.FileChooser;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddStudyMaterial extends Screen<AddStudyMaterial> implements Initializable {

    private DatabaseManager db;
    private File selectedFile;
    private boolean edit = false;
    private Integer id;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextArea description;
    @FXML
    private StackPane fileBox;
    @FXML
    private JFXButton btnAdd;
    @FXML
    private JFXTextField pages;

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

        if (title.getText().isEmpty() || pages.getText().isEmpty()) {
            Alert a = new Alert(Alert.AlertType.WARNING);
            a.setContentText("Některé údaje nebyly vyplněny.");
            a.showAndWait();
            return;
        }

        Integer p = null;
        try {
            p = Integer.parseInt(pages.getText());
        } catch (NumberFormatException ex) {
            Alert a = new Alert(Alert.AlertType.WARNING);
            a.setContentText("Počet stran není číslo.");
            a.showAndWait();
            return;
        }

        if (edit) {
            try {
                db.editStudyMaterial(id, title.getText(), p, description.getText(), selectedFile);

                Alert a = new Alert(Alert.AlertType.INFORMATION);
                a.setContentText("Úprava studijního materiálu byla úspěšná.");
                a.showAndWait();
            } catch (SQLException ex) {
                //Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Při úpravě došlo k chybě.");
                a.showAndWait();
            } catch (FileNotFoundException ex) {
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Soubor nenalezen.");
                a.showAndWait();
            }

        } else {
            try {
                db.addStudyMaterial(title.getText(), p, description.getText(), selectedFile);

                Alert a = new Alert(Alert.AlertType.INFORMATION);
                a.setContentText("Vložení studijního materiálu bylo úspěšné.");
                a.showAndWait();
            } catch (SQLException ex) {
                //Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Při vložení došlo k chybě.");
                a.showAndWait();
            } catch (FileNotFoundException ex) {
                Alert a = new Alert(Alert.AlertType.WARNING);
                a.setContentText("Soubor nenalezen.");
                a.showAndWait();
            }
        }
        close();
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

    public void load(StudyMaterial s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        pages.setText(s.getPages().toString());
        description.setText(s.getDescription());
        id = s.getId();
    }

}
