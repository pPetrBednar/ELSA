package elsa.database;

import java.util.ArrayList;

/**
 *
 * @author petrb
 */
public class EvaluatedQuizData {

    private Integer id;
    private String title;
    private Integer points;
    private Integer maxPoints;
    private ArrayList<EvaluatedQuestionData> questions;

    public EvaluatedQuizData(Integer id, String title, Integer points, Integer maxPoints, ArrayList<EvaluatedQuestionData> questions) {
        this.id = id;
        this.title = title;
        this.points = points;
        this.maxPoints = maxPoints;
        this.questions = questions;
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

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Integer getMaxPoints() {
        return maxPoints;
    }

    public void setMaxPoints(Integer maxPoints) {
        this.maxPoints = maxPoints;
    }

    public ArrayList<EvaluatedQuestionData> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<EvaluatedQuestionData> questions) {
        this.questions = questions;
    }

}
