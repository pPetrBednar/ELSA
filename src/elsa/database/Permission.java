package elsa.database;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public enum Permission {
    STUDENT("Student"),
    TEACHER("Učitel"),
    ADMINISTRATOR("Administrátor");

    private String text;

    private Permission(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

}
