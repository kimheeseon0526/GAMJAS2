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
import service.StationService;

@WebServlet("/kakaomap")
public class MapList extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//		String line = req.getParameter("line");
//		if(line == null) line = "2호선";
		
		StationService service = new StationService();
		List<Station> stationList = new StationService().getLineStations("2호선");
		
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
		req.setAttribute("stationList", json);
		req.getRequestDispatcher("/WEB-INF/views/map/kakaomap.jsp").forward(req, resp);
		
		
	}
}