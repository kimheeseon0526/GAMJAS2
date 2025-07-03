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

@WebServlet("/map")
public class MapList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		StationService service = new StationService();
		List<Station> stationList = service.getLine2Stations();
		req.setAttribute("stationList", stationList);
		req.getRequestDispatcher("/WEB-INF/views/map/map.jsp").forward(req, resp);
		
		
	}
}
