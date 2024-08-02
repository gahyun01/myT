package green.myT.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import green.myT.dto.Festival_photo;
import green.myT.mybatis.SqlMapConfig;

//data 처리부.
public class FestvphotoPair {
	
	static FestvphotoPair fpp = new FestvphotoPair();
	public static FestvphotoPair fppmethod() {
	
		return fpp;
	}
	
	SqlSessionFactory fac = SqlMapConfig.getSqlSession();
	
	List<Festival_photo> function(int no){
		SqlSession session = fac.openSession();
		
		System.out.println("Festvphoto no= "+no);
		
		List<Festival_photo> list = session.selectList("festvphoto", no); // id no.
		
		System.out.println("list = "+list);
		
		session.close();
		return list;
	}
}
