/**
 *
 * Project Palladium resources
 * Author: Petr Bednář
 *
 */
package elsa.screen.handlers;

import java.io.IOException;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public interface ICompositor {

    /**
     * PRE LOAD FUNCTION
     *
     * Runs initial module load
     *
     * @throws IOException
     */
    public void load() throws IOException;

    /**
     * ON LOAD FUNCTION
     *
     * Runs callback and other settings
     */
    public void setup();

    /**
     * ON LOAD FUNCTION
     *
     * Puts modules in place and run individual settings on them.
     */
    public void compose();

    /**
     * Handles putting contents into pre assign setting. (Clears FXML
     * containers, labels, btns, etc..)
     */
    public void decompose();
}
