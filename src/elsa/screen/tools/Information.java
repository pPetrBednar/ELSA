package elsa.screen.tools;

import elsa.screen.Info;
import elsa.screen.handlers.ScreenLoader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Information {

    public static ScreenLoader<Info> info;

    private Information() {
    }

    public static void init(Stage stage) {
        try {
            info = new ScreenLoader<>("Info");
            info.setupStage("Informační okno", stage, Modality.APPLICATION_MODAL);
            info.setTransparent(true);
        } catch (IOException ex) {
            // Logger.getLogger(Information.class.getName()).log(Level.SEVERE, null, ex);
            System.exit(0);
        }
    }

    public static void display(String text) {
        info.getController().set(text);
        info.getStage().showAndWait();
    }
}
