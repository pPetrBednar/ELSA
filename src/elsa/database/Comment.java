package elsa.database;

import java.sql.Date;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Comment {

    private Integer id;
    private String text;
    private Date created;
    private Date changed;
    private String createdBy;
    private Integer createdById;

    public Comment(Integer id, String text, Date created, Date changed, String createdBy, Integer createdById) {
        this.id = id;
        this.text = text;
        this.created = created;
        this.changed = changed;
        this.createdBy = createdBy;
        this.createdById = createdById;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getChanged() {
        return changed;
    }

    public void setChanged(Date changed) {
        this.changed = changed;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Integer getCreatedById() {
        return createdById;
    }

    public void setCreatedById(Integer createdById) {
        this.createdById = createdById;
    }

}
