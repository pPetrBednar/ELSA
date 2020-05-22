/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.tools;

import elsa.screen.handlers.IScreen;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.stage.Screen;
import javafx.stage.Stage;


/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Move {

    public static void addMoveListener(IScreen callback, Stage stage, Node node) {
        MoveListener moveListener = new MoveListener(callback, stage, node);
        node.addEventHandler(MouseEvent.MOUSE_DRAGGED, moveListener);
        node.addEventHandler(MouseEvent.MOUSE_PRESSED, moveListener);
    }

    public static class MoveListener implements EventHandler<MouseEvent> {

        private IScreen callback;
        private Stage stage;
        private Node node;

        private double xOffset;
        private double yOffset;

        public MoveListener(IScreen callback, Stage stage, Node node) {
            this.callback = callback;
            this.stage = stage;
            this.node = node;
        }

        @Override
        public void handle(MouseEvent mouseEvent) {

            if (MouseEvent.MOUSE_PRESSED.equals(mouseEvent.getEventType())) {
                xOffset = stage.getX() - mouseEvent.getScreenX();
                yOffset = stage.getY() - mouseEvent.getScreenY();
                return;
            }

            ObservableList<Screen> screens = Screen.getScreensForRectangle(mouseEvent.getScreenX(), mouseEvent.getScreenY(), 1, 1);
            if (screens.isEmpty()) {
                return;
            }
            Rectangle2D screen = screens.get(0).getVisualBounds();

            /*
            
            
            TODO: AERO SNAP CORNERS
            
            
             */
            // Aero Snap Left.
            if (mouseEvent.getScreenX() <= screen.getMinX()) {
                stage.setY(screen.getMinY());
                stage.setHeight(screen.getHeight());

                stage.setX(screen.getMinX());
                if (screen.getWidth() / 2 < stage.getMinWidth()) {
                    stage.setWidth(stage.getMinWidth());
                } else {
                    stage.setWidth(screen.getWidth() / 2);
                }

                stage.show();
            } // Aero Snap Right.
            else if (mouseEvent.getScreenX() >= screen.getMaxX() - 1) {
                stage.setY(screen.getMinY());
                stage.setHeight(screen.getHeight());

                if (screen.getWidth() / 2 < stage.getMinWidth()) {
                    stage.setWidth(stage.getMinWidth());
                } else {
                    stage.setWidth(screen.getWidth() / 2);
                }
                stage.setX(screen.getMaxX() - stage.getWidth());

                stage.show();
            } // Aero Snap Top. || Aero Snap Bottom.
            else if (mouseEvent.getScreenY() <= screen.getMinY() || mouseEvent.getScreenY() >= screen.getMaxY() - 1) {

                callback.setMaximized();

                stage.setX(screen.getMinX());
                stage.setY(screen.getMinY());
                stage.setWidth(screen.getWidth());
                stage.setHeight(screen.getHeight());

                stage.show();
            } else {
                stage.setX(mouseEvent.getScreenX() + xOffset);
                stage.setY(mouseEvent.getScreenY() + yOffset);
            }
        }

    }
}
