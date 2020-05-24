package elsa.screen;

import elsa.database.DBException;
import elsa.database.DatabaseManager;
import elsa.database.User;
import elsa.screen.handlers.ICompositor;
import elsa.screen.handlers.ModuleLoader;
import elsa.screen.handlers.Screen;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.module.AllSubjects;
import elsa.screen.module.Main;
import elsa.screen.module.MySubjects;
import elsa.screen.module.Profile;
import elsa.screen.module.QuizView;
import elsa.screen.module.StudyMaterialView;
import elsa.screen.module.SubjectView;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Root extends Screen<Root> implements Initializable {

    private final boolean TESTING = false;

    private Compositor compositor;
    private ScreenLoader<Login> login;

    private ModuleLoader<Main, Root> main;
    private ModuleLoader<Profile, Root> profile;
    private ModuleLoader<AllSubjects, Root> allSubjects;
    private ModuleLoader<MySubjects, Root> mySubjects;
    private ModuleLoader<SubjectView, Root> subjectView;
    private ModuleLoader<StudyMaterialView, Root> studyMaterialView;
    private ModuleLoader<QuizView, Root> quizView;

    private DatabaseManager db;
    @FXML
    private BorderPane box;
    @FXML
    private Label statusLabel;
    @FXML
    private Label statusContent;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

        compositor = new Compositor();
        try {
            db = new DatabaseManager();
        } catch (SQLException ex) {
            Information.display("Nelze připojit k databázi.");
            System.exit(0);
        }

        try {
            compositor.load();
        } catch (IOException ex) {
            Logger.getLogger(Root.class.getName()).log(Level.SEVERE, null, ex);
        }

        Platform.runLater(() -> {
            compositor.setup();
            compositor.viewType = ViewType.LOGIN;
            compositor.compose();
        });
    }

    @FXML
    private void mySubjects(ActionEvent event) {
        compositor.viewType = ViewType.MY_SUBJECTS;
        compositor.compose();
    }

    @FXML
    private void allSubjects(ActionEvent event) {
        compositor.viewType = ViewType.ALL_SUBJECTS;
        compositor.compose();
    }

    @FXML
    private void myAccount(ActionEvent event) {
        compositor.viewType = ViewType.PROFILE;
        compositor.compose();
    }

    @FXML
    private void logout(ActionEvent event) {
        compositor.viewType = ViewType.LOGIN;

        db.setUser(null);
        db.setSelectedSubject(null);
        db.setSelectedStudyMaterial(null);

        compositor.compose();
    }

    private class Compositor implements ICompositor {

        ViewType viewType;

        @Override
        public void load() throws IOException {
            login = new ScreenLoader<>("Login");
            main = new ModuleLoader<>("Main");
            profile = new ModuleLoader<>("Profile");
            allSubjects = new ModuleLoader<>("AllSubjects");
            mySubjects = new ModuleLoader<>("MySubjects");
            subjectView = new ModuleLoader<>("SubjectView");
            studyMaterialView = new ModuleLoader<>("StudyMaterialView");
            quizView = new ModuleLoader<>("QuizView");
        }

        @Override
        public void setup() {
            login.setupStage("Login", stage, Modality.WINDOW_MODAL);
            login.setTransparent(true);
            login.getController().setDb(db);

            main.setCallback(controller);
            main.getController().setDb(db);

            profile.setCallback(controller);
            profile.getController().setDb(db);

            allSubjects.setCallback(controller);
            allSubjects.getController().setDb(db);

            mySubjects.setCallback(controller);
            mySubjects.getController().setDb(db);

            subjectView.setCallback(controller);
            subjectView.getController().setDb(db);

            studyMaterialView.setCallback(controller);
            studyMaterialView.getController().setDb(db);

            quizView.setCallback(controller);
            quizView.getController().setDb(db);
        }

        @Override
        public void compose() {
            decompose();
            switch (viewType) {
                case LOGIN:
                    composeLogin();
                    break;
                case MAIN:
                    composeMain();
                    break;
                case ALL_SUBJECTS:
                    composeAllSubjects();
                    break;
                case MY_SUBJECTS:
                    composeMySubjects();
                    break;
                case SUBJECT_VIEW:
                    composeSubjectView();
                    break;
                case STUDY_MATERIAL_VIEW:
                    composeStudyMaterialView();
                    break;
                case QUIZ_VIEW:
                    composeQuizView();
                    break;
                case PROFILE:
                    composeProfile();
                    break;
            }
        }

        private void composeLogin() {

            Pane p = new Pane();
            p.setBackground(new Background(new BackgroundFill(Color.rgb(120, 120, 120), CornerRadii.EMPTY, Insets.EMPTY)));
            box.setCenter(p);

            statusLabel.setText("Autor:");
            statusContent.setText("Petr Bednář (st58214)");

            if (TESTING) {
                try {

                    db.login("admin", "admin");
                } catch (SQLException | IOException ex) {
                    Logger.getLogger(Root.class.getName()).log(Level.SEVERE, null, ex);
                } catch (DBException ex) {
                    System.out.println("User not found.");
                }
            } else {
                login.getStage().showAndWait();
            }

            if (db.getUser() == null) {
                System.exit(0);
            }

            statusLabel.setText("Uživatel:");
            statusContent.setText(db.getUser().getFirstName() + " " + db.getUser().getLastName() + " (" + db.getUser().getLogin() + ")");

            compositor.viewType = ViewType.MAIN;
            compositor.compose();
        }

        private void composeMain() {
            main.getController().load();
            box.setCenter(main.getContent());
        }

        private void composeMySubjects() {
            mySubjects.getController().load();
            box.setCenter(mySubjects.getContent());
        }

        private void composeAllSubjects() {
            allSubjects.getController().load();
            box.setCenter(allSubjects.getContent());
        }

        private void composeSubjectView() {
            subjectView.getController().load(db.getSelectedSubject());
            box.setCenter(subjectView.getContent());
        }

        private void composeStudyMaterialView() {
            studyMaterialView.getController().load(db.getSelectedStudyMaterial());
            box.setCenter(studyMaterialView.getContent());
        }

        private void composeQuizView() {
            quizView.getController().load(db.getSelectedQuiz());
            box.setCenter(quizView.getContent());
        }

        private void composeProfile() {
            profile.getController().load();
            box.setCenter(profile.getContent());
        }

        @Override
        public void decompose() {
            box.setCenter(null);
        }

    }

    public void compose(ViewType viewType) {
        compositor.viewType = viewType;
        compositor.compose();
    }
}
