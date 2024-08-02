package myT;

import java.sql.*;
import java.util.*;
import myT.QnAReply;

public class QnAReplyDB {
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

    public Connection conn = null;
	public Statement stmt = null;

    // 모든 QnA 답변을 데이터베이스에서 선택하여 ArrayList에 저장하여 반환
    public ArrayList<QnAReply> selectAll(){
        ArrayList<QnAReply> arry = null;

        try{
            connectDB();
            ResultSet rs = stmt.executeQuery("SELECT REPLY_ID, QNA_ID, REPLY_TITLE, REPLY_TEXT FROM QREPLY ORDER BY REPLY_ID DESC;");
            
            arry = new ArrayList<QnAReply>();

            while(rs.next()){
                QnAReply qnaReply = new QnAReply();

                qnaReply.setReplyId(rs.getInt("reply_id"));
                qnaReply.setQnaId(rs.getInt("qna_id"));
                qnaReply.setReplyTitle(rs.getString("reply_title"));
                qnaReply.setReplyText(rs.getString("reply_text"));

                arry.add(qnaReply);
            }
        }
        catch(Exception ex){
            //out.println("DB Exception 발생 : " + ex);
        }
        finally{
            try {
				closeDB();
			} catch(Exception ex) {}
        }
        return arry;
    }

    // QnA 답변을 데이터베이스에서 선택하여 반환
    

    // QnA 답변을 데이터베이스에 추가
    public void connectDB() throws Exception {

		Class.forName("com.mysql.jdbc.Driver");
		//	db, jsp, html 모두 한글 인코딩을 넣어야 하며
		//	그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planner?characterEncoding=utf8&useSSL=false", "root", "1234");

		if(conn == null)
			throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");

		stmt = conn.createStatement();
	}
	
    // 데이터베이스 연결 해제
	public void closeDB() throws Exception {
		stmt.close();
		conn.close();
	}
}