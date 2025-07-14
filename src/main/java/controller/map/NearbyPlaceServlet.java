package controller.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Place;
import service.NearbyPlaceService;



@WebServlet("/nearbyPlaces")
public class NearbyPlaceServlet extends HttpServlet {
	private final NearbyPlaceService service = new NearbyPlaceService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String stationName = req.getParameter("stationName");
		
		if(stationName == null) {	//id 없을 때 에러 메세지
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "missing stationName");
			return;
		}
		
		//주변 장소 목록
		List<Place> places = service.getNearPlaces(stationName);
		
		resp.setContentType("application/json; charset=UTF-8");
		String json = new Gson().toJson(places);
		resp.getWriter().write(json);
	}

}
