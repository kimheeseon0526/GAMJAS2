package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


public class HikariCPutil {
	private static HikariDataSource dataSource;
	static {
		HikariConfig config = new HikariConfig();
		
		Hashtable<String, Object> hashtable;
		// Properties <String, String> 이 친구는 hashtable의 자손이다. 
		//설정 정보 관리, 파일
		
		Properties props = PropsLoaderUtil.getProperties("secret/db.properties"); // properties		
		//현재 실행중인 스레드의 컨텍스트 클래스로더의 위치에서 resource를 stream형태로 가져오기
		try(InputStream is = Thread.currentThread()
									.getContextClassLoader()
									.getResourceAsStream("secret/db.properties")) {
			if (is == null) {
				throw new FileNotFoundException("Cannot find db.properties in classpath");
			}
			props.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		config.setJdbcUrl(props.getProperty("jdbc.url"));
		config.setUsername(props.getProperty("jdbc.username"));
		config.setPassword(props.getProperty("jdbc.password"));
//		config.setDriverClassName("org.mariadb.jdbc.Driver");
		config.setDriverClassName(props.getProperty("jdbc.driver.classname"));
		
		
		config.setMaximumPoolSize(10); // 최대 10개
		config.setMinimumIdle(5); //초기대기상태 5개
		config.setIdleTimeout(30000);
		config.setConnectionTimeout(30000);
		config.setPoolName("MyHikariCP");
		
		dataSource = new HikariDataSource(config);
	}
	public static DataSource getDataSource() {
		return dataSource;
	}
	public static void main(String[] args) {
		System.out.println(getDataSource());
		System.out.println(dataSource);
		
	}
}
