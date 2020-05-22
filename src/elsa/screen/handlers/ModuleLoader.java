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
import javafx.scene.Parent; 

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 * @param <T> Module Controller
 * @param <C> Controller implementing ICallable
 */
public class ModuleLoader<T extends IModule, C extends ICallable> implements IModuleLoader<T, C> {
    
    private FXMLLoader loader;
    private Parent content;
    private T controller;
    
    public ModuleLoader(String fxml) throws IOException {
        loader = new FXMLLoader(this.getClass().getResource("/elsa/screen/module/" + fxml + ".fxml"));
        content = loader.load();
        controller = loader.getController();
        controller.setController(controller);
    }
    
    @Override
    public T getController() {
        return controller;
    }
    
    @Override
    public void setCallback(C callback) {
        controller.setCallback(callback);
    }
    
    @Override
    public Parent getContent() {
        return content;
    }
    
    @Override
    public void setResizer(Resizer resizer) {
        Resizer.addResizerRecursive(resizer, content);
        controller.setResizer(resizer);
    }
}
