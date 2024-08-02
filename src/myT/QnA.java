package myT;

// qna
// +-----------+--------------+------+-----+---------+----------------+
// | Field     | Type         | Null | Key | Default | Extra          |
// +-----------+--------------+------+-----+---------+----------------+
// | qna_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
// | user_id   | varchar(15)  | NO   |     | NULL    |                |
// | qna_title | varchar(50)  | NO   |     | NULL    |                |
// | qna_text  | text         | NO   |     | NULL    |                |
// | qna_pic   | varchar(255) | YES  |     | NULL    |                |
// | qna_date  | datetime     | NO   |     | NULL    |                |
// +-----------+--------------+------+-----+---------+----------------+

public class QnA {
    private int qnaId;
    private String userId;
    private String qnaTitle;
    private String qnaText;
    private String qnaPic;

    public int getQnaId() {
        return qnaId;
    }

    public String getUserId() {
        return userId;
    }

    public String getQnaTitle() {
        return qnaTitle;
    }

    public String getQnaText() {
        return qnaText;
    }

    public String getQnaPic() {
        return qnaPic;
    }

    public void setQnaId(int qnaId) {
        this.qnaId = qnaId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setQnaTitle(String qnaTitle) {
        this.qnaTitle = qnaTitle;
    }

    public void setQnaText(String qnaText) {
        this.qnaText = qnaText;
    }

    public void setQnaPic(String qnaPic) {
        this.qnaPic = qnaPic;
    }
}