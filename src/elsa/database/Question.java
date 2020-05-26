package elsa.database;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Question {

    private Integer id;
    private Integer index;
    private String title;
    private String q;
    private String a;
    private Integer points;
    private QuestionType type;
    private String createdBy;

    public Question(Integer id, Integer index, String title, String q, String a, Integer points, QuestionType type, String createdBy) {
        this.id = id;
        this.index = index;
        this.title = title;
        this.q = q;
        this.a = a;
        this.points = points;
        this.type = type;
        this.createdBy = createdBy;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public QuestionType getType() {
        return type;
    }

    public void setType(QuestionType type) {
        this.type = type;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

}
