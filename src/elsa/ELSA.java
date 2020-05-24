package elsa;

import elsa.screen.Root;
import elsa.screen.handlers.ScreenLoader;
import elsa.screen.tools.Information;
import javafx.application.Application;
import javafx.stage.Stage;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class ELSA extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        ScreenLoader<Root> root = new ScreenLoader<>("Root");
        root.setupRootStage("ELSA", stage);
        root.setTransparent(false);
        Information.init(root.getStage());
        root.getStage().show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

}
