package elsa.database;

/**
 *
 * @author petrb
 */
public class EvaluatedQuestionData {

    private Integer id;
    private Integer index;
    private String title;
    private String question;
    private String answer;
    private String answerOriginal;
    private Integer points;
    private QuestionType type;

    public EvaluatedQuestionData(Integer id, Integer index, String title, String question, String answer, String answerOriginal, Integer points, QuestionType type) {
        this.id = id;
        this.index = index;
        this.title = title;
        this.question = question;
        this.answer = answer;
        this.answerOriginal = answerOriginal;
        this.points = points;
        this.type = type;
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

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswerOriginal() {
        return answerOriginal;
    }

    public void setAnswerOriginal(String answerOriginal) {
        this.answerOriginal = answerOriginal;
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

}
