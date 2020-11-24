package elsa.screen;

import elsa.database.DBException;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.User;
import elsa.screen.handlers.ICompositor;
import elsa.screen.handlers.ModuleLoader;
import elsa.screen.handlers.Screen;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.module.Administration;
import elsa.screen.module.AllSubjects;
import elsa.screen.module.Chat;
import elsa.screen.module.Cloud;
import elsa.screen.module.Comments;
import elsa.screen.module.Communications;
import elsa.screen.module.Finder;
import elsa.screen.module.Main;
import elsa.screen.module.MaterialTypes;
import elsa.screen.module.MySubjects;
import elsa.screen.module.Profile;
import elsa.screen.module.PublicProfile;
import elsa.screen.module.QuestionTypes;
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
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Root extends Screen<Root> implements Initializable {

    // Testing mode, automatic admin login
    private final boolean TESTING = true;
    private User emulatedUser = null;

    private DatabaseManager db;
    private Compositor compositor;
    private ScreenLoader<Login> login;

    // Main screen components
    private ModuleLoader<Main, Root> main;
    private ModuleLoader<Profile, Root> profile;
    private ModuleLoader<AllSubjects, Root> allSubjects;
    private ModuleLoader<MySubjects, Root> mySubjects;
    private ModuleLoader<SubjectView, Root> subjectView;
    private ModuleLoader<StudyMaterialView, Root> studyMaterialView;
    private ModuleLoader<QuizView, Root> quizView;
    private ModuleLoader<Comments, Root> comments;
    private ModuleLoader<Administration, Root> administration;
    private ModuleLoader<QuestionTypes, Root> questionTypes;
    private ModuleLoader<MaterialTypes, Root> materialTypes;
    private ModuleLoader<PublicProfile, Root> publicProfile;
    private ModuleLoader<Communications, Root> communications;
    private ModuleLoader<Finder, Root> finder;
    private ModuleLoader<Chat, Root> chat;
    private ModuleLoader<Cloud, Root> cloud;

    @FXML
    private BorderPane box;
    @FXML
    private Label statusLabel;
    @FXML
    private Label statusContent;
    @FXML
    private HBox location;
    @FXML
    private VBox adminZone;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

        compositor = new Compositor();
        try {
            db = new DatabaseManager();
        } catch (SQLException ex) {

            Alert a = new Alert(Alert.AlertType.ERROR);
            a.setContentText("Nelze připojit k databázi.");
            a.showAndWait();
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

        if (emulatedUser != null) {
            stage.close();
        }

        compositor.compose();
    }

    @FXML
    private void administration(ActionEvent event) {
        compositor.viewType = ViewType.ADMINISTRATION;
        compositor.compose();
    }

    @FXML
    private void questionTypes(ActionEvent event) {
        compositor.viewType = ViewType.QUESTION_TYPES;
        compositor.compose();
    }

    @FXML
    private void materialTypes(ActionEvent event) {
        compositor.viewType = ViewType.MATERIAL_TYPES;
        compositor.compose();
    }

    @FXML
    private void communications(ActionEvent event) {
        compositor.viewType = ViewType.COMMUNICATIONS;
        compositor.compose();
    }

    @FXML
    private void finder(ActionEvent event) {
        compositor.viewType = ViewType.FINDER;
        compositor.compose();
    }

    @FXML
    private void groups(ActionEvent event) {
        compositor.viewType = ViewType.GROUPS;
        compositor.compose();
    }

    @FXML
    private void cloud(ActionEvent event) {
        compositor.viewType = ViewType.CLOUD;
        compositor.compose();
    }

    /**
     * Assembler for creating different views
     */
    private class Compositor implements ICompositor {

        ViewType viewType;

        /**
         * FXML Loading
         *
         * @throws IOException
         */
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
            comments = new ModuleLoader<>("Comments");
            administration = new ModuleLoader<>("Administration");
            questionTypes = new ModuleLoader<>("QuestionTypes");
            materialTypes = new ModuleLoader<>("MaterialTypes");
            publicProfile = new ModuleLoader<>("PublicProfile");
            communications = new ModuleLoader<>("Communications");
            finder = new ModuleLoader<>("Finder");
            chat = new ModuleLoader<>("Chat");
            cloud = new ModuleLoader<>("Cloud");
        }

        /**
         * Setup of db controllers and distribution of root controllers
         */
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

            comments.setCallback(controller);
            comments.getController().setDb(db);

            administration.setCallback(controller);
            administration.getController().setDb(db);

            questionTypes.setCallback(controller);
            questionTypes.getController().setDb(db);

            materialTypes.setCallback(controller);
            materialTypes.getController().setDb(db);

            publicProfile.setCallback(controller);
            publicProfile.getController().setDb(db);

            communications.setCallback(controller);
            communications.getController().setDb(db);

            finder.setCallback(controller);
            finder.getController().setDb(db);

            chat.setCallback(controller);
            chat.getController().setDb(db);

            cloud.setCallback(controller);
            cloud.getController().setDb(db);
        }

        /**
         * Compositor
         */
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
                case COMMENTS:
                    composeComments();
                    break;
                case ADMINISTRATION:
                    composeAdministration();
                    break;
                case QUESTION_TYPES:
                    composeQuestionTypes();
                    break;
                case MATERIAL_TYPES:
                    composeMaterialTypes();
                    break;
                case PUBLIC_PROFILE:
                    composePublicProfile();
                    break;
                case COMMUNICATIONS:
                    composeCommunications();
                    break;
                case FINDER:
                    composeFinder();
                    break;
                case EMULATOR:
                    composeEmulator();
                    break;
                case GROUPS:
                    break;
                case CLOUD:
                    composeCloud();
                    break;
                case CHAT:
                    composeChat();
                    break;
            }
        }

        private void composeLogin() {

            adminZone.setVisible(false);
            location.getChildren().clear();
            Label l = new Label("Přihlášení");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

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

            if (db.getUser().getPermission() == Permission.ADMINISTRATOR) {
                adminZone.setVisible(true);
            }

            statusLabel.setText("Uživatel:");
            statusContent.setText(db.getUser().getFirstName() + " " + db.getUser().getLastName() + " (" + db.getUser().getLogin() + ")");

            compositor.viewType = ViewType.MAIN;
            compositor.compose();
        }

        private void composeEmulator() {

            adminZone.setVisible(false);
            location.getChildren().clear();
            Label l = new Label("Přihlášení");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            Pane p = new Pane();
            p.setBackground(new Background(new BackgroundFill(Color.rgb(120, 120, 120), CornerRadii.EMPTY, Insets.EMPTY)));
            box.setCenter(p);

            statusLabel.setText("Autor:");
            statusContent.setText("Petr Bednář (st58214)");

            db.setUser(null);
            db.setSelectedSubject(null);
            db.setSelectedStudyMaterial(null);

            if (emulatedUser != null) {
                try {
                    db.loginAs(emulatedUser);
                } catch (SQLException | IOException ex) {
                    Logger.getLogger(Root.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                login.getStage().showAndWait();
            }

            if (db.getUser() == null) {
                System.exit(0);
            }

            if (db.getUser().getPermission() == Permission.ADMINISTRATOR) {
                adminZone.setVisible(true);
            }

            statusLabel.setText("Uživatel:");
            statusContent.setText(db.getUser().getFirstName() + " " + db.getUser().getLastName() + " (" + db.getUser().getLogin() + ")");

            compositor.viewType = ViewType.MAIN;
            compositor.compose();
        }

        private void composeMain() {
            location.getChildren().clear();
            Label l = new Label("Hlavní stránka");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            main.getController().load();
            box.setCenter(main.getContent());
        }

        private void composeMySubjects() {
            location.getChildren().clear();
            Label l = new Label("Moje předměty");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            mySubjects.getController().load();
            box.setCenter(mySubjects.getContent());
        }

        private void composeAllSubjects() {

            location.getChildren().clear();
            Label l = new Label("Všechny předměty");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            allSubjects.getController().load();
            box.setCenter(allSubjects.getContent());
        }

        private void composeSubjectView() {
            location.getChildren().clear();

            Label l1 = new Label(db.getSelectedSubject().getTitle());
            l1.getStyleClass().add("location-label");
            location.getChildren().add(l1);

            subjectView.getController().load(db.getSelectedSubject());
            box.setCenter(subjectView.getContent());
        }

        private void composeStudyMaterialView() {
            location.getChildren().clear();

            Label l1 = new Label(db.getSelectedSubject().getTitle());
            l1.getStyleClass().add("location-label");

            l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.SUBJECT_VIEW;
                compose();
            });

            Label arrow1 = new Label("🡺");
            arrow1.getStyleClass().add("location-arrow");

            Label l2 = new Label(db.getSelectedStudyMaterial().getTitle());
            l2.getStyleClass().add("location-label");

            location.getChildren().addAll(l1, arrow1, l2);

            studyMaterialView.getController().load(db.getSelectedStudyMaterial());
            box.setCenter(studyMaterialView.getContent());
        }

        private void composeQuizView() {

            location.getChildren().clear();

            Label l1 = new Label(db.getSelectedSubject().getTitle());
            l1.getStyleClass().add("location-label");

            l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.SUBJECT_VIEW;
                compose();
            });

            Label arrow1 = new Label("🡺");
            arrow1.getStyleClass().add("location-arrow");

            Label l2 = new Label(db.getSelectedStudyMaterial().getTitle());
            l2.getStyleClass().add("location-label");

            l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.STUDY_MATERIAL_VIEW;
                compose();
            });

            Label arrow2 = new Label("🡺");
            arrow2.getStyleClass().add("location-arrow");

            Label l3 = new Label(db.getSelectedQuiz().getTitle());
            l3.getStyleClass().add("location-label");

            location.getChildren().addAll(l1, arrow1, l2, arrow2, l3);

            quizView.getController().load(db.getSelectedQuiz());
            box.setCenter(quizView.getContent());
        }

        private void composeComments() {

            location.getChildren().clear();

            Label l1 = new Label(db.getSelectedSubject().getTitle());
            l1.getStyleClass().add("location-label");

            l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.SUBJECT_VIEW;
                compose();
            });

            Label arrow1 = new Label("🡺");
            arrow1.getStyleClass().add("location-arrow");

            Label l2 = new Label(db.getSelectedStudyMaterial().getTitle());
            l2.getStyleClass().add("location-label");

            l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.STUDY_MATERIAL_VIEW;
                compose();
            });

            Label arrow2 = new Label("🡺");
            arrow2.getStyleClass().add("location-arrow");

            Label l3 = new Label("Komentáře");
            l3.getStyleClass().add("location-label");

            location.getChildren().addAll(l1, arrow1, l2, arrow2, l3);

            comments.getController().load(db.getSelectedStudyMaterial());
            box.setCenter(comments.getContent());
        }

        private void composeProfile() {

            location.getChildren().clear();
            Label l = new Label("Profil");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            profile.getController().load();
            box.setCenter(profile.getContent());
        }

        private void composeAdministration() {
            location.getChildren().clear();
            Label l = new Label("Administrace");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            administration.getController().load();
            box.setCenter(administration.getContent());
        }

        private void composeQuestionTypes() {
            location.getChildren().clear();
            Label l = new Label("Druhy otázek");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            questionTypes.getController().load();
            box.setCenter(questionTypes.getContent());
        }

        private void composeMaterialTypes() {
            location.getChildren().clear();
            Label l = new Label("Kategorie studijních materiálů");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            materialTypes.getController().load();
            box.setCenter(materialTypes.getContent());
        }

        private void composePublicProfile() {
            location.getChildren().clear();
            Label l = new Label("Veřejný profil");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            publicProfile.getController().load();
            box.setCenter(publicProfile.getContent());
        }

        private void composeCommunications() {
            location.getChildren().clear();
            Label l = new Label("Komunikace");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            communications.getController().load();
            box.setCenter(communications.getContent());
        }

        private void composeFinder() {
            location.getChildren().clear();
            Label l = new Label("Vyhledávač");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            finder.getController().load();
            box.setCenter(finder.getContent());
        }

        private void composeCloud() {
            location.getChildren().clear();
            Label l = new Label("Cloud");
            l.getStyleClass().add("location-label");
            location.getChildren().add(l);

            cloud.getController().load();
            box.setCenter(cloud.getContent());
        }

        private void composeChat() {
            location.getChildren().clear();
            Label l1 = new Label("Komunikace");
            l1.getStyleClass().add("location-label");

            l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (event) -> {
                viewType = ViewType.COMMUNICATIONS;
                compose();
            });

            Label arrow1 = new Label("🡺");
            arrow1.getStyleClass().add("location-arrow");

            Label l2 = new Label(db.getSelectedCommunication().getFirstName() + " " + db.getSelectedCommunication().getLastName());
            l2.getStyleClass().add("location-label");
            location.getChildren().addAll(l1, arrow1, l2);

            chat.getController().load(db.getSelectedCommunication());
            box.setCenter(chat.getContent());
        }

        @Override
        public void decompose() {
            box.setCenter(null);
        }

    }

    /**
     * Displays selected view type on main window
     *
     * @param viewType
     */
    public void compose(ViewType viewType) {
        compositor.viewType = viewType;
        compositor.compose();
    }

    /**
     * Sets up emulated user to load
     *
     * @param u
     */
    public void setEmulatedUser(User u) {
        Platform.runLater(() -> {
            emulatedUser = u;
            compositor.viewType = ViewType.EMULATOR;
            compositor.compose();
        });
    }

    public HBox getLocation() {
        return location;
    }
}
