package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.Question;
import elsa.database.Quiz;
import elsa.database.StudyMaterial;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.AddQuestion;
import elsa.screen.AddQuiz;
import elsa.screen.AddStudyMaterial;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Alert;
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
public class QuizView extends Module<QuizView, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private Label title;
    @FXML
    private Label description;
    @FXML
    private VBox materialsList;
    @FXML
    private JFXButton btnAddQuestion;

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

    private AnchorPane createLabel(Question s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(600);

        Label tq = new Label();
        AnchorPane.setTopAnchor(tq, 90.0);
        AnchorPane.setLeftAnchor(tq, 16.0);
        AnchorPane.setBottomAnchor(tq, 300.0);
        AnchorPane.setRightAnchor(tq, 16.0);
        tq.setText(s.getQ());
        tq.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 17px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 16px 16px 16px;");

        Label lq = new Label("Otázka:");
        lq.setAlignment(Pos.CENTER_LEFT);
        lq.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        lq.setUnderline(true);

        AnchorPane.setTopAnchor(lq, 60.0);
        AnchorPane.setLeftAnchor(lq, 0.0);

        JFXTextArea ta = new JFXTextArea();
        AnchorPane.setTopAnchor(ta, 350.0);
        AnchorPane.setLeftAnchor(ta, 16.0);
        AnchorPane.setBottomAnchor(ta, 60.0);
        AnchorPane.setRightAnchor(ta, 16.0);
        ta.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || db.getUser().getPermission() == Permission.TEACHER) {
            ta.setText(s.getA());
        }

        Label la = new Label("Odpověď:");
        la.setAlignment(Pos.CENTER_LEFT);
        la.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        la.setUnderline(true);

        AnchorPane.setTopAnchor(la, 320.0);
        AnchorPane.setLeftAnchor(la, 0.0);

        Label l2 = new Label(s.getTitle());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 550.0);
        AnchorPane.setRightAnchor(l2, 400.0);

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                Information.display(s.getType().getDescription());
            }
        });

        Label l3 = new Label(s.getCreatedBy());
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(250);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l3.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 550.0);
        AnchorPane.setRightAnchor(l3, 0.0);

        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s.getCreatedById());
            }
        });

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {

            Label l4 = new Label("Upravit");
            l4.setAlignment(Pos.CENTER);
            l4.setPrefWidth(75);
            l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l4.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l4, 0.0);
            AnchorPane.setBottomAnchor(l4, 550.0);
            AnchorPane.setRightAnchor(l4, 325.0);

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 0.0);
            AnchorPane.setBottomAnchor(l5, 550.0);
            AnchorPane.setRightAnchor(l5, 250.0);

            l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    editQuestion(s);
                }
            });

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeQuestion(s);
                }
            });

            ap.getChildren().addAll(l2, l3, l4, l5, lq, tq, la, ta);
        } else {
            ap.getChildren().addAll(l2, l3, lq, tq, la, ta);
        }

        return ap;
    }

    private void openUser(Integer s) {
        db.setSelectedPublicProfile(new User(s));
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private void editQuestion(Question s) {
        try {
            ScreenLoader<AddQuestion> add = new ScreenLoader<>("AddQuestion");
            add.setupStage("Úprava otázky", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.QUIZ_VIEW);
        } catch (IOException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeQuestion(Question s) {

        try {
            db.removeQuestion(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.QUIZ_VIEW);
    }

    private void submitAnswers() {
        Information.display("Nic nebylo odesláno.");
    }

    public void load(Quiz s) {

        materialsList.getChildren().clear();

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {
            btnAddQuestion.setVisible(true);
        } else {
            btnAddQuestion.setVisible(false);
        }

        title.setText(s.getTitle());
        description.setText(s.getDescription());

        try {
            s.setQuestions(db.getAllQuestionsForQuiz(s));
        } catch (SQLException ex) {
            Logger.getLogger(QuizView.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (s.getQuestions() != null) {
            s.getQuestions().forEach((t) -> {
                materialsList.getChildren().add(createLabel(t));
            });

            if (s.getQuestions().size() > 0) {

                AnchorPane ap = new AnchorPane();
                ap.prefHeight(100);

                JFXButton submit = new JFXButton("Odeslat");
                submit.setFocusTraversable(false);
                submit.setPrefSize(200, 50);
                submit.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
                submit.getStyleClass().add("btn-submit-quiz");

                AnchorPane.setTopAnchor(submit, 30.0);
                AnchorPane.setBottomAnchor(submit, 30.0);
                AnchorPane.setRightAnchor(submit, 16.0);
                AnchorPane.setLeftAnchor(submit, 16.0);

                submit.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                    if (e.getButton() == MouseButton.PRIMARY) {
                        submitAnswers();
                    }
                });
                ap.getChildren().add(submit);
                materialsList.getChildren().add(ap);
            }
        }

    }

    @FXML
    private void addQuestion(ActionEvent event) throws IOException {
        ScreenLoader<AddQuestion> add = new ScreenLoader<>("AddQuestion");
        add.setupStage("Vložení otázky", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.QUIZ_VIEW);
    }
}
