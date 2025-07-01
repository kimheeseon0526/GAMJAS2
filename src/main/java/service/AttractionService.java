package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import api.Attraction;

public class AttractionService {
	public List<Attraction> getList() throws IOException {
		String urlStr = "http://openapi.seoul.go.kr:8088/6a594745646b696d3435774a61436d/json/TbVwAttractions/1/1000/";
		
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
	
	public Attraction selectOne(int no) throws IOException {
		
		List<Attraction> list = (new AttractionService()).getList();
		Attraction ti = null;
		for(Attraction t : list) {
			ti = list.get(no - 1);
		}
		
		return ti;
	}
	
	public static void main(String[] args) throws IOException {
		
		AttractionService tis = new AttractionService();
		List<Attraction> list = tis.getList();
		
		System.out.println(list);
		System.out.println(list.size());
		System.out.println(tis.selectOne(2).getAddress());
		
	}
}
