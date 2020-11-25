package elsa.screen.module;

import com.jfoenix.controls.JFXButton;
import elsa.database.DatabaseManager;
import elsa.database.EvaluationData;
import elsa.database.Permission;
import elsa.database.Subject;
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
public class Evaluation extends Module<Evaluation, Root> implements Initializable {

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

    private AnchorPane createLabel(EvaluationData s) {

        AnchorPane ap = new AnchorPane();
        ap.setPrefHeight(50);
        ap.setStyle("-fx-border-color: rgba(0, 0, 0, 0.2);");

        Label l1 = new Label(s.getUser().getFirstName() + " " + s.getUser().getLastName());
        l1.setAlignment(Pos.CENTER_LEFT);
        l1.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true; -fx-padding: 0px 0px 0px 16px;");
        l1.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l1, 0.0);
        AnchorPane.setLeftAnchor(l1, 0.0);
        AnchorPane.setBottomAnchor(l1, 0.0);
        AnchorPane.setRightAnchor(l1, 650.0);

        l1.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUser(s.getUser());
            }
        });

        Label l2 = new Label("Výsledky");
        l2.setAlignment(Pos.CENTER);
        l2.setPrefWidth(100);
        l2.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");
        l2.getStyleClass().add("hover-effect-15");

        AnchorPane.setTopAnchor(l2, 0.0);
        AnchorPane.setBottomAnchor(l2, 0.0);
        AnchorPane.setRightAnchor(l2, 550.0);

        l2.addEventHandler(MouseEvent.MOUSE_CLICKED, (MouseEvent e) -> {
            if (e.getButton() == MouseButton.PRIMARY) {
                openUserQuizes(s.getUser());
            }
        });

        Label l3 = new Label("Kvízů: " + s.getQuizes() + "/" + s.getMaxQuizes());
        l3.setAlignment(Pos.CENTER);
        l3.setPrefWidth(150);
        l3.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        AnchorPane.setTopAnchor(l3, 0.0);
        AnchorPane.setBottomAnchor(l3, 0.0);
        AnchorPane.setRightAnchor(l3, 400.0);

        Label l4 = new Label("Bodů: " + s.getPoints() + "/" + s.getMaxPoints());
        l4.setAlignment(Pos.CENTER);
        l4.setPrefWidth(150);
        l4.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        AnchorPane.setTopAnchor(l4, 0.0);
        AnchorPane.setBottomAnchor(l4, 0.0);
        AnchorPane.setRightAnchor(l4, 250.0);

        Label l5;
        if (s.getPoints().equals(0) || s.getMaxPoints().equals(0)) {
            l5 = new Label(s.getQuizes().equals(s.getMaxQuizes()) ? "Hodnocení: 0%" : "Hodnocení nelze vypočítat");
        } else {
            l5 = new Label(s.getQuizes().equals(s.getMaxQuizes()) ? "Hodnocení: " + (int) (s.getPoints().doubleValue() / s.getMaxPoints().doubleValue() * 100.0) + "%" : "Hodnocení nelze vypočítat");
        }

        l5.setAlignment(Pos.CENTER);
        l5.setPrefWidth(250);
        l5.setStyle("-fx-text-fill: #000000d5; -fx-font-size: 14px; -fx-font-weight: bold; -fx-wrap-text: true;");

        AnchorPane.setTopAnchor(l5, 0.0);
        AnchorPane.setBottomAnchor(l5, 0.0);
        AnchorPane.setRightAnchor(l5, 0.0);

        ap.getChildren().addAll(l1, l2, l3, l4, l5);

        return ap;
    }

    private void openUser(User s) {
        db.setSelectedPublicProfile(s);
        callback.compose(ViewType.PUBLIC_PROFILE);
    }

    private void openUserQuizes(User s) {

        db.setSelectedEvaluationUser(s);
        callback.compose(ViewType.EVALUATED_QUIZES);
    }

    public void load(Subject s) {

        list.getChildren().clear();

        try {
            ArrayList<EvaluationData> data;
            if ((db.getUser().getPermission() == Permission.TEACHER && db.getUser().ownsSubject(db.getSelectedSubject())) || db.getUser().getPermission() == Permission.ADMINISTRATOR) {
                data = db.getUsersEvaluationOnSubject(s);
            } else {
                data = db.getUserEvaluationOnSubject(s);
            }

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
