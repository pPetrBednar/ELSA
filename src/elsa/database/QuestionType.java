package elsa.database;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public enum QuestionType {
    SELECT(1, "Výběr z možností"),
    FILL(2, "Doplnění textu"),
    WRITE(3, "Volná odpověď");

    private int id;
    private String text;

    private QuestionType(int id, String text) {
        this.id = id;
        this.text = text;
    }

    public int getId() {
        return id;
    }

    public String getText() {
        return text;
    }

}
