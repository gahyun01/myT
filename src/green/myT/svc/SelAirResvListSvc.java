package green.myT.svc;

import java.sql.Connection;
import java.util.ArrayList;

import green.myT.dto.AirResvList;
import green.myT.dao.AirResvDAO;

import static green.myT.db.JdbcUtil.getConnection;
import static green.myT.db.JdbcUtil.close;

public class SelAirResvListSvc {
	
	public int getListCount(String user_id) throws Exception{
		int listCount = 0;
		System.out.println("2-1");
		Connection con = getConnection();
		System.out.println("2-2 con:" + con);
		
		AirResvDAO airDAO = AirResvDAO.getInstance();
		System.out.println("2-3");
		airDAO.setConnection(con);
		System.out.println("2-4");
		listCount = airDAO.selectListCount(user_id);
		System.out.println("2-5");
		close(con);
		System.out.println("2-6");
		
		return listCount;
		
	}

	public ArrayList<AirResvList> selectList(String user_id, String resv_no, int page) throws Exception{
		
		ArrayList<AirResvList> list = null;
		Connection con = getConnection();
		
		AirResvDAO airDAO = AirResvDAO.getInstance();
		airDAO.setConnection(con);
		list = airDAO.selectList(user_id, resv_no, page);
		close(con);
		
		return list;
		
	}

}
