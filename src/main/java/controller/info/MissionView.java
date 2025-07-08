package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Mission;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.AttractionService;
import service.FestivalService;
import service.MissionService;
import service.RecommendService;
import service.RestaurantService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/missionview")
public class MissionView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("recomNo") == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/missionlist", req, resp);
			return;
		}
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		
		MissionService service = new MissionService();
		Mission mission= service.findBy(Long.parseLong(req.getParameter("recomNo")));
		log.info("{}", mission);
		
		
		Criteria cri = ParamUtil.get(req, Criteria.class);
		
		PageDto dto = new PageDto(cri, service.getCount(cri, recommend.getRecomContenttype()));
		
//		Board board =  service.findBy(Long.parseLong(req.getParameter("bno")));
		req.setAttribute("cri", cri);
		req.setAttribute("mission", mission);
		req.setAttribute("recommend", recommend);
		req.getRequestDispatcher("/WEB-INF/views/info/recommendview.jsp").forward(req, resp);
	}
	
	
	
}
