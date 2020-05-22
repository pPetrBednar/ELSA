/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.screen.handlers;

import elsa.tools.Resizer;
import javafx.scene.Parent; 

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 * @param <T> Module Controller
 * @param <C> Controller implementing ICallable
 */
public interface IModuleLoader<T extends IModule, C extends ICallable> {

    /**
     * Sets up callback controller.
     *
     * @param callback
     */
    public void setCallback(C callback);

    /**
     * Returns FXML content.
     *
     * @return
     */
    public Parent getContent();

    /**
     * Returns FXMLController.
     *
     * @return
     */
    public T getController();

    /**
     * Sets up resizeablebility for current module of selected stage.
     *
     * @param resizer
     */
    public void setResizer(Resizer resizer);
}
