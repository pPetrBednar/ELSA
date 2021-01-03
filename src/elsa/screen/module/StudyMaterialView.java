package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.Quiz;
import elsa.database.StudyMaterial;
import elsa.database.StudyMaterialType;
import elsa.database.User;
import elsa.screen.AddQuiz;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Blob;
import java.sql.SQLException;
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
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class StudyMaterialView extends Module<StudyMaterialView, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private Label title;
    @FXML
    private Label description;
    @FXML
    private Label pages;
    @FXML
    private VBox quizList;
    @FXML
    private Label created;
    @FXML
    private Label changed;
    @FXML
    private Label createdBy;
    @FXML
    private JFXButton file;
    @FXML
    private JFXButton btnAddQuiz;
    @FXML
    private HBox typeList;

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

    private AnchorPane createLabel(Quiz q) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);

        Label l2 = new Label(q.getTitle());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 0.0);

        if (db.getUser().getPermission() == Permission.STUDENT) {
            AnchorPane.setRightAnchor(l2, 250.0);
        } else {
            AnchorPane.setRightAnchor(l2, 400.0);
        }

        Label l3 = new Label(q.getCreatedBy());
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(250);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l3.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 0.0);

        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(q.getCreatedById());
            }
        });

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openQuiz(q);
            }
        });

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {

            Label l4 = new Label("Upravit");
            l4.setAlignment(Pos.CENTER);
            l4.setPrefWidth(75);
            l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l4.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l4, 0.0);
            AnchorPane.setBottomAnchor(l4, 0.0);
            AnchorPane.setRightAnchor(l4, 325.0);

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 0.0);
            AnchorPane.setBottomAnchor(l5, 0.0);
            AnchorPane.setRightAnchor(l5, 250.0);

            l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    editQuiz(q);
                }
            });

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeQuiz(q);
                }
            });

            ap.getChildren().addAll(l2, l3, l4, l5);
        } else {
            ap.getChildren().addAll(l2, l3);
        }

        return ap;
    }

    private void openUser(Integer s) {
        db.setSelectedPublicProfile(new User(s));
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private Label createTypeLabel(StudyMaterialType t) {

        Label l = new Label(t.getText());
        l.setStyle("-fx-text-fill: #ffffffe5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 4px 16px 4px 16px;");
        l.getStyleClass().add("tag");

        l.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                Information.display(t.getDescription());
            }
        });

        return l;
    }

    private Label createSpacer() {
        Label l = new Label();
        l.setPrefWidth(16);
        return l;
    }

    private void openQuiz(Quiz q) {
        db.setSelectedQuiz(q);
        callback.compose(ViewType.QUIZ_VIEW);
    }

    private void editQuiz(Quiz q) {
        try {
            ScreenLoader<AddQuiz> add = new ScreenLoader<>("AddQuiz");
            add.setupStage("Úprava kvízu", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(q);
            add.getStage().showAndWait();

            callback.compose(ViewType.STUDY_MATERIAL_VIEW);
        } catch (IOException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeQuiz(Quiz q) {

        try {
            db.removeQuiz(q);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.STUDY_MATERIAL_VIEW);
    }

    public void load(StudyMaterial s) {

        quizList.getChildren().clear();
        typeList.getChildren().clear();

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {
            btnAddQuiz.setVisible(true);
        } else {
            btnAddQuiz.setVisible(false);
        }

        title.setText(s.getTitle());
        pages.setText(s.getPages().toString());
        description.setText(s.getDescription());
        created.setText(StudyMaterial.DATE_FORMAT.format(s.getCreated()));
        changed.setText(StudyMaterial.DATE_FORMAT.format(s.getChanged()));
        createdBy.setText(s.getCreatedBy());

        if (s.getFile() == null) {
            file.setVisible(false);
        } else {
            file.setVisible(true);
        }

        try {
            s.setQuizList(db.getAllQuizesForMaterial(s));
        } catch (SQLException ex) {
            Logger.getLogger(StudyMaterialView.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (s.getQuizList() != null) {
            s.getQuizList().forEach((t) -> {
                quizList.getChildren().add(createLabel(t));
            });
        }

        if (s.getType() != null) {
            s.getType().forEach((t) -> {
                typeList.getChildren().addAll(createTypeLabel(t), createSpacer());
            });
        }

    }

    @FXML
    private void openFile(ActionEvent event) {
        try {
            if (db.getSelectedStudyMaterial().getFile() == null) {
                return;
            }

            Blob blob = db.getSelectedStudyMaterial().getFile();
            byte[] data = blob.getBytes(1, (int) blob.length());
            File f = new File(db.getSelectedStudyMaterial().getTitle() + "." + db.getSelectedStudyMaterial().getExtension());

            if (!f.exists()) {
                f.createNewFile();
            }

            FileOutputStream out = new FileOutputStream(f);
            out.write(data);
            out.close();

            Information.display("Soubor uložen a nyní bude otevřen.");

            Desktop.getDesktop().open(f);
        } catch (SQLException | IOException ex) {
            //Logger.getLogger(StudyMaterialView.class.getName()).log(Level.SEVERE, null, ex);
            Information.display("Soubor nemohl být uložen.");
        }
    }

    @FXML
    private void addQuiz(ActionEvent event) throws IOException {

        ScreenLoader<AddQuiz> add = new ScreenLoader<>("AddQuiz");
        add.setupStage("Vložení kvízu", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.STUDY_MATERIAL_VIEW);
    }

    @FXML
    private void openComments(ActionEvent event) {
        callback.compose(ViewType.COMMENTS);
    }
}
