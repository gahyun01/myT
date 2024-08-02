package green.myT.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import green.myT.dto.Festival;
import green.myT.mybatis.SqlMapConfig;

//data 처리부.
public class DBselectPair {
	static DBselectPair dbsp = new DBselectPair();
	public static DBselectPair dbspmethod() {
		return dbsp;
	}
	SqlSessionFactory fac = SqlMapConfig.getSqlSession();
	
	List<Festival> function(int no, String searchcont){
		SqlSession session = fac.openSession();
		
		System.out.println("pair.java no="+no+", searchcont= "+searchcont);
		
		String sql = null;
		
		if(no == 0) {
			sql = "wselect";
		} else if(no == 1) {
			sql = "festvname";
		} else if(no == 2) {
			sql = "festvplace";
		} else if(no == 3) {
			sql = "festvstart";
		} else if(no == 4) {
			sql = "festvend";
		}
		
		System.out.println(sql);
		
		List<Festival> list = session.selectList(sql, searchcont); // id no.
		
		System.out.println(list);
		
		session.close();
		
		return list;
	}
}
