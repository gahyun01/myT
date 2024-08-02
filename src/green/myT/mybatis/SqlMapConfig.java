package green.myT.mybatis;

import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	//	static은 객체를 1번만 만들어놓는 것임
	//	mybatis 사용함
	private static SqlSessionFactory sqlSession;
	public static SqlSessionFactory getSqlSession(){
	return sqlSession;
	}

	static{
		try {
			String resource = "green/myT/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
