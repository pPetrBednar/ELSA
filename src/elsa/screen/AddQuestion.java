package elsa.screen;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import elsa.database.DatabaseManager;
import elsa.database.Question;
import elsa.database.QuestionType;
import elsa.database.Quiz;
import elsa.screen.handlers.Screen;
import elsa.screen.tools.Information;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.util.StringConverter;

/**
 * FXML Controller class
 *
 * @author Petr Bednář <https://www.facebook.com/petrexis>
 */
public class AddQuestion extends Screen<AddQuestion> implements Initializable {

    private DatabaseManager db;
    private boolean edit = false;
    private Integer id;

    private ArrayList<QuestionType> types;

    @FXML
    private JFXTextField title;
    @FXML
    private JFXTextArea question;
    @FXML
    private JFXTextArea answer;
    @FXML
    private JFXTextField points;
    @FXML
    private JFXTextField index;
    @FXML
    private JFXComboBox<QuestionType> type;
    @FXML
    private JFXButton btnAdd;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    public void setDb(DatabaseManager db) {
        this.db = db;

        try {
            types = db.getAllQuestionTypes();
            type.setItems(FXCollections.observableArrayList(types));
            type.getSelectionModel().select(0);
        } catch (SQLException ex) {
            Logger.getLogger(AddQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }

        type.setConverter(new StringConverter<QuestionType>() {
            @Override
            public String toString(QuestionType object) {
                return object.getText();
            }

            @Override
            public QuestionType fromString(String string) {
                for (QuestionType t : types) {
                    if (t.getText().equals(string)) {
                        return t;
                    }
                }
                return null;
            }
        });
    }

    @FXML
    private void exit(ActionEvent event) {
        close();
    }

    @FXML
    private void add(ActionEvent event) {

        if (title.getText().isEmpty() || question.getText().isEmpty() || points.getText().isEmpty() || index.getText().isEmpty()) {
            Information.display("Některé údaje nebyly vyplněny.");
            return;
        }

        Integer p;
        Integer i;
        try {
            p = Integer.parseInt(points.getText());
            i = Integer.parseInt(index.getText());
        } catch (NumberFormatException ex) {
            Information.display("Některé hodnoty mají nesprávný typ.");
            return;
        }

        if (edit) {
            try {
                db.editQuestion(id, title.getText(), question.getText(), answer.getText(), p, i, type.getSelectionModel().getSelectedItem());

                Information.display("Úprava otázky úspěšná.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při úpravě došlo k chybě.");
            }
        } else {
            try {
                db.addQuestion(title.getText(), question.getText(), answer.getText(), p, i, type.getSelectionModel().getSelectedItem());

                Information.display("Vložení otázky úspěšné.");
            } catch (SQLException ex) {
                // Logger.getLogger(AddSubject.class.getName()).log(Level.SEVERE, null, ex);
                Information.display("Při vložení došlo k chybě.");
            }
        }
        close();
    }

    public void load(Question s) {
        edit = true;
        btnAdd.setText("Upravit");

        title.setText(s.getTitle());
        question.setText(s.getQ());
        answer.setText(s.getA());
        points.setText(s.getPoints().toString());
        index.setText(s.getIndex().toString());
        type.getSelectionModel().select(s.getType());

        id = s.getId();
    }
}
