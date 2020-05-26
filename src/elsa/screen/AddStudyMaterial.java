package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.QuestionType;
import elsa.database.StudyMaterial;
import elsa.database.StudyMaterialType;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.io.File;
import java.io.FileNotFoundException;
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
import javafx.geometry.Pos;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.FileChooser;
import javafx.util.StringConverter;

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

    private ArrayList<StudyMaterialType> types;
    private ArrayList<StudyMaterialType> selectedTypes;

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
    @FXML
    private VBox typeList;
    @FXML
    private JFXComboBox<StudyMaterialType> type;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        types = new ArrayList<>();
        selectedTypes = new ArrayList<>();
    }

    public void setDb(DatabaseManager db) {
        this.db = db;

        try {
            types = db.getAllStudyMaterialTypes();
            type.setItems(FXCollections.observableArrayList(types));
            type.getSelectionModel().select(1);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        type.setConverter(new StringConverter<StudyMaterialType>() {
            @Override
            public String toString(StudyMaterialType object) {
                return object.getText();
            }

            @Override
            public StudyMaterialType fromString(String string) {
                for (StudyMaterialType t : types) {
                    if (t.getText().equals(string)) {
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

        if (title.getText().isEmpty() || pages.getText().isEmpty()) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        Integer p = null;
        try {
            p = Integer.parseInt(pages.getText());
        } catch (NumberFormatException ex) {
            Information.display("Počet stran není číslo.");
            return;
        }

        if (typeList.getChildren().isEmpty()) {
            Information.display("Studijní materiál musí mít alespoň jednu kategorii.");
            return;
        }

        if (edit) {
            try {
                db.editStudyMaterial(id, title.getText(), p, description.getText(), selectedFile);

                Information.display("Úprava studijního materiálu byla úspěšná.");
            } catch (SQLException ex) {
                //Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při úpravě došlo k chybě.");
            } catch (FileNotFoundException ex) {
                Information.display("Soubor nenalezen.");
            }

        } else {
            try {
                db.addStudyMaterial(title.getText(), p, description.getText(), selectedFile);

                Information.display("Vložení studijního materiálu bylo úspěšné.");
            } catch (SQLException ex) {
                //Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při vložení došlo k chybě.");
            } catch (FileNotFoundException ex) {
                Information.display("Soubor nenalezen.");
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

    private AnchorPane getLabelType(StudyMaterialType s) {
        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(30);
        ap.setStyle("-fx-border-color: rgba(255, 255, 255, 0.1);");

        Label l1 = new Label(s.getText());
        l1.setAlignment(Pos.CENTER);
        l1.setStyle("-fx-text-fill: #ffffffd5; -fx-font-size: 15px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l1.setPrefWidth(100);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);
        AnchorPane.setRightAnchor(l1, 50.0);

        JFXButton btn = new JFXButton("-");
        btn.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 15px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-background-color: white;");
        btn.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {

            selectedTypes.remove(s);
            refreshSelectedTypes();
        });
        AnchorPane.setRightAnchor(btn, 0.0);

        ap.getChildren().addAll(l1, btn);
        return ap;
    }

    private void refreshSelectedTypes() {

        typeList.getChildren().clear();

        selectedTypes.forEach((t) -> {
            typeList.getChildren().add(getLabelType(t));
        });
    }

    @FXML
    private void addType(ActionEvent event) {
        selectedTypes.add(type.getSelectionModel().getSelectedItem());
        refreshSelectedTypes();
    }

}
