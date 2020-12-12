package elsa.screen.module;

import elsa.database.DatabaseManager;
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
public class Communications extends Module<Communications, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private VBox list;

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
        ap.setPrefHeight(75);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getFirstName() + " " + s.getLastName());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.getStyleClass().add("hover-effect-15");
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);
        AnchorPane.setRightAnchor(l1, 0.0);

        l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openCommunication(s);
            }
        });

        ap.getChildren().addAll(l1);

        return ap;
    }

    private void openCommunication(User s) {

        db.setSelectedCommunication(s);
        callback.compose(ViewType.CHAT);
    }

    private void removeCommunication(User s) {

        /* try {
            db.deleteQuestionType(s);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.COMMUNICATIONS);*/
    }

    public void load() {

        list.getChildren().clear();

        try {
            ArrayList<User> data = db.getCommunications();

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
    private void addCommunication(ActionEvent event) throws IOException {
        ScreenLoader<AddMessage> add = new ScreenLoader<>("AddMessage");
        add.setupStage("Odeslání zprávy", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.COMMUNICATIONS);
    }
}
