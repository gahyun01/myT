package myT;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import green.myT.dto.Airplane;

public class AirplaneDB {
	public Connection conn = null;
	public Statement stmt = null;
	
	public Airplane selectRow(String plane_seq) {
		
		Airplane plane = null;
		String sql = "SELECT PLANE_NO, DEPT_TIME, ARRV_TIME, HOUR, DEPT_CITY, ARRV_CITY, LEVEL, PRICE FROM AIRPLANE WHERE PLANE_SEQ = " + plane_seq;

		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);

			//	해당 id에 대한 정보가 있는 경우(회원)
			if(rs.next()){
				plane = new Airplane();

				plane.setPlane_no(rs.getString("plane_no"));
				plane.setDept_time(rs.getString("dept_time"));
				plane.setArrv_time(rs.getString("arrv_time"));
				plane.setHour(rs.getString("hour"));
				plane.setDept_city(rs.getString("dept_city"));
				plane.setArrv_city(rs.getString("arrv_city"));
				plane.setLevel(rs.getString("level"));
				plane.setPrice(rs.getInt("price"));
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return plane;
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
