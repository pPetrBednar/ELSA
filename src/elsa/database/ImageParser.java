package elsa.database;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class ImageParser {

    public static InputStream get(File file) throws IOException {

        if (!file.exists()) {
            return null;
        }

        BufferedImage bim = ImageIO.read(file);

        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write((RenderedImage) bim, "png", os);
        return new ByteArrayInputStream(os.toByteArray());
    }
}
