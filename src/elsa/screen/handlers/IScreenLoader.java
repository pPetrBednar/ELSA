/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.screen.handlers;

import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 * @param <T> Screen Controller
 */
public interface IScreenLoader<T extends IScreen> {

    /**
     * Stage configuration.
     *
     * @param title
     */
    public void setupStage(String title);

    /**
     * Stage configuration.
     *
     * @param title
     * @param initOwner
     */
    public void setupStage(String title, Stage initOwner);

    /**
     * Stage configuration.
     *
     * @param title
     * @param initOwner
     * @param modality
     */
    public void setupStage(String title, Stage initOwner, Modality modality);

    /**
     * Main root Stage configuration.
     *
     * @param title
     * @param root
     */
    public void setupRootStage(String title, Stage root);

    /**
     * Sets up transparency of scene
     *
     * @param transparency
     */
    public void setTransparent(boolean transparency);

    /**
     * Sets up resizeablebility of stage.
     *
     */
    public void setResizeable();

    /**
     * Sets up minimal size of window
     *
     * @param width
     * @param height
     */
    public void setMinSize(double width, double height);

    /**
     * Returns FXMLController.
     *
     * @return
     */
    public T getController();

    /**
     * Returns FXML Stage.
     *
     * @return
     */
    public Stage getStage();

    /**
     * Returns FXML Scene
     *
     * @return
     */
    public Scene getScene();
}
