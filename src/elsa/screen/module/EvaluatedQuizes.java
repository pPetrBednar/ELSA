package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.EvaluatedQuizData;
import elsa.database.User;
import elsa.screen.ChangePermission;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class EvaluatedQuizes extends Module<EvaluatedQuizes, Root> implements Initializable {

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

    private AnchorPane createLabel(EvaluatedQuizData s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getTitle());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);
        AnchorPane.setRightAnchor(l1, 400.0);

        l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openEvaluatedQuiz(s);
            }
        });

        Label l4 = new Label("Bodů: " + s.getPoints() + "/" + s.getMaxPoints());
        l4.setAlignment(Pos.CENTER);
        l4.setPrefWidth(150);
        l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        AnchorPane.setTopAnchor(l4, 0.0);
        AnchorPane.setBottomAnchor(l4, 0.0);
        AnchorPane.setRightAnchor(l4, 250.0);

        Label l5;
        if (s.getPoints().equals(0) || s.getMaxPoints().equals(0)) {
            l5 = new Label("Hodnocení: 0%");
        } else {
            l5 = new Label("Hodnocení: " + (int) (s.getPoints().doubleValue() / s.getMaxPoints().doubleValue() * 100.0) + "%");
        }

        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(250);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        AnchorPane.setTopAnchor(l5, 0.0);
        AnchorPane.setBottomAnchor(l5, 0.0);
        AnchorPane.setRightAnchor(l5, 0.0);

        ap.getChildren().addAll(l1, l4, l5);

        return ap;
    }

    private void openEvaluatedQuiz(EvaluatedQuizData s) {

        db.setSelectedEvaluationQuiz(s);
        callback.compose(ViewType.EVALUATED_QUIZ);
    }

    public void load(User u) {

        list.getChildren().clear();

        try {
            ArrayList<EvaluatedQuizData> data = db.getEvaluatedQuizesOfUserFromSubject(u, db.getSelectedSubject());

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
