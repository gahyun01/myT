package green.myT.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.mybatis.SqlMapConfig;

public class DelCarPickup2 {
	static DelCarPickup2 cc = new DelCarPickup2();
	public static DelCarPickup2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	int deleteData(int resv_no) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		
		int result = session.delete("del_pickup", resv_no);
		session.commit();
		session.close();
		
		//	받아온 List를 웹페이지 jsp에서 출력해야 하므로 Controller Servlet까지 다시 돌아가야 함
		//	ClassC -> ClassB로 return해줘야 함
		return result;
	}
}
