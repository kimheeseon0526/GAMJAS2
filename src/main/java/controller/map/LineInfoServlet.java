package controller.map;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Station;
import lombok.extern.slf4j.Slf4j;
import service.StationService;

@WebServlet("/lineinfo")
@Slf4j
public class LineInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StationService stationservice = new StationService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String lineName = req.getParameter("lineName"); //lineinfo?line=
		log.info("노선이름 : {} ", lineName);
		resp.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();

		//1,2,5호선, 단선
		//js로 부터 오는 데이터의 값에 따라
		//리스트안의 리스트
		List<List<Station>> groupStations;
		
		switch(lineName) {
			case "line1" :
				groupStations = stationservice.getLine1Group();
				break;
			case "line2" :
				groupStations = stationservice.getLine2Group();
				break;
			case "line5" :
				groupStations = stationservice.getLine5Group();
				break;
				
			default :
				List<Station> stations = stationservice.getLineStations(lineName);
				groupStations = List.of(stations); //stations은 단선(분기선이 없으니)이어도 한 번 감싸서 data[0]
				break;
				
		}
		resp.getWriter().write(gson.toJson(groupStations));
	}

}
