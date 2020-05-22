/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.screen.handlers;

import elsa.tools.Resizer;
import java.io.IOException;
import javafx.fxml.FXMLLoader;
import javafx.scene.paint.Color;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 * @param <T> Screen Controller
 */
public class ScreenLoader<T extends Screen> implements IScreenLoader<T> {

    private FXMLLoader loader;
    private Parent parent;
    private T controller;
    private Stage stage;

    public ScreenLoader(String fxml) throws IOException {
        loader = new FXMLLoader(this.getClass().getResource("/elsa/screen/" + fxml + ".fxml"));
        parent = loader.load();
        controller = loader.getController();
        stage = new Stage();
    }

    @Override
    public void setupStage(String title) {
        stage.setTitle(title);
        stage.setScene(new Scene(parent));
        controller.setController(controller);
    }

    @Override
    public void setupStage(String title, Stage initOwner) {
        stage.initOwner(initOwner);
        controller.setStage(stage);
        setupStage(title);
    }

    @Override
    public void setupStage(String title, Stage initOwner, Modality modality) {
        stage.initModality(modality);
        setupStage(title, initOwner);
    }

    @Override
    public void setupRootStage(String title, Stage root) {
        stage = root;
        controller.setStage(stage);
        controller.setController(controller);
        setupStage(title);
    }

    @Override
    public void setTransparent(boolean transparency) {
        if (transparency) {
            stage.initStyle(StageStyle.UNDECORATED);
            stage.getScene().setFill(Color.TRANSPARENT);
        } else {
            stage.initStyle(StageStyle.DECORATED);
            stage.getScene().setFill(Color.WHITE);
        }
    }

    @Override
    public void setMinSize(double width, double height) {
        stage.setMinWidth(width);
        stage.setMinHeight(height);
    }

    @Override
    public T getController() {
        return controller;
    }

    @Override
    public Stage getStage() {
        return stage;
    }

    @Override
    public Scene getScene() {
        return stage.getScene();
    }

    @Override
    public void setResizeable() {
        Resizer resizer = new Resizer(stage);
        Resizer.addResizerRecursive(resizer, parent);
        controller.setResizer(resizer);
    }
}
