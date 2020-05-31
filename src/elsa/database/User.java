package elsa.database;

import java.sql.Blob;
import java.util.ArrayList;
import javafx.scene.image.Image;

/**
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class User {

    // Main
    private Integer id;
    private String login;
    private Permission permission;

    // Mandatory
    private String firstName;
    private String lastName;
    private String email;

    // Optional
    private String phone;
    private String address;
    private Image avatar;

    private ArrayList<Subject> subjects;

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String login, Permission permission, String firstName, String lastName, String email, String phone, String address, Image avatar) {
        this.id = id;
        this.login = login;
        this.permission = permission;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.avatar = avatar;
    }

    public boolean ownsSubject(Subject s) {

        if (subjects == null) {
            return false;
        }

        for (Subject owned : subjects) {
            if (s.getId().equals(owned.getId())) {
                return true;
            }
        }

        return false;
    }

    public ArrayList<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(ArrayList<Subject> subjects) {
        this.subjects = subjects;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Image getAvatar() {
        return avatar;
    }

    public void setAvatar(Image avatar) {
        this.avatar = avatar;
    }

    public Integer getId() {
        return id;
    }
}
