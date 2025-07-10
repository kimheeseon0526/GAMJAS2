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

		//1호선일 때 -> odr에 맞춰 경인선 + 경부선 + 1호선 + 경원선
		/*if("1호선".equals(lineName)) {
			List<Station> stationList = stationservice.getLine1All();
			String json = gson.toJson(stationList);
			resp.getWriter().write(json);
			return;
		}*/
		//5호선일 때는
		if("5호선".equals(lineName)) {
			Map<String, List<Station>> splitLines = stationservice.getSplit5LineStations();
			String json = gson.toJson(splitLines);
			resp.getWriter().write(json);
		}else {
			List<Station> stationList = stationservice.getLineStations(lineName);
			String json = gson.toJson(stationList);
			resp.getWriter().write(json);
		}

	}

}
