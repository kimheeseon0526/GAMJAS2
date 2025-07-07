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

@WebServlet("/map/lineinfodetail")
@Slf4j
public class LineInfoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//2호선 리스트 가져오기
		StationService stationService = new StationService();
		List<Station> list = stationService.getLineStations("7호선");
		log.info("{}", list);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		req.setAttribute("stationDetailList", json);
		req.getRequestDispatcher("/WEB-INF/views/map/lineinfodetail.jsp").forward(req, resp);			

	}

}
