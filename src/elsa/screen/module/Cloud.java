package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.CloudFile;
import elsa.database.StudyMaterial;
import elsa.screen.AddCloudFile;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Cloud extends Module<Cloud, Root> implements Initializable {
    
    private DatabaseManager db;
    
    @FXML
    private VBox list;
    private JFXButton btnAddSubject;
    @FXML
    private JFXButton btnAddQuestionType;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }
    
    public void setDb(DatabaseManager db) {
        this.db = db;
    }
    
    private AnchorPane createLabel(CloudFile s) {
        
        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(100);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");
        
        Label l1 = new Label(s.getTitle());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.setPrefWidth(200);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 50.0);
        
        Label l2 = new Label("Nahráno: " + StudyMaterial.DATE_FORMAT.format(s.getUploaded()) + "\nUpraveno: " + StudyMaterial.DATE_FORMAT.format(s.getEdited()));
        l2.setAlignment(Pos.CENTER_RIGHT);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 16px 0px 16px;");
        
        AnchorPane.setTopAnchor(l2, 50.0);
        AnchorPane.setLeftAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 0.0);
        AnchorPane.setRightAnchor(l2, 0.0);
        
        Label l3 = new Label("Otevřít");
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(75);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l3.getStyleClass().add("hover-effect-15");
        
        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 50.0);
        AnchorPane.setRightAnchor(l3, 150.0);
        
        Label l4 = new Label("Upravit");
        l4.setAlignment(Pos.CENTER);
        l4.setPrefWidth(75);
        l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l4.getStyleClass().add("hover-effect-15");
        
        AnchorPane.setTopAnchor(l4, 0.0);
        AnchorPane.setBottomAnchor(l4, 50.0);
        AnchorPane.setRightAnchor(l4, 75.0);
        
        Label l5 = new Label("Odebrat");
        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(75);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l5.getStyleClass().add("hover-effect-15");
        
        AnchorPane.setTopAnchor(l5, 0.0);
        AnchorPane.setBottomAnchor(l5, 50.0);
        AnchorPane.setRightAnchor(l5, 0.0);
        
        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openFile(s);
            }
        });
        
        l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                editFile(s);
            }
        });
        
        l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                removeFile(s);
            }
        });
        
        ap.getChildren().addAll(l1, l2, l3, l4, l5);
        
        return ap;
    }
    
    private void openFile(CloudFile s) {
        try {
            Blob blob = db.getFileFromCloudFile(s.getId());
            byte[] data = blob.getBytes(1, (int) blob.length());
            File f = new File(s.getTitle() + "." + s.getExtension());
            
            if (!f.exists()) {
                f.createNewFile();
            }
            
            FileOutputStream out = new FileOutputStream(f);
            out.write(data);
            out.close();
            
            Information.display("Soubor uložen a nyní bude otevřen.");
            
            Desktop.getDesktop().open(f);
        } catch (SQLException | IOException ex) {
            //Logger.getLogger(StudyMaterialView.class.getName()).log(Level.SEVERE, null, ex);
            Information.display("Soubor nemohl být uložen.");
        }
    }
    
    private void editFile(CloudFile s) {
        
        try {
            ScreenLoader<AddCloudFile> add = new ScreenLoader<>("AddCloudFile");
            add.setupStage("Vložení nového souboru do cloudu", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();
            
            callback.compose(ViewType.CLOUD);
        } catch (IOException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void removeFile(CloudFile s) {
        
        try {
            db.removeCloudFile(s);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        callback.compose(ViewType.CLOUD);
    }
    
    public void load() {
        
        list.getChildren().clear();
        
        try {
            ArrayList<CloudFile> data = db.getAllCloudFiles();
            
            if (data != null && !data.isEmpty()) {
                data.forEach((t) -> {
                    list.getChildren().add(createLabel(t));
                });
            }
        } catch (SQLException ex) {
            Logger.getLogger(MaterialTypes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @FXML
    private void addQuestionType(ActionEvent event) throws IOException {
        ScreenLoader<AddCloudFile> add = new ScreenLoader<>("AddCloudFile");
        add.setupStage("Vložení nového souboru do cloudu", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();
        
        callback.compose(ViewType.CLOUD);
    }
}
