package green.myT.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import green.myT.mybatis.SqlMapConfig;

import green.myT.dto.*;

import java.util.List;

public class SelCarPickup2 {
	static SelCarPickup2 cc = new SelCarPickup2();
	public static SelCarPickup2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	List<CarPickup> selectData(String id) {
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		
		//	select하는 구문, select1는 ,xml2.xml에 id로 등록한 것을 부름
		//	id='select1' : SELECT * FROM USER
		List<CarPickup> list = session.selectList("sel_pickup", id);
		session.close();
		
		//	받아온 List를 웹페이지 jsp에서 출력해야 하므로 Controller Servlet까지 다시 돌아가야 함
		//	ClassC -> ClassB로 return해줘야 함
		return list;
	}
}
