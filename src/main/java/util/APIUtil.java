package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Properties;

import api.Attraction;
import domain.Station;

public class APIUtil {
	
	private static HashMap<Class<?>, String> apiKeys = new HashMap<>();
	
	static {		
		Properties props= new Properties();
		
		//현재 실행중인 스레드의 컨텍스트 클래스로더의 위치에서 resource를 stream형태로 가져오기
		try(InputStream is = Thread.currentThread()
				.getContextClassLoader()
				.getResourceAsStream("secret/api.properties")) {
			if (is == null) {
				throw new FileNotFoundException("Cannot find api.properties in classpath");
			}
			props.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		apiKeys.put(Attraction.class, props.getProperty("attractionApiKey"));
//		apiKeys.put(Attraction.class, props.getProperty("attractionApiKey"));
//		apiKeys.put(Attraction.class, props.getProperty("attractionApiKey"));
		apiKeys.put(Station.class, props.getProperty("stationApiKey"));
//		restaurantApiKey = props.getProperty("restaurantApiKey");
//		festivalApiKey = props.getProperty("festivalApiKey");
//		stationApiKey = props.getProperty("stationApiKey");
	}
	
	public static <T> String getKey(Class<T> clazz) {
		
		return apiKeys.get(clazz);
	}
	
	public <T> String getURL(Class<T> clazz) {
		String head = "http://openapi.seoul.go.kr:8088/";
		String key = APIUtil.getKey(clazz);
		String tail = "/json/TbVwAttractions/";
		String page = "1000/1100/";
		return head+ key + tail + page;
	}
}
