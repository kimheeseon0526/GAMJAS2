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
		lineColorMap.put("1호선", "#0052A4");
		lineColorMap.put("2호선", "#009D3E");
		lineColorMap.put("3호선", "#EF7C1C");
		lineColorMap.put("4호선", "#00A5DE");
		lineColorMap.put("5호선", "#996CAC");
		lineColorMap.put("6호선", "#CD7C2F");
		lineColorMap.put("7호선", "#747F00");
		lineColorMap.put("8호선", "#E6186C");
		lineColorMap.put("9호선", "#BDB092");
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

	//단선
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
			
			List<Station> mainList = mapper.selectLine1Main();
			List<Station> branchList1 = mapper.selectLine1Branch1();
			
			//db상에 main , branch1 -> BranchGroup 컬럼 추가
			mainList.forEach(s -> s.setLineColor(lineColorMap.get("1호선")));
			branchList1.forEach(s -> s.setLineColor(lineColorMap.get("1호선")));

			List<List<Station>> result = new ArrayList<>();
			if (!mainList.isEmpty()) result.add(mainList);
			if (!branchList1.isEmpty()) result.add(branchList1);
			
			return result;
		}
	}
	public List<List<Station>> getLine2Group() {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			StationMapper mapper = session.getMapper(StationMapper.class);
			List<Station> stations = mapper.selectLine2();

			List<Station> mainList = new ArrayList<>();
			List<Station> branchList1 = new ArrayList<>();	//까치산쪽
			List<Station> branchList2 = new ArrayList<>();	//용답쪽

			for (Station s : stations) {
				s.setLineColor(lineColorMap.get("2호선"));
				String group = s.getBranchGroup();
				if ("main".equals(group)) {
					mainList.add(s);
				} else if ("branch1".equals(group)) {
					branchList1.add(s);
				} else if ("branch2".equals(group)) {
					branchList2.add(s);
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
		try(SqlSession session = MybatisUtil.getSqlSession()){
			StationMapper mapper =  session.getMapper(StationMapper.class);
			List<Station> stations = mapper.selectLine5();

			List<Station> mainList = new ArrayList<>();
			List<Station> branchList1 = new ArrayList<>();

			for(Station s : stations) {
				s.setLineColor(lineColorMap.get("5호선"));
				if("main".equals(s.getBranchGroup())) {
					mainList.add(s);
				}else if("branch1".equals(s.getBranchGroup())) {
					branchList1.add(s);
				}
			}
			//강동역 강제 추가(선 끊어짐 방지)
			Station gangdong = mainList.stream()
					.filter(s -> "강동".equals(s.getName()))
					.findFirst().orElse(null);
			if(gangdong != null) {
				branchList1.add(0, gangdong);
			}

			List<List<Station>> result = new ArrayList<>();
			if (! mainList.isEmpty()) result.add(mainList);
			if(! branchList1.isEmpty()) result.add(branchList1);
			return result;
		}
	}
}





		
		
