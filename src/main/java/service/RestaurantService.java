package service;

import java.io.BufferedReader;

import java.io.IOException;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import api.Festival;
import domain.en.RecommendContentType;
import mapper.FestivalMapper;
import mapper.RecommendMapper;
import org.apache.ibatis.session.SqlSession;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import api.Attraction;
import api.Restaurant;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttractionMapper;
import mapper.RestaurantMapper;
import util.APIUtil;
import util.MybatisUtil;

@Slf4j
public class RestaurantService { //최초 1회 수집용
	
	int pageSize = 100;
	int startPage = 1;
	
	public List<Restaurant> getList() throws IOException {
		List<Restaurant> list = new ArrayList<>();
		while(true) {
			int endPage = pageSize + startPage - 1;
			
			String page = startPage + "/" + endPage;
			
			String urlStr = new APIUtil().getOpenAPIURL(Restaurant.class, "/json/TbVwRestaurants/", page);
			
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
			JsonArray rows= jobj.getAsJsonObject("TbVwRestaurants").getAsJsonArray("row");
			
			Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.UPPER_CASE_WITH_UNDERSCORES).create(); 
			
			Restaurant[] arr = gson.fromJson(rows, Restaurant[].class);
			
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



	public List<Restaurant> list(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			
			List<Restaurant> list = mapper.list(cri);
			
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Restaurant> getRecomList(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);

			List<api.Restaurant> list = mapper.getRecomList(cri);

			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public long getCount(Criteria cri) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			return mapper.getCount(cri); //1page 10개씩
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public long getRecomCount(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			return mapper.getRecomCount(cri);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Restaurant findBy(Long recomNo) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			
			Restaurant rest = mapper.selectOne(recomNo);
			return rest;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Restaurant findByPk(String pk) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			return mapper.selectOneByPk(pk);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void register(Restaurant restaurant) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			RestaurantMapper mapper = session.getMapper(RestaurantMapper.class);
			mapper.insert(restaurant);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		RestaurantService rs = new RestaurantService();
		List<Restaurant> list = rs.getList();
		
		for(Restaurant r : list) {			
			rs.register(r);
		}
		

	}
}
