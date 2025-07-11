package service;

import java.io.BufferedReader;

import java.io.IOException;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import domain.info.Recommend;
import mapper.RecommendMapper;
import org.apache.ibatis.session.SqlSession;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import api.Attraction;
import api.Festival;
import api.Restaurant;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttractionMapper;
import mapper.FestivalMapper;
import mapper.RestaurantMapper;
//import mapper.FestivalMapper;
import util.APIUtil;
import util.MybatisUtil;

@Slf4j
public class FestivalService { //최초 1회 수집용
	
	private int pageSize = 100;
	private int startPage = 1;
	
	public List<Festival> getList() throws IOException {
		List<Festival> list = new ArrayList<>();
//		while(true) {
//			int endPage = pageSize + startPage - 1;
			String head = "https://apis.data.go.kr/B551011/KorService2/searchFestival2?serviceKey=";
			String apiKey = APIUtil.getKey(Festival.class);
			String tail = "MobileApp=AppTest&MobileOS=ETC&pageNo=2&numOfRows=100&eventStartDate=20250101&arrange=C&modifiedtime=&areaCode=1&eventEndDate=20251231&_type=json";
			
			String urlStr = head + apiKey + tail ;
			
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
			JsonArray itemArray= jobj.getAsJsonObject("response").getAsJsonObject("body").getAsJsonObject("items").getAsJsonArray("item");
			
			Gson gson = new GsonBuilder().create(); 
			
			Festival[] arr = gson.fromJson(itemArray, Festival[].class);
			
			log.info("arrlength :: {}", arr.length);
			log.info("gson 객체를 배열로 담은 것");
//			for(Festival a : arr) {
//				log.info("{}", a);
//			}
			list.addAll(Arrays.asList(arr));
			log.info("배열을 list로 담은 것");
			list.forEach(a -> log.info("{}", a.toString()));
//			log.info("{}", Arrays.toString(page.split("/")));
//			String[] pages = page.split("/");
//			int subs = Integer.parseInt(pages[1]) - Integer.parseInt(pages[0]) + 1;
//			startPage += pageSize;
//			if(subs > arr.length) {
//				break;
//			}
//		}
		return list;
	}
	
//	public Festival selectOne(int no) throws IOException {
//		
//		List<Festival> list = (new FestivalService()).getList();
//		Festival ti = null;
//		for(Festival t : list) {
//			ti = list.get(no - 1);
//		}
//		
//		return ti;
//	}
	
	public void register(Festival Festival) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			mapper.insert(Festival);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Festival> list(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			
			List<Festival> list = mapper.list(cri);
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Festival> getRecomList(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);

			List<Festival> list = mapper.getRecomList(cri);

			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Festival findBy(Long recomNo) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			
			Festival fest = mapper.selectOne(recomNo);
			return fest;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Festival findByPk(String pk) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			return mapper.selectOneByPk(pk);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public long getCount(Criteria cri) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			return mapper.getCount(cri); //1page 10개씩
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public long getRecomCount(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			FestivalMapper mapper = session.getMapper(FestivalMapper.class);
			return mapper.getRecomCount(cri); //1page 10개씩

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

//	public static void main(String[] args) throws IOException {
//
//		FestivalService tis = new FestivalService();
//		List<Festival> list = tis.getList();
		
//		for(Festival a : list) {			
//			tis.register(a);
//		}
//		

//	}
}
