package controller.info;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

@WebServlet("/info/missionlist")
@Slf4j
public class MissionList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		MissionService service = new MissionService();
		Criteria cri = ParamUtil.get(req, Criteria.class);
		cri.setAmount(Integer.MAX_VALUE);
		
		if(recommend == null) {
			recommend = Recommend.builder().recomContenttype(RecommendContentType.ATTRACTION).build();
		} else if (recommend.getRecomContenttype() == null) {
			recommend.setRecomContenttype(RecommendContentType.ATTRACTION);
		}
		
		HashMap<Long, List<String>> imgs = new HashMap<Long, List<String>>();
		
		if(recommend.getRecomContenttype() != RecommendContentType.FESTIVAL) {
			RecommendService recommendService = new RecommendService();
			List<Recommend> recommends = recommendService.list(cri, recommend.getRecomContenttype());
			
			for(Recommend r : recommends) {
				List<String> imglist = new ArrayList<>();
				
				imglist.addAll(recommendService.findByImgByRecomNo(r.getRecomNo()));
				
				
				imgs.put(r.getRecomNo(), imglist);
				
			}
		} else {
			RecommendService recommendService = new RecommendService();
			List<Recommend> recommends = recommendService.list(cri, recommend.getRecomContenttype());
			
			for(Recommend r : recommends) {
				List<String> imglist = new ArrayList<>();

				imglist.add(r.getFirstImage());
				
				imgs.put(r.getRecomNo(), imglist);
			}
			
		}
		
		cri.setAmount(9);
		
		
		PageDto dto = new PageDto(cri, service.getCount(cri, recommend.getRecomContenttype()));
		
		req.setAttribute("imglist", imgs);
		
		req.setAttribute("pageDto", dto);
		req.setAttribute("recommend", recommend);
		req.setAttribute("missionlist", service.list(cri, recommend.getRecomContenttype()));
		
		req.getRequestDispatcher("/WEB-INF/views/info/missionlist.jsp").forward(req, resp);
	}


	
}
