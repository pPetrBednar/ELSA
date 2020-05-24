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
public class Info extends Screen<Info> implements Initializable {

    @FXML
    private Label text;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void set(String text) {
        this.text.setText(text);
    }

    @FXML
    private void confirm(ActionEvent event) {
        close();
    }

}
