package controller.info;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.MissionService;
import service.RecommendService;
import util.ParamUtil;

@WebServlet("/info/recommendlist")
@Slf4j
public class RecommendList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RecommendService recommendService = new RecommendService();
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		log.info("{}", recommend);
		
		if(recommend == null) {
			recommend = Recommend.builder().recomContenttype(RecommendContentType.ATTRACTION).build();
		} else if (recommend.getRecomContenttype() == null) {
			recommend.setRecomContenttype(RecommendContentType.ATTRACTION);
		}
		Criteria cri = ParamUtil.get(req, Criteria.class);
		cri.setAmount(9);
		log.info("{}" ,cri);
		log.info("{}", recommend);
		PageDto dto = new PageDto(cri, recommendService.getCount(cri, recommend.getRecomContenttype()));
		log.info("{}", dto);
		
		req.setAttribute("pageDto", dto);
		req.setAttribute("recommend", recommend);
		req.setAttribute("recommendlist", recommendService.list(cri, recommend.getRecomContenttype()));
		req.getRequestDispatcher("/WEB-INF/views/info/recommendlist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	
}
