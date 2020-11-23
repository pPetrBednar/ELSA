package elsa.database;

import java.sql.Date;

/**
 *
 * @author petrb
 */
public class Message {

    private Integer id;
    private String text;
    private Date date;
    private User sender;
    private User recipient;

    public Message(Integer id, String text, Date date, User sender, User recipient) {
        this.id = id;
        this.text = text;
        this.date = date;
        this.sender = sender;
        this.recipient = recipient;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

}
