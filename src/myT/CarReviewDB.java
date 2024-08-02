package myT;

import java.sql.*;
import java.util.*;


public class CarReviewDB {
//	car_review
//	+----------+-------------+------+-----+---------+----------------+
//	| Field    | Type        | Null | Key | Default | Extra          |
//	+----------+-------------+------+-----+---------+----------------+
//	| rv_no    | int(11)     | NO   | PRI | NULL    | auto_increment |
//	| city_knm | varchar(20) | NO   |     | NULL    |                |
//	| capacity | int(11)     | YES  |     | NULL    |                |
//	| title    | varchar(30) | NO   |     | NULL    |                |
//	| cont     | text        | NO   |     | NULL    |                |
//	| user_id  | varchar(15) | NO   |     | NULL    |                |
//	| reg_date | datetime    | NO   |     | NULL    |                |
//	+----------+-------------+------+-----+---------+----------------+

	public Connection conn = null;
	public Statement stmt = null;
	
	public ArrayList<CarReview> selectAll() {
		
		ArrayList<CarReview> arry = null;
		try{
			connectDB();
			ResultSet rs = stmt.executeQuery("SELECT RV_NO, CITY_KNM, CAPACITY, TITLE, CONT, USER_ID, DATE_FORMAT(REG_DATE, '%Y-%m-%d') DATE FROM CAR_REVIEW ORDER BY RV_NO DESC;");
			
			arry = new ArrayList<CarReview>();
			
			//	해당 id에 대한 정보가 있는 경우(회원)
			while(rs.next()){
				CarReview review = new CarReview();

				review.setRvNo(rs.getInt("rv_no"));
				review.setCityKnm(rs.getString("city_knm"));
				review.setCapacity(rs.getInt("capacity"));
				review.setTitle(rs.getString("title"));
				review.setCont(rs.getString("cont"));
				review.setUserId(rs.getString("user_id"));
				review.setRegDate(rs.getString("date"));
				
				arry.add(review);
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return arry;
	}

	public ArrayList<CarReview> selectRow(String city, int capacity, String searchId, String searchText) {
		
		ArrayList<CarReview> arry = null;
		String sql = "SELECT RV_NO, CITY_KNM, CAPACITY, TITLE, CONT, USER_ID, DATE_FORMAT(REG_DATE, '%Y-%m-%d') DATE FROM CAR_REVIEW";
		sql += " WHERE CITY_KNM = '" + city + "'";
		
		if(capacity != 0)
			sql += " AND CAPACITY = " + capacity;
		
		if(!searchId.equals(""))
//			sql += " AND USER_ID = '" + searchId + "'";
			sql += " AND USER_ID LIKE '%" + searchId + "%'";

		if(!searchText.equals(""))
			sql += " AND CONT LIKE '%" + searchText + "%'"; 
		
		sql += " ORDER BY RV_NO DESC";

		
		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);
			
			arry = new ArrayList<CarReview>();
			
			//	해당 id에 대한 정보가 있는 경우(회원)
			while(rs.next()){
				CarReview review = new CarReview();

				review.setRvNo(rs.getInt("rv_no"));
				review.setCityKnm(rs.getString("city_knm"));
				review.setCapacity(rs.getInt("capacity"));
				review.setTitle(rs.getString("title"));
				review.setCont(rs.getString("cont"));
				review.setUserId(rs.getString("user_id"));
				review.setRegDate(rs.getString("date"));
				
				arry.add(review);
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return arry;
	}

	public int insertRow(CarReview review) {
		String sql = "INSERT INTO CAR_REVIEW VALUES( NULL, '";
		int cnt = 0;
		
		//	도시번호 가져와서 셋팅하는 로직 필요
		
		sql += review.getCityKnm() + "', " + review.getCapacity() +  ", '" + review.getTitle() +  "', '" + review.getCont() +  "', '" + review.getUserId() + "', SYSDATE() );";

		try{
			connectDB();
			cnt = stmt.executeUpdate(sql);
			
			//	해당 id에 대한 정보가 있는 경우(회원)
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return cnt;
	}
	
	
	public int deleteRow(String rvNO) {
		String sql = "DELETE FROM CAR_REVIEW WHERE RV_NO = " + rvNO + ";";
		int cnt = 0;
		
		try{
			connectDB();
			cnt = stmt.executeUpdate(sql);
			
			//	해당 id에 대한 정보가 있는 경우(회원)
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return cnt;
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
