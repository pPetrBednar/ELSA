package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.ForbiddenWord;
import elsa.screen.AddForbiddenWord;
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
public class ForbiddenWords extends Module<ForbiddenWords, Root> implements Initializable {

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

    private AnchorPane createLabel(ForbiddenWord s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getText());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.setPrefWidth(200);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);

        Label l5 = new Label("Odebrat");
        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(75);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l5.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l5, 0.0);
        AnchorPane.setBottomAnchor(l5, 0.0);
        AnchorPane.setRightAnchor(l5, 0.0);

        l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                removeForbiddenWord(s);
            }
        });

        ap.getChildren().addAll(l1, l5);

        return ap;
    }

    private void removeForbiddenWord(ForbiddenWord s) {

        try {
            db.removeForbiddenWord(s);
        } catch (SQLException ex) {
            Logger.getLogger(QuestionTypes.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.FORBIDDEN_WORDS);
    }

    public void load() {

        list.getChildren().clear();

        try {
            ArrayList<ForbiddenWord> data = db.getAllForbiddenWords();

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
        ScreenLoader<AddForbiddenWord> add = new ScreenLoader<>("AddForbiddenWord");
        add.setupStage("Vložení nevhodného slova", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.FORBIDDEN_WORDS);
    }
}
