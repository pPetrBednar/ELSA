package elsa.database;

/**
 *
 * @author petrb
 */
public class Group {

    private Integer id;
    private String year;
    private String title;

    public Group(Integer id, String year, String title) {
        this.id = id;
        this.year = year;
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
