package service;

import java.io.BufferedReader;

import java.io.IOException;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import api.Attraction;
import lombok.extern.slf4j.Slf4j;
import mapper.AttractionMapper;
import util.APIUtil;
import util.MybatisUtil;

@Slf4j
public class AttractionService {
	
	
	
	public List<Attraction> getList() throws IOException {
		
		String urlStr = new APIUtil().getURL(Attraction.class);
		
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
		
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.UPPER_CASE_WITH_UNDERSCORES).create(); 
		
		Attraction[] arr = gson.fromJson(rows, Attraction[].class);
		log.info("gson 객체를 배열로 담은 것");
		for(Attraction a : arr) {
			log.info("{}", a);
		}
		
		List<Attraction> list = Arrays.asList(arr);
		log.info("배열을 list로 담은 것");
		list.forEach(a -> log.info("{}", a));
		return list;
	}
	
//	public Attraction selectOne(int no) throws IOException {
//		
//		List<Attraction> list = (new AttractionService()).getList();
//		Attraction ti = null;
//		for(Attraction t : list) {
//			ti = list.get(no - 1);
//		}
//		
//		return ti;
//	}
	
	public void register(Attraction attraction) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			AttractionMapper mapper = session.getMapper(AttractionMapper.class);
			mapper.insert(attraction);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		AttractionService tis = new AttractionService();
		List<Attraction> list = tis.getList();
		
//		for(Attraction a : list) {			
//			tis.register(a);
//		}
		

		
	}
}
