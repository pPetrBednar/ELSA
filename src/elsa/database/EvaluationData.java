package elsa.database;

/**
 *
 * @author petrb
 */
public class EvaluationData {

    private User user;
    private Integer quizes;
    private Integer maxQuizes;
    private Integer points;
    private Integer maxPoints;

    public EvaluationData(User user, Integer quizes, Integer maxQuizes, Integer points, Integer maxPoints) {
        this.user = user;
        this.quizes = quizes;
        this.maxQuizes = maxQuizes;
        this.points = points;
        this.maxPoints = maxPoints;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getQuizes() {
        return quizes;
    }

    public void setQuizes(Integer quizes) {
        this.quizes = quizes;
    }

    public Integer getMaxQuizes() {
        return maxQuizes;
    }

    public void setMaxQuizes(Integer maxQuizes) {
        this.maxQuizes = maxQuizes;
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

}
