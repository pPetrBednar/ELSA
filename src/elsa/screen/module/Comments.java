package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.Comment;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.StudyMaterial;
import elsa.database.User;
import elsa.screen.AddComment;
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
public class Comments extends Module<Comments, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private VBox list;
    @FXML
    private JFXButton btnAddComment;

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

    private AnchorPane createLabel(Comment s, int number) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(150);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label id = new Label(number + ".");
        id.setAlignment(Pos.CENTER);
        id.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-background-color: rgba(0, 0, 0, 0.2)");
        id.setPrefWidth(20);
        AnchorPane.setTopAnchor(id, 5.0);
        AnchorPane.setLeftAnchor(id, 5.0);

        Label l1 = new Label(s.getText());
        l1.setAlignment(Pos.CENTER);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 16px 0px 16px;");
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);
        AnchorPane.setRightAnchor(l1, 300.0);

        Label l6 = new Label(s.getCreatedBy());
        l6.setAlignment(Pos.CENTER);
        l6.setPrefWidth(150);
        l6.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l6.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l6, 0.0);
        AnchorPane.setBottomAnchor(l6, 100.0);
        AnchorPane.setRightAnchor(l6, 0.0);

        l6.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s.getCreatedById());
            }
        });

        Label l7 = new Label("Přidáno: " + StudyMaterial.DATE_FORMAT.format(s.getCreated()));
        l7.setAlignment(Pos.CENTER);
        l7.setPrefWidth(300);
        l7.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l7.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l7, 50.0);
        AnchorPane.setBottomAnchor(l7, 50.0);
        AnchorPane.setRightAnchor(l7, 0.0);

        Label l8 = new Label("Upraveno: " + StudyMaterial.DATE_FORMAT.format(s.getChanged()));
        l8.setAlignment(Pos.CENTER);
        l8.setPrefWidth(300);
        l8.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l8.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l8, 100.0);
        AnchorPane.setBottomAnchor(l8, 0.0);
        AnchorPane.setRightAnchor(l8, 0.0);

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || db.getUser().getId().equals(s.getCreatedById())) {

            Label l4 = new Label("Upravit");
            l4.setAlignment(Pos.CENTER);
            l4.setPrefWidth(75);
            l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l4.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l4, 0.0);
            AnchorPane.setBottomAnchor(l4, 100.0);
            AnchorPane.setRightAnchor(l4, 225.0);

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 0.0);
            AnchorPane.setBottomAnchor(l5, 100.0);
            AnchorPane.setRightAnchor(l5, 150.0);

            l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    editComment(s);
                }
            });

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeComment(s);
                }
            });

            ap.getChildren().addAll(id, l1, l6, l7, l8, l4, l5);

        } else if ((db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 0.0);
            AnchorPane.setBottomAnchor(l5, 100.0);
            AnchorPane.setRightAnchor(l5, 150.0);

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeComment(s);
                }
            });

            ap.getChildren().addAll(id, l1, l6, l7, l8, l5);
        } else {

            ap.getChildren().addAll(id, l1, l6, l7, l8);

        }

        return ap;
    }

    private void openUser(Integer s) {
        db.setSelectedPublicProfile(new User(s));
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private void editComment(Comment s) {

        try {
            ScreenLoader<AddComment> add = new ScreenLoader<>("AddComment");
            add.setupStage("Úprava komentáře", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.COMMENTS);
        } catch (IOException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeComment(Comment s) {

        try {
            db.removeComment(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.COMMENTS);
    }

    public void load(StudyMaterial s) {

        list.getChildren().clear();
        ArrayList<Comment> data = null;
        try {
            data = db.getAllCommentsOfStudyMaterial(s.getId());
        } catch (SQLException ex) {
            // Logger.getLogger(Comments.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (data != null && !data.isEmpty()) {
            int i = data.size();
            for (Comment t : data) {
                list.getChildren().add(createLabel(t, i--));
            }
        }
    }

    @FXML
    private void addComment(ActionEvent event) throws IOException {

        ScreenLoader<AddComment> add = new ScreenLoader<>("AddComment");
        add.setupStage("Vložení komentáře", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.COMMENTS);
    }
}
