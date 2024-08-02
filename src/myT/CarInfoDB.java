package myT;

import java.sql.*;
import java.util.*;


public class CarInfoDB {
//	CAR_INFO
//	+----------+-------------+------+-----+---------+-------+
//	| Field    | Type        | Null | Key | Default | Extra |
//	+----------+-------------+------+-----+---------+-------+
//	| car_no   | varchar(10) | NO   | PRI | NULL    |       |
//	| capacity | int(11)     | YES  |     | NULL    |       |
//	| city_knm | varchar(20) | NO   |     | NULL    |       |
//	| price    | int(11)     | YES  |     | NULL    |       |
//	+----------+-------------+------+-----+---------+-------+

	public Connection conn = null;
	public Statement stmt = null;
	

//	public ArrayList<CarInfo> selectRow(String city_knm, int capacity) {
	public ArrayList<CarInfo> selectRow(String city_knm) {
		
		ArrayList<CarInfo> arry = null;
		String sql = "SELECT CAR_NO, CAPACITY, CITY_KNM, PRICE FROM CAR_INFO";
		sql += " WHERE CITY_KNM = '" + city_knm + "'";

		sql += " ORDER BY CAPACITY";

		
		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);
			
			arry = new ArrayList<CarInfo>();
			
			//	해당 id에 대한 정보가 있는 경우(회원)
			while(rs.next()){
				CarInfo info = new CarInfo();

				info.setCarNo(rs.getString("car_no"));
				info.setCapacity(rs.getInt("capacity"));
				info.setCityKnm(rs.getString("city_knm"));
				info.setPrice(rs.getInt("price"));
				arry.add(info);
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

//	public int insertRow(CarInfo info) {
//		String sql = "INSERT INTO CAR_INFO VALUES( NULL, NULL, '";
//		int cnt = 0;
//		
//		//	도시번호 가져와서 셋팅하는 로직 필요
//		
//		sql += info.getCityKnm() + "', " + info.getCapacity() +  ", '" + info.getTitle() +  "', '" + info.getCont() +  "', '" + info.getUserId() + "', SYSDATE() );";
//
//		try{
//			connectDB();
//			cnt = stmt.executeUpdate(sql);
//			
//			//	해당 id에 대한 정보가 있는 경우(회원)
//		} catch(Exception ex){
//			//out.println("DB Exception 발생 : " + ex);
//		} finally {
//			try {
//				closeDB();
//			} catch(Exception ex) {}
//		}
//		return cnt;
//	}
	
	
//	public int deleteRow(String rvNO) {
//		String sql = "DELETE FROM CAR_INFO WHERE RV_NO = " + rvNO + ";";
//		int cnt = 0;
//		
//		try{
//			connectDB();
//			cnt = stmt.executeUpdate(sql);
//			
//			//	해당 id에 대한 정보가 있는 경우(회원)
//		} catch(Exception ex){
//			//out.println("DB Exception 발생 : " + ex);
//		} finally {
//			try {
//				closeDB();
//			} catch(Exception ex) {}
//		}
//		return cnt;
//	}
	
//	public int updateRow(String rvNO) {
//		String sql = "UPDATE CAR_INFO SET CITY_KNM = '서울' WHERE RV_NO = 33; = " + rvNO + ";";
//		int cnt = 0;
//		
//		try{
//			connectDB();
//			cnt = stmt.executeUpdate(sql);
//			
//			//	해당 id에 대한 정보가 있는 경우(회원)
//		} catch(Exception ex){
//			//out.println("DB Exception 발생 : " + ex);
//		} finally {
//			try {
//				closeDB();
//			} catch(Exception ex) {}
//		}
//		return cnt;
//	}
	
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
