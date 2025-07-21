package controller.info;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import domain.Attach;
import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Mission;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.*;
import util.AlertUtil;
import util.ParamUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

@Slf4j
@WebServlet("/info/modifymission")
public class ModifyMission extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		Long missionNo = Long.parseLong(req.getParameter("missionNo"));

		if(req.getSession().getAttribute("loginMember") == null) {
			AlertUtil.alert("로그인 후 글을 수정하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
			return;
		}

		if(req.getParameter("missionNo") == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/missionlist", req, resp);
			return;
		}
		MissionService service = new MissionService();
		Mission mission = service.findBy(missionNo);

		log.info("{}", mission);
		switch (recommend.getRecomContenttype()) {
			case RecommendContentType.ATTRACTION :  req.setAttribute("attraction", new AttractionService().findBy(mission.getRecomNo())); break;
			case RecommendContentType.RESTAURANT :  req.setAttribute("restaurant", new RestaurantService().findBy(mission.getRecomNo())); break;
			case RecommendContentType.FESTIVAL :  req.setAttribute("festival", new FestivalService().findBy(mission.getRecomNo())); break;
		}



		PageDto dto = new PageDto(cri, service.getRecomApiCount(cri, recommend.getRecomContenttype()));
		req.setAttribute("cri", cri);
//		req.setAttribute("api", service.apiRecomList(cri, recommend.getRecomContenttype()));
		req.setAttribute("mission", mission);
		req.setAttribute("recommend", recommend);
		req.setAttribute("pageDto", dto);
		req.getRequestDispatcher("/WEB-INF/views/info/modifymission.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);

		Mission mission = ParamUtil.get(req, Mission.class);

		log.info("{}", mission);
        //session 내의 member attr 조회 후 null
		if(req.getSession().getAttribute("loginMember") == null) {
			AlertUtil.alert("로그인 후 글을 수정하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
			return;
		}
        // 파라미터 수집
        String encodedStr =  req.getParameter("encodedStr");

		Type type =  new TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);
        //board 인스턴스 생성(4개)


        //서비스 호출(board 객체가지고)
        new MissionService().modify(mission);

//        //리디렉션(board/list)
        AlertUtil.alert("글이 수정되었습니다", "/info/missionview?missionNo=" + mission.getMissionNo(), req, resp);
        //글쓰기작성 후 1페이지로 이동
		
	}
	
	
}
