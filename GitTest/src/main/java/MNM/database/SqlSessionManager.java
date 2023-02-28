package MNM.database;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	// 객체 생성 시 실행되는 부분
	static{
		// 이 부분만 바꿔주면 됨
		String resource = "MNM/database/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// DAO에서 sqlsessionfactory를 가져갈 수 있게끔 만드는 메소드 생성
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
}