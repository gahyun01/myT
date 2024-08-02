package green.myT.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import green.myT.dto.AirResvList;
import green.myT.dto.Parameter;
import green.myT.mybatis.SqlMapConfig;

public class SelAirResvList2 {
	static SelAirResvList2 cc = new SelAirResvList2();
	public static SelAirResvList2 getThisClass(){
		return cc;
	}
	
	SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//	실질적으로 데이타처리
	List<AirResvList> selectData(Parameter param) {
		
		//	DB connection하는 역할
		SqlSession session = factory.openSession();
		
		//	select하는 구문, select1는 ,xml2.xml에 id로 등록한 것을 부름
		List<AirResvList> list = session.selectList("sel_airlist", param);
		session.close();
		
		//	받아온 List를 웹페이지 jsp에서 출력해야 하므로 Controller Servlet까지 다시 돌아가야 함
		return list;
	}
}
