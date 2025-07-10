package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import domain.Station;
import lombok.extern.slf4j.Slf4j;
import mapper.StationMapper;
import util.APIUtil;
import util.MybatisUtil;

@Slf4j
public class StationService {

	int pageSize = 100;
	int startPage = 1;

	private static final Map<String, String> lineColorMap = new HashMap<>();

	//호선 증가시에 key, value 값만 넣어주면 됨
	static {
		lineColorMap.put("line1", "#0052A4");
		lineColorMap.put("line2", "#009D3E");
		lineColorMap.put("line3", "#EF7C1C");
		lineColorMap.put("line4", "#00A5DE");
		lineColorMap.put("line5", "#996CAC");
		lineColorMap.put("line6", "#CD7C2F");
		lineColorMap.put("line7", "#747F00");
		lineColorMap.put("line8", "#E6186C");
		lineColorMap.put("line9", "#BDB092");
	}


	public List<Station> getList() throws IOException {
		List<Station> list = new ArrayList<>();

		while (true) {
			int endPage = pageSize + startPage - 1;

			String page = startPage + "/" + endPage;

			String urlStr = new APIUtil().getOpenAPIURL(Station.class, "/json/subwayStationMaster/", page);

			URL url = new URL(urlStr);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");

			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			StringBuilder sb = new StringBuilder();
			String line;

			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			log.info(sb.toString());
			JsonObject jobj = JsonParser.parseString(sb.toString()).getAsJsonObject();
			JsonArray rows = jobj.getAsJsonObject("subwayStationMaster").getAsJsonArray("row");

			Gson gson = new GsonBuilder().create();

			Station[] arr = gson.fromJson(rows, Station[].class);

			log.info("arrlength :: {}", arr.length);
			log.info("gson 객체를 배열로 담은 것");

			list.addAll(Arrays.asList(arr));
			log.info("배열을 list로 담은 것");


			startPage += pageSize;
			if (pageSize > arr.length) {
				break;
			}
		}
		return list;

	}

	public void register(Station station) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			StationMapper mapper = session.getMapper(StationMapper.class);
			mapper.insert(station);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//=======================================================================================


	public List<Station> getLineStations(String lineName) {

		try (SqlSession session = MybatisUtil.getSqlSession()) {
			StationMapper mapper = session.getMapper(StationMapper.class);

			List<Station> list = mapper.selectByLine(lineName);
			//log.info("{}", list);

			if (list == null) {
				//log.info("{}", lineName);
				return new ArrayList<>();
			}

			//호선 컬러
			String lineColor = lineColorMap.getOrDefault(lineName, "#000000");
			for (Station station : list) {
				station.setLineColor(lineColor);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}
	//2호선 메서드처럼 양식 통일시키기
	public static List<List<Station>> getLine1Group() {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			StationMapper mapper = session.getMapper(StationMapper.class);
			List<Station> stations = mapper.selectLine1();
			
			List<Station> mainList = new ArrayList<Station>();
			List<Station> branchList1 = new ArrayList<Station>();
			
			//db상에 main , branch1 -> BranchGroup 컬럼 추가
			for(Station s : stations) {
				s.setLineColor(lineColorMap.get("line1"));
				String group = s.getBranchGroup();
				if("main".equals(group)) {
					mainList.add(s);
				}else if("branch1".equals(group)) {
					branchList1.add(s);
				}
			}
			List<List<Station>> result = new ArrayList<>();
			if (!mainList.isEmpty()) result.add(mainList);
			if (!branchList1.isEmpty()) result.add(branchList1);
			
			return result;
		}
	}
	//5호선일 때 분기 처리
	/*
	 * public Map<String, List<Station>> getSplit5LineStations() { try (SqlSession
	 * session = MybatisUtil.getSqlSession()) { StationMapper mapper =
	 * session.getMapper(StationMapper.class); List<Station> all =
	 * mapper.selectByLine("line5");
	 * 
	 * List<Station> hanamLine = new ArrayList<>(); List<Station> machunLine = new
	 * ArrayList<>();
	 * 
	 * String lineColor = lineColorMap.getOrDefault("line5", "#000000");
	 * 
	 * // ??? 분기 나누는 거 강동에 오면 true boolean isMachun = false; int gangdongodr = 39;
	 * //강동 odr
	 * 
	 * for (Station s : all) { s.setLineColor(lineColor);
	 * 
	 * int odr = s.getOdr(); if (odr <= 39) { // 공통 구간 → 양쪽에 다 넣음 hanamLine.add(s);
	 * machunLine.add(s); } else if (odr <= 49) { hanamLine.add(s); // 하남 방면 } else
	 * if (odr >= 50 && odr <= 56) { machunLine.add(s); // 마천 방면 } } Map<String,
	 * List<Station>> map = new HashMap<>(); map.put("hanamLine", hanamLine);
	 * map.put("machunLine", machunLine); return map; } catch (Exception e) {
	 * e.printStackTrace(); return new HashMap<>(); } }
	 */


	public List<List<Station>> getLine2Group() {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			StationMapper mapper = session.getMapper(StationMapper.class);
			List<Station> stations = mapper.selectLine2();
			
			List<Station> group = new ArrayList<>();
			List<Station> mainList = new ArrayList<>();
			List<Station> branchList1 = new ArrayList<>();	//까치산쪽
			List<Station> branchList2 = new ArrayList<>();	//용답쪽
			
			for(Station s : stations) {
				s.setLineColor(lineColorMap.get("line2"));
				 switch (s.getBranchGroup()) {
			        case "mainList":
			            mainList.add(s);
			            break;
			        case "branchList1":
			            branchList1.add(s);
			            break;
			        case "branchList2":
			            branchList2.add(s);
			            break;
				}
			}
			List<List<Station>> result = new ArrayList<>();
			if (!mainList.isEmpty()) result.add(mainList);
			if (!branchList1.isEmpty()) result.add(branchList1);
			if (!branchList2.isEmpty()) result.add(branchList2);

			return result;
		}
	}
	public List<List<Station>> getLine5Group() {
		// TODO Auto-generated method stub
		return null;
	}

	
}

		
		
