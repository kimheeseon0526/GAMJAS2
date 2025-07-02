package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Properties;

import api.Attraction;
import api.Festival;
import api.Restaurant;
import domain.Station;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		apiKeys.put(Restaurant.class, props.getProperty("restaurantApiKey"));
		apiKeys.put(Festival.class, props.getProperty("festivalApiKey"));
//		apiKeys.put(Station.class, props.getProperty("stationApiKey"));

	}
	
	public static <T> String getKey(Class<T> clazz) {
		
		return apiKeys.get(clazz);
	}
	
	public <T> String getOpenAPIURL(Class<T> clazz, String tail, String page) {
		StringBuilder sb = new StringBuilder();
		String result = sb.append("http://openapi.seoul.go.kr:8088/").append(APIUtil.getKey(clazz)).append(tail).append(page).toString(); 
		return result;
	}
	
	public static void main(String[] args) {
		StringBuilder sb = new StringBuilder();
		
		String result = sb.append("머리").append("꼬리").toString();
		 
		 
		log.info("{}", result);
	}
}
