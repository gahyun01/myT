package green.myT.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.AirResvInfo;
import green.myT.mybatis.SqlMapConfig;

public class InsAirResvInfo2 {
	static InsAirResvInfo2 cc = new InsAirResvInfo2();
	public static InsAirResvInfo2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	int InsertData(List<AirResvInfo> list) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		int result = session.insert("ins_airinfo", list);

		session.commit();
		session.close();
		
		return result;
	}
}
