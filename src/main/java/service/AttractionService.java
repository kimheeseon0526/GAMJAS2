package service;

import java.io.BufferedReader;

import java.io.IOException;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
	
	int pageSize = 100;
	int startPage = 1;
	
	public List<Attraction> getList() throws IOException {
		List<Attraction> list = new ArrayList<>();
		while(true) {
			int endPage = pageSize + startPage - 1;
			
			String page = startPage + "/" + endPage;
			
			String urlStr = new APIUtil().getOpenAPIURL(Attraction.class, "http://openapi.seoul.go.kr:8088/", "/json/TbVwAttractions/", page);
			
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
			
			log.info("arrlength :: {}", arr.length);
			log.info("gson 객체를 배열로 담은 것");
//			for(Attraction a : arr) {
//				log.info("{}", a);
//			}
			
			list.addAll(Arrays.asList(arr));
			log.info("배열을 list로 담은 것");
//			list.forEach(a -> log.info("{}", a.getPostSn()));
			log.info("{}", Arrays.toString(page.split("/")));
			String[] pages = page.split("/");
			int subs = Integer.parseInt(pages[1]) - Integer.parseInt(pages[0]) + 1;
			
			startPage += pageSize;
			if(subs > arr.length) {
				break;
			}
//			if(arr.length < ) break;
		}
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
		
		for(Attraction a : list) {			
			tis.register(a);
		}
		

		
	}
}
