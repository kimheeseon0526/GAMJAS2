package domain;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import api.Attraction;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class GsonConvertTest {
	
	public List<Attraction> getList() throws IOException {
		String urlStr = "http://openapi.seoul.go.kr:8088/6a594745646b696d3435774a61436d/json/TbVwAttractions/1/5/";
		
		URL url = new URL(urlStr);
		
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		conn.setRequestMethod("GET");
		
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		
		StringBuilder sb = new StringBuilder();
		String line ;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		JsonObject jobj = JsonParser.parseString(sb.toString()).getAsJsonObject();
		JsonArray rows= jobj.getAsJsonObject("TbVwAttractions").getAsJsonArray("row");
		
		Gson gson = new Gson(); 
		
		Attraction[] arr = gson.fromJson(rows, Attraction[].class);
		
		List<Attraction> list = Arrays.asList(arr);
		
		return list;
	}
	
	Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.UPPER_CASE_WITH_UNDERSCORES).create();
	
	@Test
	@DisplayName("JsonTest")
	public void testToJson() throws IOException {
		List<Attraction> list =  new ArrayList<Attraction>(new GsonConvertTest().getList()); 
		String result = gson.toJson(list.get(0));
		log.info("{}", result);
		
	}
	
	public void testFromJson() throws Exception{
		List<Attraction> list =  new ArrayList<Attraction>(new GsonConvertTest().getList()); 
		String result = gson.toJson(list.get(0), Attraction.class);
		log.info("{}", result);
	}
}
