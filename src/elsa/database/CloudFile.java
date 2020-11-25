package elsa.database;

import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author petrb
 */
public class CloudFile {

    private Integer id;
    private String title;
    private Blob file;
    private String extension;
    private Date uploaded;
    private Date edited;

    public CloudFile(Integer id, String title, Blob file, String extension, Date uploaded, Date edited) {
        this.id = id;
        this.title = title;
        this.file = file;
        this.extension = extension;
        this.uploaded = uploaded;
        this.edited = edited;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Blob getFile() {
        return file;
    }

    public void setFile(Blob file) {
        this.file = file;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public Date getUploaded() {
        return uploaded;
    }

    public void setUploaded(Date uploaded) {
        this.uploaded = uploaded;
    }

    public Date getEdited() {
        return edited;
    }

    public void setEdited(Date edited) {
        this.edited = edited;
    }

}
