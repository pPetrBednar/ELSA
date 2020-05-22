package elsa.database;

import java.util.ArrayList;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class Subject {

    private Integer id;
    private String title;
    private String shortcut;
    private String description;

    private ArrayList<StudyMaterial> materials;

    public Subject(Integer id, String title, String shortcut, String description) {
        this.id = id;
        this.title = title;
        this.shortcut = shortcut;
        this.description = description;
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

    public ArrayList<StudyMaterial> getMaterials() {
        return materials;
    }

    public void setMaterials(ArrayList<StudyMaterial> materials) {
        this.materials = materials;
    }

    @Override
    public String toString() {
        return "Subject{" + "id=" + id + ", title=" + title + ", shortcut=" + shortcut + ", description=" + description + ", materials=" + materials + '}';
    }

}
