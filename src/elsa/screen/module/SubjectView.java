package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.StudyMaterial;
import elsa.database.StudyMaterialType;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.AddStudyMaterial;
import elsa.screen.AddSubject;
import elsa.screen.Root;
import elsa.screen.handlers.Module;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import elsa.screen.tools.ViewType;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
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
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class SubjectView extends Module<SubjectView, Root> implements Initializable {

    private DatabaseManager db;
    private Subject subject;
    private boolean listSorted = true;

    @FXML
    private Label title;
    @FXML
    private Label shortcut;
    @FXML
    private Label description;
    @FXML
    private VBox materialsList;
    @FXML
    private JFXButton btnAddStudyMaterial;

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

    private AnchorPane createLabel(StudyMaterial s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);

        Label l2 = new Label(s.getTitle());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 0.0);
        AnchorPane.setRightAnchor(l2, 400.0);

        Label l3 = new Label("Přidal: " + s.getCreatedBy());
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(250);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l3.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 0.0);

        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s.getCreatedById());
            }
        });

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openMaterial(s);
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
                    editMaterial(s);
                }
            });

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeMaterial(s);
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

    private void openMaterial(StudyMaterial s) {
        db.setSelectedStudyMaterial(s);
        callback.compose(ViewType.STUDY_MATERIAL_VIEW);
    }

    private void editMaterial(StudyMaterial s) {
        try {
            ScreenLoader<AddStudyMaterial> add = new ScreenLoader<>("AddStudyMaterial");
            add.setupStage("Úprava studijního materiálu", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.SUBJECT_VIEW);
        } catch (IOException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeMaterial(StudyMaterial s) {

        try {
            db.removeStudyMaterial(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.SUBJECT_VIEW);
    }

    public void load(Subject s) {

        subject = s;
        listSorted = true;

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR || (db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject()))) {
            btnAddStudyMaterial.setVisible(true);
        } else {
            btnAddStudyMaterial.setVisible(false);
        }

        title.setText(s.getTitle());
        shortcut.setText(s.getShortcut());
        description.setText(s.getDescription());

        try {
            s.setMaterials(db.getAllMaterialsForSubject(s));
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        refreshList();
    }

    private void refreshList() {

        materialsList.getChildren().clear();
        if (listSorted) {
            if (subject.getMaterials() != null) {
                loadMaterialsList(subject.getMaterials());
            }
        } else {
            if (subject.getMaterials() != null) {
                subject.getMaterials().forEach((t) -> {
                    materialsList.getChildren().add(createLabel(t));
                });
            }
        }
    }

    private void loadMaterialsList(ArrayList<StudyMaterial> arr) {

        HashMap<String, ArrayList<StudyMaterial>> map = new HashMap<>();

        for (StudyMaterial sm : arr) {

            if (sm.getType() != null && !sm.getType().isEmpty()) {
                for (StudyMaterialType smt : sm.getType()) {

                    ArrayList<StudyMaterial> res = map.get(smt.getText());

                    if (res == null) {
                        res = new ArrayList<>();
                        res.add(sm);
                        map.put(smt.getText(), res);
                    } else {
                        res.add(sm);
                    }
                }
            }
        }

        SortedSet<String> keys = new TreeSet<>(map.keySet());

        for (String key : keys) {

            AnchorPane ap = new AnchorPane();
            ap.setPrefHeight(70);

            Pane pane = new Pane();
            pane.setStyle("-fx-background-color: rgba(0, 0, 0, 0.1)");
            AnchorPane.setTopAnchor(pane, 0.0);
            AnchorPane.setLeftAnchor(pane, 0.0);
            AnchorPane.setBottomAnchor(pane, 0.0);
            AnchorPane.setRightAnchor(pane, 0.0);

            Label l2 = new Label(key);
            l2.setAlignment(Pos.CENTER_LEFT);
            l2.setStyle("-fx-text-fill: #000000e5; -fx-font-size: 18px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

            AnchorPane.setTopAnchor(l2, 0.0);
            AnchorPane.setLeftAnchor(l2, 0.0);
            AnchorPane.setBottomAnchor(l2, 0.0);
            AnchorPane.setRightAnchor(l2, 0.0);
            ap.getChildren().addAll(pane, l2);

            materialsList.getChildren().add(ap);

            ArrayList<StudyMaterial> res = map.get(key);

            if (res != null && !res.isEmpty()) {
                res.forEach((t) -> {
                    materialsList.getChildren().add(createLabel(t));
                });
            }
        }
    }

    @FXML
    private void addStudyMaterial(ActionEvent event) throws IOException {
        ScreenLoader<AddStudyMaterial> add = new ScreenLoader<>("AddStudyMaterial");
        add.setupStage("Vložení studijního materiálu", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.SUBJECT_VIEW);
    }
}
