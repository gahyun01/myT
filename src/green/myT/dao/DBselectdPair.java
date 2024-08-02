package green.myT.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import green.myT.dto.Festival;
import green.myT.mybatis.SqlMapConfig;

//data 처리부.
public class DBselectdPair {
	
	static DBselectdPair dbsdp = new DBselectdPair();
	public static DBselectdPair dbsdpmethod() {
	
		return dbsdp;
	}
	
	SqlSessionFactory fac = SqlMapConfig.getSqlSession();
	
	List<Festival> function(int no){
		SqlSession session = fac.openSession();
		
		System.out.println("DBselectedPpair no="+no);

		List<Festival> list = session.selectList("dselect", no); // id no.
		
		System.out.println(list);
		
		session.commit(); // why is it here?
		session.close();
		return list;
	}
}
