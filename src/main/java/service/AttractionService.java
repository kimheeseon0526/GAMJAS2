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
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttractionMapper;
import util.APIUtil;
import util.MybatisUtil;

@Slf4j
public class AttractionService { //최초 1회 수집용
	
	int pageSize = 100;
	int startPage = 1;
	
	public List<Attraction> getAPIList() throws IOException {
		List<Attraction> list = new ArrayList<>();
		while(true) {
			int endPage = pageSize + startPage - 1;
			
			String page = startPage + "/" + endPage;
			
			String urlStr = new APIUtil().getOpenAPIURL(Attraction.class, "/json/TbVwAttractions/", page);
			
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
			
			startPage += pageSize;
			if(pageSize > arr.length) {
				break;
			}
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
	
	public List<Attraction> list() {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			AttractionMapper mapper = session.getMapper(AttractionMapper.class);
			
			List<Attraction> list = mapper.list();
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
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
		List<Attraction> list = tis.getAPIList();
		
		for(Attraction a : list) {			
			tis.register(a);
		}
		

	}
}
