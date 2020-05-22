/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.screen.handlers;

import elsa.tools.Resizer;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 * @param <T> Module Controller
 * @param <C> Callback Controller
 */
public interface IModule<T, C extends ICallable> extends ICallable {

    /**
     * Saves Controller of current FXML Document.
     *
     * @param controller
     */
    public void setController(T controller);

    /**
     * Saves Controller which serves as callback.
     *
     * @param callback
     */
    public void setCallback(C callback);

    /**
     * Saves Resizer for Module's parent Screen
     *
     * @param resizer
     */
    public void setResizer(Resizer resizer);
}
