package green.myT.dao;

import static green.myT.db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import green.myT.dto.AirResvList;

public class AirResvDAO {
	DataSource ds;
	Connection con;
	private static AirResvDAO airDAO;
	
	public static AirResvDAO getInstance(){
		if(airDAO == null){
			airDAO = new AirResvDAO();
		}
		return airDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	public int selectListCount(String user_id) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM AIR_RESV A, AIR_RESV_INFO B, AIRPLANE C  WHERE A.RESV_NO = B.RESV_NO AND A.PLANE_SEQ = C.PLANE_SEQ AND A.USER_ID = ?";

		try{
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;

	}
	

	public ArrayList<AirResvList> selectList(String user_id, String resv_no, int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT A.RESV_NO, A.PLANE_SEQ, C.PLANE_NO, B.E_LASTNM, B.E_FIRSTNM, C.DEPT_CITY, C.ARRV_CITY, A.FLIGHT_DATE, C.DEPT_TIME, C.ARRV_TIME, C.HOUR, C.LEVEL, C.PRICE, B.CHILD, DATE_FORMAT(B.REG_DATE, '%Y-%m-%d') RESV_DATE" 
					+ " FROM AIR_RESV A, AIR_RESV_INFO B, AIRPLANE C  WHERE A.RESV_NO = B.RESV_NO AND A.PLANE_SEQ = C.PLANE_SEQ AND A.USER_ID = ?";

		if( !resv_no.equals("ALL") ) {
			sql += " AND A.RESV_NO = ?";
		}
		
		sql += " ORDER BY A.RESV_NO, B.RESV_INFO_NO LIMIT ?, 10";

		
		ArrayList<AirResvList> list = new ArrayList<AirResvList>();
		AirResvList resv = null;
		int startrow=(page - 1) * 10; 

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			if( !resv_no.equals("ALL") ) {
				pstmt.setString(2, resv_no);
				pstmt.setInt(3, startrow);
			}else
				pstmt.setInt(2, startrow);
				
			rs = pstmt.executeQuery();

			while(rs.next()){
				resv = new AirResvList();
				resv.setResv_no(rs.getInt("resv_no"));
				
				resv.setPlane_seq(rs.getInt("plane_seq"));
				resv.setPlane_no(rs.getString("plane_no"));
				resv.setE_lastnm(rs.getString("e_lastnm"));
				resv.setE_firstnm(rs.getString("e_firstnm"));
				resv.setDept_city(rs.getString("dept_city"));
				resv.setArrv_city(rs.getString("arrv_city"));
				resv.setFlight_date(rs.getString("flight_date"));
				resv.setDept_time(rs.getString("dept_time"));
				resv.setArrv_time(rs.getString("arrv_time"));
				resv.setHour(rs.getString("hour"));
				resv.setLevel(rs.getString("level"));
				resv.setPrice(rs.getInt("price"));
				resv.setChild(rs.getString("child"));
				resv.setResv_date(rs.getString("resv_date"));

				list.add(resv);
			}

		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return list;

	}
	
}
