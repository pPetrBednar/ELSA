package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.Message;
import elsa.database.StudyMaterial;
import elsa.database.User;
import elsa.screen.AddMessage;
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
public class Chat extends Module<Chat, Root> implements Initializable {

    private DatabaseManager db;
    private User recipient;

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

    private AnchorPane createLabel(Message s) {

        if (db.getUser().getId() == s.getSender().getId()) {

            AnchorPane ap = new AnchorPane();
            ap.setMinHeight(100);

            Label l1 = new Label(s.getSender().getFirstName() + " " + s.getSender().getLastName());
            l1.setAlignment(Pos.CENTER);
            l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-background-color: rgba(0, 0, 0, 0.2)");
            l1.setPrefHeight(30);
            l1.setPrefWidth(200);
            AnchorPane.setTopAnchor(l1, 10.0);
            AnchorPane.setRightAnchor(l1, 0.0);

            Label l2 = new Label(s.getText());
            l2.setAlignment(Pos.CENTER_RIGHT);
            l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 16px 0px 16px; -fx-background-color: rgba(0, 0, 0, 0.1)");
            AnchorPane.setTopAnchor(l2, 40.0);
            AnchorPane.setLeftAnchor(l2, 300.0);
            AnchorPane.setBottomAnchor(l2, 0.0);
            AnchorPane.setRightAnchor(l2, 0.0);

            Label l7 = new Label(StudyMaterial.DATE_FORMAT.format(s.getDate()));
            l7.setAlignment(Pos.CENTER_LEFT);
            l7.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l7.setPrefHeight(30);

            AnchorPane.setLeftAnchor(l7, 300.0);
            AnchorPane.setTopAnchor(l7, 10.0);
            AnchorPane.setRightAnchor(l7, 275.0);

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefHeight(30);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 10.0);
            AnchorPane.setRightAnchor(l5, 200.0);

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeMessage(s);
                }
            });

            ap.getChildren().addAll(l1, l2, l7, l5);
            return ap;
        } else {

            if (recipient == null) {
                recipient = s.getSender();
            }

            AnchorPane ap = new AnchorPane();
            ap.setMinHeight(100);

            Label l1 = new Label(s.getSender().getFirstName() + " " + s.getSender().getLastName());
            l1.setAlignment(Pos.CENTER);
            l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-background-color: rgba(0, 0, 0, 0.2)");
            l1.getStyleClass().add("hover-effect-15");
            l1.setPrefHeight(30);
            l1.setPrefWidth(200);
            AnchorPane.setTopAnchor(l1, 10.0);
            AnchorPane.setLeftAnchor(l1, 0.0);

            Label l2 = new Label(s.getText());
            l2.setAlignment(Pos.CENTER_LEFT);
            l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 16px 0px 16px; -fx-background-color: rgba(0, 0, 0, 0.1)");
            AnchorPane.setTopAnchor(l2, 40.0);
            AnchorPane.setLeftAnchor(l2, 0.0);
            AnchorPane.setBottomAnchor(l2, 0.0);
            AnchorPane.setRightAnchor(l2, 300.0);

            l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    openUser(s.getSender().getId());
                }
            });

            Label l7 = new Label(StudyMaterial.DATE_FORMAT.format(s.getDate()));
            l7.setAlignment(Pos.CENTER_RIGHT);
            l7.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l7.setPrefHeight(30);

            AnchorPane.setLeftAnchor(l7, 200.0);
            AnchorPane.setTopAnchor(l7, 10.0);
            AnchorPane.setRightAnchor(l7, 300.0);

            ap.getChildren().addAll(l1, l2, l7);
            return ap;
        }
    }

    private void openUser(Integer s) {
        db.setSelectedPublicProfile(new User(s));
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private void removeMessage(Message s) {

        try {
            db.removeMessage(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.CHAT);
    }

    public void load(User s) {

        list.getChildren().clear();
        ArrayList<Message> data = null;
        try {
            data = db.getAllMessagesFromUser(s);
        } catch (SQLException ex) {
            // Logger.getLogger(Comments.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (data != null && !data.isEmpty()) {
            data.forEach((t) -> {
                list.getChildren().add(createLabel(t));
            });
        }
    }

    @FXML
    private void addComment(ActionEvent event) throws IOException {

        ScreenLoader<AddMessage> add = new ScreenLoader<>("AddMessage");
        add.setupStage("Odeslání zprávy", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setRecipient(recipient);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.CHAT);
    }
}
