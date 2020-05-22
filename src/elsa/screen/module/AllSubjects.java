/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import com.sun.org.apache.xerces.internal.xs.XSModelGroup;
import elsa.database.DatabaseManager;
import elsa.database.Permission;
import elsa.database.Subject;
import elsa.screen.AddSubject;
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
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
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
public class AllSubjects extends Module<AllSubjects, Root> implements Initializable {

    private DatabaseManager db;

    @FXML
    private VBox list;
    @FXML
    private JFXButton btnAddSubject;

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

    private AnchorPane createLabel(Subject s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getShortcut());
        l1.setAlignment(Pos.CENTER);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 16px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l1.setPrefWidth(100);
        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);

        Label l2 = new Label(s.getTitle());
        l2.setAlignment(Pos.CENTER_LEFT);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setLeftAnchor(l2, 100.0);
        AnchorPane.setBottomAnchor(l2, 0.0);
        AnchorPane.setRightAnchor(l2, 300.0);

        Label l3 = new Label("Přidat do mých");
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(150);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l3.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 0.0);

        Label l6 = new Label("Odebrat z mých");
        l6.setAlignment(Pos.CENTER);
        l6.setPrefWidth(150);
        l6.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l6.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l6, 0.0);
        AnchorPane.setBottomAnchor(l6, 0.0);
        AnchorPane.setRightAnchor(l6, 0.0);

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openSubject(s);
            }
        });

        l3.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                subscribeSubject(s);
            }
        });

        l6.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                unsubscribeSubject(s);
            }
        });

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR) {

            Label l4 = new Label("Upravit");
            l4.setAlignment(Pos.CENTER);
            l4.setPrefWidth(75);
            l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l4.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l4, 0.0);
            AnchorPane.setBottomAnchor(l4, 0.0);
            AnchorPane.setRightAnchor(l4, 225.0);

            Label l5 = new Label("Odebrat");
            l5.setAlignment(Pos.CENTER);
            l5.setPrefWidth(75);
            l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
            l5.getStyleClass().add("hover-effect-15");

            AnchorPane.setTopAnchor(l5, 0.0);
            AnchorPane.setBottomAnchor(l5, 0.0);
            AnchorPane.setRightAnchor(l5, 150.0);

            l4.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    editSubject(s);
                }
            });

            l5.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
                if (e.getButton() == MouseButton.PRIMARY) {
                    removeSubject(s);
                }
            });

            if (db.getUser().ownsSubject(s)) {
                ap.getChildren().addAll(l1, l2, l6, l4, l5);
            } else {
                ap.getChildren().addAll(l1, l2, l3, l4, l5);
            }

        } else {

            if (db.getUser().ownsSubject(s)) {
                ap.getChildren().addAll(l1, l2, l6);
            } else {
                ap.getChildren().addAll(l1, l2, l3);
            }
        }

        return ap;
    }

    private void openSubject(Subject s) {
        db.setSelectedSubject(s);
        callback.compose(ViewType.SUBJECT_VIEW);
    }

    private void subscribeSubject(Subject s) {
        try {
            db.subscribeSubject(s);
        } catch (SQLException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
        callback.compose(ViewType.ALL_SUBJECTS);
    }

    private void unsubscribeSubject(Subject s) {
        try {
            db.unsubscribeSubject(s);
        } catch (SQLException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
        callback.compose(ViewType.ALL_SUBJECTS);
    }

    private void editSubject(Subject s) {

        try {
            ScreenLoader<AddSubject> add = new ScreenLoader<>("AddSubject");
            add.setupStage("Úprava předmětu", callback.getStage(), Modality.WINDOW_MODAL);
            add.setTransparent(true);
            add.getController().setDb(db);
            add.getController().load(s);
            add.getStage().showAndWait();

            callback.compose(ViewType.ALL_SUBJECTS);
        } catch (IOException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void removeSubject(Subject s) {

        try {
            db.removeSubject(s);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectView.class.getName()).log(Level.SEVERE, null, ex);
        }

        callback.compose(ViewType.ALL_SUBJECTS);
    }

    public void load() {

        list.getChildren().clear();

        if (db.getUser().getPermission() == Permission.ADMINISTRATOR) {
            btnAddSubject.setVisible(true);
        } else {
            btnAddSubject.setVisible(false);
        }

        try {
            ArrayList<Subject> data = db.getAllSubjects();

            if (data != null && !data.isEmpty()) {
                System.out.println(data.size());
                data.forEach((t) -> {
                    list.getChildren().add(createLabel(t));
                });
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllSubjects.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @FXML
    private void addSubject(ActionEvent event) throws IOException {

        ScreenLoader<AddSubject> add = new ScreenLoader<>("AddSubject");
        add.setupStage("Vložení předmětu", callback.getStage(), Modality.WINDOW_MODAL);
        add.setTransparent(true);
        add.getController().setDb(db);
        add.getStage().showAndWait();

        callback.compose(ViewType.ALL_SUBJECTS);
    }
}
