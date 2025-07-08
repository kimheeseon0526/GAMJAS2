
package controller.map;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Station;
import lombok.extern.slf4j.Slf4j;
import service.StationService;

@WebServlet("/map/lineinfodetail")
@Slf4j
public class LineInfoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//lineinfodetail.jsp 의 초기 노선도 화면(1호선)
		StationService stationService = new StationService();
		List<Station> stationList = new StationService().getLineStations("1호선");
		
		if (stationList == null || stationList.isEmpty()) {
		    System.out.println("❌ stationList가 null 또는 비어있음");
		    stationList = new ArrayList<>();
		}
		List<Station> mainStations = stationList.stream()
			    .filter(s -> s.getOdr() != null)
			    .sorted(Comparator.comparing(Station::getOdr))
			    .collect(Collectors.toList());
		
		String json = new Gson().toJson(mainStations);
		System.out.println(json);
		req.setAttribute("stationDetailList", json);
		
		req.getRequestDispatcher("/WEB-INF/views/map/lineinfodetail.jsp").forward(req, resp);			

	}

}
