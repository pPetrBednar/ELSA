package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextArea;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.Question;
import elsa.database.Quiz;
import elsa.database.User;
import elsa.screen.AddQuestion;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.awt.Toolkit;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class QuizView extends Module<QuizView, Root> implements Initializable {

    private DatabaseManager db;
    private HashMap<Integer, String> answers = new HashMap<>();
    private Quiz selectedQuiz;

    @FXML
    private Label title;
    @FXML
    private Label description;
    @FXML
    private VBox materialsList;
    @FXML
    private JFXButton btnAddQuestion;
    @FXML
    private ScrollPane scrollPane;

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

    private VBox createLabel(Question s) {

        VBox vb = new VBox();
        vb.setFillWidth(true);

        HBox hb = new HBox();
        hb.setAlignment(Pos.CENTER_RIGHT);

        Label tq = new Label();
        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || db.getUser().getPermission() == Permission.TEACHER) {
            tq.setText(s.getQ() + "\n\nSprávná odpověď:\n" + s.getA());
        } else {
            tq.setText(s.getQ());
        }

        tq.setStyle("-fx-background-color: rgba(0, 0, 0, 0.1); -fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 16px 16px 16px;");
        tq.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());
        tq.setFocusTraversable(false);

        Label lq = new Label("Otázka:");
        lq.setAlignment(Pos.CENTER_LEFT);
        lq.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        lq.setUnderline(true);

        JFXTextArea ta = new JFXTextArea();
        ta.setStyle("-fx-background: rgba(0, 0, 0, 0.1); -fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 16px 16px 16px;");

        ta.textProperty().addListener((observable, oldValue, newValue) -> {
            answers.put(s.getId(), newValue);
        });
        ta.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());
        ta.setFocusTraversable(false);

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

        Label l3 = new Label(s.getCreatedBy());
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(250);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 4px 8px 4px 8px;");
        l3.getStyleClass().add("hover-effect-15");

        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s.getCreatedById());
            }
        });

        Label l6 = new Label();
        l6.setPrefHeight(30);

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {

            Label l4 = new Label("Upravit");
            l4.setAlignment(Pos.CENTER);
            l4.setPrefWidth(75);
            l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 4px 8px 4px 8px;");
            l4.getStyleClass().add("hover-effect-15");

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 4px 8px 4px 8px;");
            l5.getStyleClass().add("hover-effect-15");

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
            hb.getChildren().addAll(l3, l4, l5);
            vb.getChildren().addAll(l2, hb, lq, tq, la, ta, l6);
        } else {
            hb.getChildren().addAll(l3);
            vb.getChildren().addAll(l2, hb, lq, tq, la, ta, l6);
        }

        return vb;
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

        int points = 0;
        for (Question t : selectedQuiz.getQuestions()) {
            if (answers.get(t.getId()).equals(t.getA())) {
                points += t.getPoints();
            }
        }

        try {
            db.submitAnswers(selectedQuiz.getId(), points, answers);
            Information.display("Odpovědi odeslány.\nHodnocení můžete naleznout v sekci zobrazení předmětu pomocí tlačítka klasifikace.");
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
            Information.display("Nastala chyba při odesílání.");
        }

        callback.compose(ViewType.STUDY_MATERIAL_VIEW);
    }

    public void load(Quiz s) {

        selectedQuiz = null;
        materialsList.getChildren().clear();
        answers.clear();

        selectedQuiz = s;

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {
            btnAddQuestion.setVisible(true);
        } else {
            btnAddQuestion.setVisible(false);
        }

        title.setText(selectedQuiz.getTitle());
        description.setText(selectedQuiz.getDescription());

        try {
            selectedQuiz.setQuestions(db.getAllQuestionsForQuiz(selectedQuiz));
        } catch (SQLException ex) {
            Logger.getLogger(QuizView.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (selectedQuiz.getQuestions() != null) {
            selectedQuiz.getQuestions().forEach((t) -> {
                answers.put(t.getId(), "");
                materialsList.getChildren().add(createLabel(t));
            });

            if (s.getQuestions().size() > 0) {

                boolean completed = true;
                try {
                    completed = db.checkIfQuizCompleted(s);
                } catch (SQLException ex) {
                    Logger.getLogger(QuizView.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (!completed) {
                    JFXButton submit = new JFXButton("Odeslat");
                    submit.setAlignment(Pos.CENTER);
                    submit.setFocusTraversable(false);
                    submit.setPrefSize(200, 50);
                    submit.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 0px 16px 0px;");
                    submit.getStyleClass().add("btn-submit-quiz");
                    submit.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());

                    submit.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                        if (e.getButton() == MouseButton.PRIMARY) {
                            submitAnswers();
                        }
                    });
                    materialsList.getChildren().add(submit);
                } else {
                    JFXButton submit = new JFXButton("Řešení již odesláno, kliknutím přejdete do klasifikace.");
                    submit.setAlignment(Pos.CENTER);
                    submit.setFocusTraversable(false);
                    submit.setPrefSize(200, 50);
                    submit.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 16px 0px 16px 0px;");
                    submit.getStyleClass().add("btn-submit-quiz");
                    submit.setMaxWidth(Toolkit.getDefaultToolkit().getScreenSize().getWidth());

                    submit.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                        if (e.getButton() == MouseButton.PRIMARY) {
                            openEvaluation();
                        }
                    });
                    materialsList.getChildren().add(submit);
                }
            }
        }

        scrollPane.setVvalue(0);

    }

    private void openEvaluation() {
        db.setSelectedEvaluationUser(db.getUser());
        callback.compose(ViewType.EVALUATED_QUIZES);
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
