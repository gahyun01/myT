package green.myT.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.CarResvDetail;
import green.myT.mybatis.SqlMapConfig;

public class InsCarResvDetail2 {
	static InsCarResvDetail2 cc = new InsCarResvDetail2();
	public static InsCarResvDetail2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	int InsertData(CarResvDetail data) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		
		int result = session.insert("insert1", data);
		session.commit();
		session.close();
		
		return result;
	}

}
