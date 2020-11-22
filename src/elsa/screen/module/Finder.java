package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.QuestionType;
import elsa.database.StudyMaterial;
import elsa.database.StudyMaterialType;
import elsa.database.Subject;
import elsa.database.User;
import elsa.screen.AddQuestion;
import elsa.screen.AddSubject;
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
import javafx.collections.FXCollections;
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
import javafx.util.StringConverter;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Finder extends Module<Finder, Root> implements Initializable {

    private DatabaseManager db;

    private ArrayList<Subject> subjects;
    private ArrayList<User> teachers;

    @FXML
    private VBox list;
    @FXML
    private JFXTextField title;
    @FXML
    private JFXComboBox<Subject> subject;
    @FXML
    private JFXComboBox<User> teacher;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void setDb(DatabaseManager db) {
        this.db = db;

        try {
            subjects = db.getAllSubjects();
            subjects.add(0, new Subject(0, "", "%", ""));
            subject.setItems(FXCollections.observableArrayList(subjects));
            subject.getSelectionModel().select(0);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        subject.setConverter(new StringConverter<Subject>() {
            @Override
            public String toString(Subject object) {
                return object.getShortcut();
            }

            @Override
            public Subject fromString(String string) {
                for (Subject t : subjects) {
                    if (t.getShortcut().equals(string)) {
                        return t;
                    }
                }
                return null;
            }
        });

        try {
            teachers = db.getAllTeachers();
            teachers.add(0, new User(0));
            teachers.get(0).setLastName("%");
            teacher.setItems(FXCollections.observableArrayList(teachers));
            teacher.getSelectionModel().select(0);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        teacher.setConverter(new StringConverter<User>() {
            @Override
            public String toString(User object) {
                return object.getLastName();
            }

            @Override
            public User fromString(String string) {
                for (User t : teachers) {
                    if (t.getLastName().equals(string)) {
                        return t;
                    }
                }
                return null;
            }
        });
    }

    private AnchorPane createLabel(StudyMaterial s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(100);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");
        ap.getStyleClass().add("hover-effect-15");

        Label l1 = new Label(s.getTitle());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.setPrefWidth(200);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 50.0);

        Label l2 = new Label(s.getDescription());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 200.0);
        AnchorPane.setBottomAnchor(l2, 50.0);
        AnchorPane.setRightAnchor(l2, 150.0);

        Label l3 = new Label("Autor: " + s.getCreatedBy());
        l3.setAlignment(Pos.CENTER_LEFT);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l3, 50.0);
        AnchorPane.setLeftAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 0.0);

        Label l4 = new Label("Vytvořeno:\n" + StudyMaterial.DATE_FORMAT.format(s.getCreated()));
        l4.setAlignment(Pos.CENTER);
        l4.setPrefWidth(175);
        l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l4, 0.0);
        AnchorPane.setBottomAnchor(l4, 50.0);
        AnchorPane.setRightAnchor(l4, 0.0);

        Label l5 = new Label("Změněno:\n" + StudyMaterial.DATE_FORMAT.format(s.getChanged()));
        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(175);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");

        AnchorPane.setTopAnchor(l5, 50.0);
        AnchorPane.setBottomAnchor(l5, 0.0);
        AnchorPane.setRightAnchor(l5, 0.0);

        ap.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openStudyMaterial(s);
            }
        });
        ap.getChildren().addAll(l1, l2, l3, l4, l5);

        return ap;
    }

    private void openStudyMaterial(StudyMaterial s) {

        try {
            ArrayList<Subject> data = db.getAllSubjects();

            for (Subject sub : data) {
                if (sub.getId() == s.getCreatedById()) {
                    db.setSelectedSubject(sub);
                    break;
                }
            }

            db.setSelectedStudyMaterial(s);
            callback.compose(ViewType.STUDY_MATERIAL_VIEW);

        } catch (SQLException e) {
            Logger.getLogger(MaterialTypes.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void load() {
        list.getChildren().clear();
    }

    @FXML
    private void search(ActionEvent event) {

        list.getChildren().clear();

        String t = title.getText();
        Subject s = subject.getValue();
        User u = teacher.getValue();

        try {
            ArrayList<StudyMaterial> data = db.find(t, s, u);

            if (data != null && !data.isEmpty()) {
                data.forEach((res) -> {
                    list.getChildren().add(createLabel(res));
                });
            }
        } catch (SQLException e) {
            Logger.getLogger(MaterialTypes.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
