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
public class Module<T, C extends ICallable> implements IModule<T, C> {

    protected T controller;
    protected C callback;
    protected Resizer resizer;

    @Override
    public void setController(T controller) {
        this.controller = controller;
    }

    @Override
    public void setCallback(C callback) {
        this.callback = callback;
    }

    @Override
    public void setResizer(Resizer resizer) {
        this.resizer = resizer;
    }
}
