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


	public List<Station> getLineStations(String lineName) {

		try (SqlSession session = MybatisUtil.getSqlSession()) {
			StationMapper mapper = session.getMapper(StationMapper.class);

			List<Station> list = mapper.selectByLine(lineName);
			log.info("{}", list);

			if (list == null) {
				log.info("{}", lineName);
				return new ArrayList<>();
			}

			//호선 컬러
			String lineColor = lineColorMap.getOrDefault(lineName, "#000000");
			for (Station station : list) {
				station.setLineColor(lineColor);
				log.info("{}", lineColor);

			}

			if ("2호선".equals(lineName) && !list.isEmpty()) {
				list.add(list.get(0));    //2호선만
			}
			log.info("{}", list.size());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	public Map<String, List<Station>> getSplit5LineStations() {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			StationMapper mapper = session.getMapper(StationMapper.class);
			List<Station> all = mapper.selectByLine("5호선");

			List<Station> hanamLine = new ArrayList<>();
			List<Station> machunLine = new ArrayList<>();

			String lineColor = lineColorMap.getOrDefault("5호선", "#000000");

			// ??? 분기 나누는 거 강동에 오면 true
			boolean isMachun = false;
			int gangdongodr = 39;

			for (Station s : all) {
				s.setLineColor(lineColor);

				int odr = s.getOdr();
				if (odr <= 39) {
					// 공통 구간 → 양쪽에 다 넣음
					hanamLine.add(s);
					machunLine.add(s);
				} else if (odr <= 49) {
					hanamLine.add(s); // 하남 방면
				} else if (odr >= 50 && odr <= 56) {
					machunLine.add(s); // 마천 방면
				}
			}
			Map<String, List<Station>> map = new HashMap<>();
			map.put("hanamLine", hanamLine);
			map.put("machunLine", machunLine);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return new HashMap<>();
		}
	}
}

		
		
