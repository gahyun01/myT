package green.myT.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.AirResv;
import green.myT.mybatis.SqlMapConfig;

public class InsAirResv2 {
	static InsAirResv2 cc = new InsAirResv2();
	public static InsAirResv2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	int InsertData(List<AirResv> list) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		int result = session.insert("ins_airresv", list);

		session.commit();
		session.close();
		
		return result;
	}
}
