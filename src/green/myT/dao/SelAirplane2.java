package green.myT.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.*;
import green.myT.mybatis.SqlMapConfig;

//항공기 스케쥴 조회(왕복 모두 이 class 사용) : SelAirplane.java, SelAirPlane3.java
public class SelAirplane2 {
	static SelAirplane2 cc = new SelAirplane2();
	public static SelAirplane2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	List<Airplane> selectData(Parameter param) {
		
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		
		//	select하는 구문, select1는 ,xml2.xml에 id로 등록한 것을 부름
		//	id='select1' : SELECT * FROM USER
		List<Airplane> list = session.selectList("sel_airplane", param);
		session.close();
		
		//	받아온 List를 웹페이지 jsp에서 출력해야 하므로 Controller Servlet까지 다시 돌아가야 함
		//	ClassC -> ClassB로 return해줘야 함
		return list;
	}
}
