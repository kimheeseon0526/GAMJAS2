package controller.map;

import java.io.IOException;
import java.util.List;

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
		log.info("{}", lineName);
		
		List<Station> stationList = stationservice.getLineStations(lineName);
		
		resp.setContentType("application/json; charset=UTF-8");
		
		//Gson 변환
		Gson gson = new Gson();
		String json = gson.toJson(stationList);
		resp.getWriter().write(json);
		
	}

}
