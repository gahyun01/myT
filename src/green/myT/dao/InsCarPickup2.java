package green.myT.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.*;
import green.myT.mybatis.*;

public class InsCarPickup2 {
	static InsCarPickup2 cc = new InsCarPickup2();
	public static InsCarPickup2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	int InsertData(CarPickup data) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		int result = session.insert("ins_pickup", data);

		session.commit();
		session.close();
		
		return result;
	}
}
