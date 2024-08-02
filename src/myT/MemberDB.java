package myT;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import green.myT.dto.Member;

public class MemberDB {
	
//	member;
//	+-----------+--------------+------+-----+---------+-------+
//	| Field     | Type         | Null | Key | Default | Extra |
//	+-----------+--------------+------+-----+---------+-------+
//	| user_id   | varchar(15)  | NO   | PRI | NULL    |       |
//	| pwd       | varchar(15)  | NO   |     | NULL    |       |
//	| k_lastnm  | varchar(30)  | NO   |     | NULL    |       |
//	| k_firstnm | varchar(30)  | NO   |     | NULL    |       |
//	| e_lastnm  | varchar(30)  | NO   |     | NULL    |       |
//	| e_firstnm | varchar(30)  | NO   |     | NULL    |       |
//	| gender    | varchar(1)   | NO   |     | NULL    |       |
//	| birth     | varchar(8)   | NO   |     | NULL    |       |
//	| email     | varchar(15)  | YES  |     | NULL    |       |
//	| email2    | varchar(15)  | YES  |     | NULL    |       |
//	| phone     | varchar(3)   | NO   |     | NULL    |       |
//	| phone1    | varchar(4)   | NO   |     | NULL    |       |
//	| phone2    | varchar(4)   | NO   |     | NULL    |       |
//	| post      | varchar(5)   | NO   |     | NULL    |       |
//	| addr      | varchar(100) | NO   |     | NULL    |       |
//	| reg_date  | datetime     | NO   |     | NULL    |       |
//	+-----------+--------------+------+-----+---------+-------+
	
	
	public Connection conn = null;
	public Statement stmt = null;
	
	public Member selectRow(String user_id) {
		
		Member user = null;
		String sql = "SELECT E_LASTNM, E_FIRSTNM, GENDER, BIRTH, EMAIL, EMAIL2, CONCAT(CONCAT(PHONE, PHONE1), PHONE2) PHONE FROM MEMBER WHERE USER_ID = '" + user_id + "'";

		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);

			//	해당 id에 대한 정보가 있는 경우(회원)
			if(rs.next()){
				user = new Member();

				user.setE_lastnm(rs.getString("e_lastnm"));
				user.setE_firstnm(rs.getString("e_firstnm"));
				user.setGender(rs.getString("gender"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setEmail2(rs.getString("email2"));
				user.setPhone(rs.getString("phone"));
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return user;
	}

	
	public void connectDB() throws Exception {

		Class.forName("com.mysql.jdbc.Driver");
		//	db, jsp, html 모두 한글 인코딩을 넣어야 하며
		//	그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planner?characterEncoding=utf8&useSSL=false", "root", "1234");

		if(conn == null)
			throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");

		stmt = conn.createStatement();
	}
	
	public void closeDB() throws Exception {
		stmt.close();
		conn.close();
	}

}
