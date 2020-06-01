package elsa.screen;

import elsa.screen.handlers.Screen;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Confirmation extends Screen<Confirmation> implements Initializable {

    @FXML
    private Label text;

    private boolean result = false;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    private void exit(ActionEvent event) {
        close();
    }

    @FXML
    private void confirm(ActionEvent event) {
        result = true;
        close();
    }

    public void setText(String text) {
        this.text.setText(text);
    }

    public boolean getResult() {
        return result;
    }
}
