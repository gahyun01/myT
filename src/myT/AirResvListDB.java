package myT;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import green.myT.dto.AirResvList;

public class AirResvListDB {
	public Connection conn = null;
	public Statement stmt = null;
	
	public List<AirResvList> selectForCar(String user_id) {
		
		List<AirResvList> list = new ArrayList<AirResvList>();
		AirResvList resv = null;
		
		String sql = "SELECT A.RESV_NO, B.RESV_INFO_NO, DATE_FORMAT(A.FLIGHT_DATE, '%Y-%m-%d') FLIGHT_DATE,  D.PLANE_NO, D.DEPT_CITY, D.ARRV_CITY, D.DEPT_TIME, D.ARRV_TIME";
		sql += " FROM AIR_RESV A, AIR_RESV_INFO B, MEMBER C, AIRPLANE D";
		sql += " WHERE A.USER_ID = '" + user_id + "'";
		sql += " AND A.RESV_NO = B.RESV_NO AND A.PLANE_SEQ = D.PLANE_SEQ AND A.USER_ID = C.USER_ID AND B.E_LASTNM = C.E_LASTNM";
		sql += " AND B.E_FIRSTNM = C.E_FIRSTNM AND A.FLIGHT_DATE > SYSDATE() ORDER BY A.RESV_NO, RESV_INFO_NO";
		
		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);
	

			//	해당 id에 대한 정보가 있는 경우(회원)
			while(rs.next()){
				resv = new AirResvList();

				resv.setResv_no(rs.getInt("resv_no"));
				
				//	int plane_seq에 int resv_info_no setting
				resv.setPlane_seq(rs.getInt("resv_info_no"));
				resv.setFlight_date(rs.getString("flight_date"));
				resv.setPlane_no(rs.getString("plane_no"));
				resv.setDept_city(rs.getString("dept_city"));
				resv.setArrv_city(rs.getString("arrv_city"));
				resv.setDept_time(rs.getString("dept_time"));
				resv.setArrv_time(rs.getString("arrv_time"));
				
				list.add(resv);
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return list;
	}
	
	public List<AirResvList> selectList(String user_id) {
		
		List<AirResvList> list = new ArrayList<AirResvList>();
		AirResvList resv = null;
		
		String sql = "SELECT A.RESV_NO, DATE_FORMAT(A.FLIGHT_DATE, '%Y-%m-%d') FLIGHT_DATE,  D.PLANE_NO, D.DEPT_CITY, D.ARRV_CITY, D.DEPT_TIME, D.ARRV_TIME";
		sql += " FROM AIR_RESV A, AIRPLANE D";
		sql += " WHERE A.USER_ID = '" + user_id + "' AND A.PLANE_SEQ = D.PLANE_SEQ";
		sql += " ORDER BY A.RESV_NO";
		
		try{
			connectDB();
			ResultSet rs = stmt.executeQuery(sql);
	

			//	해당 id에 대한 정보가 있는 경우(회원)
			while(rs.next()){
				resv = new AirResvList();

				resv.setResv_no(rs.getInt("resv_no"));
				resv.setFlight_date(rs.getString("flight_date"));
				resv.setPlane_no(rs.getString("plane_no"));
				resv.setDept_city(rs.getString("dept_city"));
				resv.setArrv_city(rs.getString("arrv_city"));
				resv.setDept_time(rs.getString("dept_time"));
				resv.setArrv_time(rs.getString("arrv_time"));
				
				list.add(resv);
			}
		} catch(Exception ex){
			//out.println("DB Exception 발생 : " + ex);
		} finally {
			try {
				closeDB();
			} catch(Exception ex) {}
		}
		return list;
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
