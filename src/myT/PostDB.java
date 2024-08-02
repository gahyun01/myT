package myT;

import java.sql.*;
import java.util.*;

//+-------------+--------------+------+-----+---------+----------------+
//| Field       | Type         | Null | Key | Default | Extra          |
//+-------------+--------------+------+-----+---------+----------------+
//| rv_no       | int(11)      | NO   | PRI | NULL    | auto_increment |
//| in_no       | int(11)      | NO   |     | NULL    |                |
//| user_id     | varchar(15)  | NO   |     | NULL    |                |
//| fest_rtime  | datetime     | NO   |     | NULL    |                |
//| fest_rimage | varchar(255) | YES  |     | NULL    |                |
//| fest_rcont  | text         | NO   |     | NULL    |                |
//| fest_rstars | int(11)      | NO   |     | 5       |                |
//| fest_rc     | int(11)      | YES  |     | 0       |                |
//+-------------+--------------+------+-----+---------+----------------+

public class PostDB {
	public void PostDBinput(PostGetSet pgs){
		// form에서 postGetSetinput으로 던진 걸 getter로 잡아 setter에 넣어주고
		// PostDB의 객체를 만들고 PostDBinput을 선언하여 바로 여기로 날아왔다!
		
		Connection conn = null;
		Statement stmt = null;		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8&useSSL=false", "root", "1234");
			if (conn == null) {
				throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");
			}
			stmt = conn.createStatement();
			
			int row = stmt.executeUpdate("INSERT INTO festival_review(rv_no, user_id, fest_title, fest_rcont, fest_rtime) VALUES (DEFAULT, '"+pgs.getUser_id()+"', '"+pgs.getFest_title()+"', '"+pgs.getFest_rcont()+"', sysdate());");
			
			if (row > 0) {
		        System.out.println("데이터베이스에 값이 성공적으로 입력되었습니다.");
		    } else {
		        System.out.println("데이터베이스 입력에 실패했습니다.");
		    }
			
			
			} catch (Exception e) {
			System.out.println("Exception is... " + e);
		} finally {
			try {
				stmt.close();
				conn.close();
				System.out.print("Success...");
			} catch (Exception ex) {
				System.out.println("finally-catch DB Exception 발생 : " + ex);
			}
		}
	}
	
	public ArrayList<PostGetSet> PostDBselect() {
		ArrayList<PostGetSet> a = new ArrayList<PostGetSet>();

		PostGetSet pgs = null;

		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			// db, jsp, html 모두 한글 인코딩을 넣어야 하며
			// 그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8&useSSL=false", "root", "1234");

			if (conn == null)
				throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");

			stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM festival_review");

			// 해당 id에 대한 정보가 있는 경우(회원)
			while (rs.next()) {
				pgs = new PostGetSet();

				int rv_no = rs.getInt("rv_no");
				int in_no = rs.getInt("in_no");
				int fest_rstars = rs.getInt("fest_rstars");
				int fest_rc = rs.getInt("fest_rc");
				int fest_cnt = rs.getInt("fest_cnt");
				String user_id = rs.getString("user_id");
				String fest_rtime = rs.getString("fest_rtime");
				String fest_rimage = rs.getString("fest_rimage");
				String fest_rcont = rs.getString("fest_rcont");
				String fest_title = rs.getString("fest_title");

				pgs.setRv_no(rv_no);
				pgs.setIn_no(in_no);
				pgs.setUser_id(user_id);
//				pgs.setFest_rtime(fest_rtime);
				pgs.setFest_rtime(fest_rtime);
				pgs.setFest_rimage(fest_rimage);
				pgs.setFest_rcont(fest_rcont);
				pgs.setFest_rstars(fest_rstars);
				pgs.setFest_rc(fest_rc);
				pgs.setFest_title(fest_title);
				pgs.setFest_cnt(fest_cnt);

				a.add(pgs);
			}
		} catch (Exception e) {
			System.out.println("PostDBselect DB Exception 발생 : " + e);
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception ex) {
				System.out.println("finally-catch DB Exception 발생 : " + ex);
			}
		}
		return a;
	}
	
	public PostGetSet PostDBselectwhere(String rr) {
//		ArrayList<PostGetSet> a = new ArrayList<PostGetSet>();

		int rv_no = Integer.parseInt(rr);
		PostGetSet pgs = null;
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			// db, jsp, html 모두 한글 인코딩을 넣어야 하며
			// 그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8&useSSL=false", "root", "1234");

			if (conn == null)
				throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");

			stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM festival_review where rv_no = "+rv_no+";");

			// 해당 id에 대한 정보가 있는 경우(회원)
			while (rs.next()) {
				pgs = new PostGetSet();

				rv_no = rs.getInt("rv_no");
				String user_id = rs.getString("user_id");
				String fest_rcont = rs.getString("fest_rcont");
				String fest_title = rs.getString("fest_title");

				pgs.setRv_no(rv_no);
				pgs.setUser_id(user_id);
				pgs.setFest_rcont(fest_rcont);
				pgs.setFest_title(fest_title);

//				a.add(pgs);
			}
		} catch (Exception e) {
			System.out.println("PostDBselectwhere DB Exception 발생 : " + e);
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception ex) {
				System.out.println("finally-catch DB Exception 발생 : " + ex);
			}
		}
		return pgs;
	}
	
	public void postDBdelete(String dd){
		Connection conn = null;
		Statement stmt = null;
		int rv_no = Integer.parseInt(dd);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// db, jsp, html 모두 한글 인코딩을 넣어야 하며
			// 그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8&useSSL=false", "root", "1234");

			if (conn == null)
				throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");

			stmt = conn.createStatement();

			int row = stmt.executeUpdate("delete FROM festival_review where rv_no="+rv_no+";");
			
		} catch (Exception e) {
			System.out.println("PostDBdelete DB Exception 발생 : " + e);
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception ex) {
				System.out.println("finally-catch DB Exception 발생 : " + ex);
			}
		}
	}
}
