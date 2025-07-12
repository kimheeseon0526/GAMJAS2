package controller.info;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
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
import service.BoardService;
import service.RecommendService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/write")
public class WriteRecommend extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RecommendService recommendService = new RecommendService();
		log.info("{}",req.getParameter("recomContenttype"));
		log.info("{}",req.getParameter("recomNo"));
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
		
		PageDto dto = new PageDto(cri, recommendService.getApiCount(cri, recommend.getRecomContenttype()));
		log.info("{}", dto);
		
		req.setAttribute("pageDto", dto);
		req.setAttribute("recommend", recommend);
		log.info("{}", recommendService.apiList(cri, recommend.getRecomContenttype()));
		req.setAttribute("apilist", recommendService.apiList(cri, recommend.getRecomContenttype()));
        req.setAttribute("cri", cri);
        req.getRequestDispatcher("/WEB-INF/views/info/writerecommend.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);  
		System.out.println("📦 recomContenttype 파라미터 = " + req.getParameter("recomContenttype"));

        //session 내의 member attr 조회 후 null
        if(req.getSession().getAttribute("loginMember") == null) {
            AlertUtil.alert("로그인 후 글 작성하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
            return;
        }
		Member member = (Member) req.getSession().getAttribute("loginMember");
		log.info("{}", member);
		recommend.setMemNo(member.getMemNo());
		
		log.info("{}", recommend);

		//서비스 호출(board 객체가지고)
		new RecommendService().write(recommend);
		
		log.info("{}", cri);
        //리디렉션(board/list)
        AlertUtil.alert("글이 등록되었습니다", "/info/recommendlist?recomContenttype=" + recommend.getRecomContenttype(), req, resp); //글쓰기작성 후 1페이지로 보내겠다
		}
	}
