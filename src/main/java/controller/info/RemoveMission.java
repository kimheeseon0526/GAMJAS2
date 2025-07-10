package controller.info;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Mission;
import domain.info.Recommend;
import service.MissionService;
import service.RecommendService;
import util.AlertUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/info/removemission")
public class RemoveMission extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MissionService service = new MissionService();
		Mission mission = service.findBy(Long.parseLong(req.getParameter("missionNo")));
		if(mission.getMissionNo() == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/missionlist", req, resp);
			return;
		}
		
		service.remove(mission);
		Criteria cri = Criteria.init(req);
		AlertUtil.alert("글이 삭제되었습니다", "/info/missionlist?recomContenttype=" + req.getParameter("recomContenttype"), req, resp); //글쓰기작성 후 1페이지로 이동
	}
	
}
