package controller.info;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import domain.Attach;
import domain.Board;
import domain.Member;
import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Mission;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.*;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/missionwrite")
public class WriteMission extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MissionService service = new MissionService();
		log.info("{}",req.getParameter("recomContenttype"));
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		Criteria cri = ParamUtil.get(req, Criteria.class);
		if(req.getSession().getAttribute("loginMember") == null) {
			AlertUtil.alert("로그인 후 글 작성하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
			return;
		}


		log.info("{}", recommend);
		if(recommend == null) {
			recommend = Recommend.builder().recomContenttype(RecommendContentType.ATTRACTION).build();
		} else if (recommend.getRecomContenttype() == null) {
			recommend.setRecomContenttype(RecommendContentType.ATTRACTION);
		}

		switch (recommend.getRecomContenttype()) {
			case RecommendContentType.ATTRACTION :  req.setAttribute("attraction", new AttractionService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.RESTAURANT :  req.setAttribute("restaurant", new RestaurantService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.FESTIVAL :  req.setAttribute("festival", new FestivalService().findBy(recommend.getRecomNo())); break;
		}


		PageDto dto = new PageDto(cri, service.getRecomApiCount(cri, recommend.getRecomContenttype()));
		log.info("{}", dto);
		
		req.setAttribute("pageDto", dto);
		req.setAttribute("recommend", recommend);

		req.setAttribute("apirecomlist", service.apiRecomList(cri, recommend.getRecomContenttype()));

        req.setAttribute("cri", cri);
        req.getRequestDispatcher("/WEB-INF/views/info/writemission.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Mission mission = ParamUtil.get(req, Mission.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		log.info("{}", mission);
        //session 내의 member attr 조회 후 null
        if(req.getSession().getAttribute("loginMember") == null) {
            AlertUtil.alert("로그인 후 글 작성하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
            return;
        }	// 로그인 기능 미구현으로 주석처리
        //첨부파일 내용 수집
        String encodedStr =  req.getParameter("encodedStr");
		Type type =  new TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);  //이건 json이 수집했기 때문에 빌더쓰는거 아님
//		log.info("{}", list);

		//board 인스턴스 생성(4개)
		Member member = (Member) req.getSession().getAttribute("loginMember");
		log.info("{}", member);

//		Long createdBy = req.getParameter("createdBy");
		Long recomNo = Long.parseLong(req.getParameter("recomNo"));

		mission.setRecomNo(recomNo);
		mission.setCreatedBy(member.getMemNo());

		log.info("{}", mission);

		//서비스 호출(board 객체가지고)
		new MissionService().write(mission);
		
		log.info("{}", cri);
        //리디렉션(board/list)
        AlertUtil.alert("글이 등록되었습니다", "/info/missionlist?recomContenttype=" + recommend.getRecomContenttype(), req, resp); //글쓰기작성 후 1페이지로 보내겠다
		}
	}
