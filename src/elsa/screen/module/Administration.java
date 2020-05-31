package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.AddSubject;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.ViewType;
import java.io.IOException;
import java.net.URL;
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
public class Administration extends Module<Administration, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private VBox list;
    private JFXButton btnAddSubject;

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

    private AnchorPane createLabel(User s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(70);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l2 = new Label(s.getFirstName() + " " + s.getLastName() + "(" + s.getLogin() + ")\nOprávnění: " + s.getPermission().name());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 0.0);
        AnchorPane.setRightAnchor(l2, 150.0);
        
        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s);
            }
        });

        Label l4 = new Label("Upravit");
        l4.setAlignment(Pos.CENTER);
        l4.setPrefWidth(75);
        l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l4.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l4, 0.0);
        AnchorPane.setBottomAnchor(l4, 0.0);
        AnchorPane.setRightAnchor(l4, 75.0);

        Label l5 = new Label("Odebrat");
        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(75);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l5.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l5, 0.0);
        AnchorPane.setBottomAnchor(l5, 0.0);
        AnchorPane.setRightAnchor(l5, 0.0);

        l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                editUser(s);
            }
        });

        l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                removeUser(s);
            }
        });

        ap.getChildren().addAll(l2, l4, l5);

        return ap;
    }
    
    private void openUser(User s) {
        db.setSelectedPublicProfile(s);
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private void editUser(User s) {

        /*  try {
            ScreenLoader<AddSubject> add = new ScreenLoader<>("AddSubject");
            add.setupStage("Úprava předmětu", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.ALL_SUBJECTS);
        } catch (IOException ex) {
            Logger.getLogger(Administration.class.getName()).log(Level.SEVERE, null, ex);
        }*/
    }

    private void removeUser(User s) {

        /*  try {
            db.removeSubject(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.ALL_SUBJECTS);*/
    }

    public void load() {

        list.getChildren().clear();

        try {
            ArrayList<User> data = db.getAllUsers();

            if (data != null && !data.isEmpty()) {
                data.forEach((t) -> {
                    list.getChildren().add(createLabel(t));
                });
            }
        } catch (SQLException ex) {
            Logger.getLogger(Administration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
