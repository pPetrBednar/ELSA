package elsa.database;

import java.sql.Blob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class StudyMaterial {

    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("hh:mm dd.MM.yyyy");

    private Integer id;
    private String title;
    private Integer pages;
    private Date created;
    private Date changed;
    private String description;
    private Blob file;
    private String extension;
    private String createdBy;
    private Integer createdById;

    private ArrayList<StudyMaterialType> type;
    private ArrayList<Quiz> quizList;

    public StudyMaterial(Integer id, String title, Integer pages, Date created, Date changed, String description, Blob file, String extension, String createdBy, Integer createdById) {
        this.id = id;
        this.title = title;
        this.pages = pages;
        this.created = created;
        this.changed = changed;
        this.description = description;
        this.file = file;
        this.extension = extension;
        this.createdBy = createdBy;
        this.createdById = createdById;
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

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public ArrayList<StudyMaterialType> getType() {
        return type;
    }

    public void setType(ArrayList<StudyMaterialType> type) {
        this.type = type;
    }

    public ArrayList<Quiz> getQuizList() {
        return quizList;
    }

    public void setQuizList(ArrayList<Quiz> quizList) {
        this.quizList = quizList;
    }

   

}
