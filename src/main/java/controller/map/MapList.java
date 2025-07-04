package controller.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Station;

import service.StationService;

@WebServlet("/kakaomap")
public class MapList extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		StationService service = new StationService();
		List<Station> stationList = service.getLine2Stations();
		req.setAttribute("stationList", stationList);
		req.getRequestDispatcher("/WEB-INF/views/map/kakaomap.jsp").forward(req, resp);
		
		
	}
}
