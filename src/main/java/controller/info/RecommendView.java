package controller.info;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Station;
import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import domain.info.StationsByRecom;
import lombok.extern.slf4j.Slf4j;
import service.AttractionService;
import service.FestivalService;
import service.RecommendService;
import service.RestaurantService;
import service.StationService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/view")
public class RecommendView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("recomNo") == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/recommendlist", req, resp);
			return;
		}
		RecommendService service = new RecommendService();
		Recommend recommend = service.findBy(Long.parseLong(req.getParameter("recomNo")));
		
		log.info("{}", recommend);
		
		switch (recommend.getRecomContenttype()) {
			case RecommendContentType.ATTRACTION :  req.setAttribute("attraction", new AttractionService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.RESTAURANT :  req.setAttribute("restaurant", new RestaurantService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.FESTIVAL :  req.setAttribute("festival", new FestivalService().findBy(recommend.getRecomNo())); break;
		}
		recommend.setStations(service.findByStationByrecomPlaceId(recommend.getRecomContenttype(), recommend.getRecomPlaceId()));
		
		log.info("{}", recommend);
		Criteria cri = ParamUtil.get(req, Criteria.class);
		List<Station> subway = new ArrayList<>();
		Set<String> addedStationIds = new HashSet<>();
		for(StationsByRecom sbr : recommend.getStations() ) {
			List<Station> allSubway = new StationService().getLineStations(sbr.getStationLine());
			for(Station s : allSubway) {
				if(s.getId().equals(sbr.getStationId()) && !addedStationIds.contains(s.getId())) {
					subway.add(s);
					addedStationIds.add(s.getId());
				}
			}
		}
		
		log.info("{}", subway);
		PageDto dto = new PageDto(cri, service.getCount(cri, recommend.getRecomContenttype()));
		
		req.setAttribute("subway", subway);
		req.setAttribute("stations", recommend.getStations());
		req.setAttribute("cri", cri);
		req.setAttribute("recommend", recommend);
		req.setAttribute("recommendlist", service.list(cri, recommend.getRecomContenttype()));
		req.getRequestDispatcher("/WEB-INF/views/info/recommendview.jsp").forward(req, resp);
	}
	
	
	
}
