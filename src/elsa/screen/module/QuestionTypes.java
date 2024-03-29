package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.QuestionType;
import elsa.screen.AddType;
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
public class QuestionTypes extends Module<QuestionTypes, Root> implements Initializable {

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

    private AnchorPane createLabel(QuestionType s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(100);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getShortcut());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.setPrefWidth(200);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 50.0);

        Label l2 = new Label(s.getText());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 200.0);
        AnchorPane.setBottomAnchor(l2, 50.0);
        AnchorPane.setRightAnchor(l2, 150.0);

        Label l3 = new Label(s.getDescription());
        l3.setAlignment(Pos.CENTER_LEFT);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l3, 50.0);
        AnchorPane.setLeftAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 0.0);

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

        l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                editQuestionType(s);
            }
        });

        l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                removeQuestionType(s);
            }
        });

        ap.getChildren().addAll(l1, l2, l3, l4, l5);

        return ap;
    }

    private void editQuestionType(QuestionType s) {

        try {
            ScreenLoader<AddType> add = new ScreenLoader<>("AddType");
            add.setupStage("Úprava druhu otázky", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.QUESTION_TYPES);
        } catch (IOException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeQuestionType(QuestionType s) {

        try {
            db.deleteQuestionType(s);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.QUESTION_TYPES);
    }

    public void load() {

        list.getChildren().clear();

        try {
            ArrayList<QuestionType> data = db.getAllQuestionTypes();

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
        ScreenLoader<AddType> add = new ScreenLoader<>("AddType");
        add.setupStage("Vložení druhu otázky", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getController().load(1);
        add.getStage().showAndWait();

        callback.compose(ViewType.QUESTION_TYPES);
    }
}
