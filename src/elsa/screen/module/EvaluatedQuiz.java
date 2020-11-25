package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import elsa.database.DatabaseManager;
import elsa.database.EvaluatedQuestionData;
import elsa.database.EvaluatedQuizData;
import elsa.database.Permission;
import elsa.database.User;
import elsa.screen.ChangePermission;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.awt.Toolkit;
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
public class EvaluatedQuiz extends Module<EvaluatedQuiz, Root> implements Initializable {

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

    private VBox createLabel(EvaluatedQuestionData s) {

        VBox vb = new VBox();
        vb.setFillWidth(true);

        Label tq = new Label();
        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || db.getUser().getPermission() == Permission.TEACHER) {
            tq.setText(s.getQuestion() + "\n\nSprávná odpověď:\n" + s.getAnswerOriginal());
        } else {
            tq.setText(s.getQuestion());
        }

        tq.setStyle("-fx-background-color: rgba(0, 0, 0, 0.1); -fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 16px 16px 16px;");
        tq.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());

        Label lq = new Label("Otázka:");
        lq.setAlignment(Pos.CENTER_LEFT);
        lq.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        lq.setUnderline(true);

        Label ta = new Label();
        ta.setStyle("-fx-background-color: rgba(0, 0, 0, 0.1); -fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 16px 16px 16px;");
        ta.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());
        ta.setText(s.getAnswer());

        Label la = new Label("Odpověď:");
        la.setAlignment(Pos.CENTER_LEFT);
        la.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        la.setUnderline(true);

        Label l2 = new Label(s.getTitle());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 17px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                Information.display(s.getType().getDescription());
            }
        });

        Label l3 = new Label();
        l3.setPrefHeight(30);

        vb.getChildren().addAll(l2, lq, tq, la, ta, l3);
        return vb;
    }

    public void load(EvaluatedQuizData s) {

        list.getChildren().clear();

        try {
            EvaluatedQuizData data = db.getEvaluatedQuestionsOfQuiz(s);

            if (data != null && data.getQuestions() != null && !data.getQuestions().isEmpty()) {
                data.getQuestions().forEach((t) -> {
                    list.getChildren().add(createLabel(t));
                });
            }
        } catch (SQLException ex) {
            Logger.getLogger(Administration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
