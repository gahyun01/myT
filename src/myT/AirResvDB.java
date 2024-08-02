package myT;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import green.myT.dto.AirResv;

public class AirResvDB {
	public Connection conn = null;
	public Statement stmt = null;
	
	public AirResv selectRow(String user_id, String plane_seq, String date, int guest_num) {
		
		AirResv resv = null;
		String sql = "SELECT * FROM AIR_RESV WHERE USER_ID = '" + user_id + "' AND PLANE_SEQ = " + plane_seq + " AND FLIGHT_DATE = '" + date +
					"' AND GUEST_NUM = " + guest_num + " AND RESV_NO NOT IN (SELECT RESV_NO FROM AIR_RESV_INFO) ORDER BY RESV_NO DESC LIMIT 1";

		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);

			//	해당 id에 대한 정보가 있는 경우(회원)
			if(rs.next()){
				resv = new AirResv();

				resv.setResv_no(rs.getInt("resv_no"));
				resv.setUser_id(rs.getString("user_id"));
				resv.setPlane_seq(rs.getInt("plane_seq"));
				resv.setFlight_date(rs.getString("flight_date"));
				resv.setGuest_num(rs.getInt("guest_num"));
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return resv;
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
