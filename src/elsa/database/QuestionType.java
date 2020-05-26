package elsa.database;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class QuestionType {

    private int id;
    private String text;
    private String shortcut;
    private String description;

    public QuestionType(int id, String text, String shortcut, String description) {
        this.id = id;
        this.text = text;
        this.shortcut = shortcut;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getShortcut() {
        return shortcut;
    }

    public void setShortcut(String shortcut) {
        this.shortcut = shortcut;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
