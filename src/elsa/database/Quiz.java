package elsa.database;

import java.util.ArrayList;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Quiz {

    private Integer id;
    private String title;
    private String description;
    private String createdBy;
     private Integer createdById;

    private ArrayList<Question> questions;

    public Quiz(Integer id, String title, String description, String createdBy, Integer createdById) {
        this.id = id;
        this.title = title;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public ArrayList<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<Question> questions) {
        this.questions = questions;
    }

    

}
