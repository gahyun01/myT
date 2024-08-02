package myT;

// qreply
// +-------------+-------------+------+-----+---------+----------------+
// | Field       | Type        | Null | Key | Default | Extra          |
// +-------------+-------------+------+-----+---------+----------------+
// | reply_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
// | qna_id      | int(11)     | NO   | MUL | NULL    |                |
// | reply_title | varchar(50) | NO   |     | NULL    |                |
// | reply_text  | text        | NO   |     | NULL    |                |
// | reply_date  | datetime    | NO   |     | NULL    |                |
// +-------------+-------------+------+-----+---------+----------------+

public class QnAReply {
    private int replyId;
    private int qnaId;
    private String replyTitle;
    private String replyText;

    public int getReplyId() {
        return replyId;
    }

    public int getQnaId() {
        return qnaId;
    }

    public String getReplyTitle() {
        return replyTitle;
    }

    public String getReplyText() {
        return replyText;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public void setQnaId(int qnaId) {
        this.qnaId = qnaId;
    }

    public void setReplyTitle(String replyTitle) {
        this.replyTitle = replyTitle;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }
}