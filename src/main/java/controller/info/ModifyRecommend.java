package controller.info;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import domain.Attach;
import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.AttractionService;
import service.FestivalService;
import service.RecommendService;
import service.RestaurantService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/modify")
public class ModifyRecommend extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);
		Long recomNo = recommend.getRecomNo();
		log.info("{}", recomNo);
		if(req.getParameter("recomNo") == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/recommendlist", req, resp);
			return;
		}
		
		RecommendService service = new RecommendService();
		recommend = service.findBy(recomNo);
		log.info("{}", recommend);
		
		switch (recommend.getRecomContenttype()) {
			case RecommendContentType.ATTRACTION :  req.setAttribute("attraction", new AttractionService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.RESTAURANT :  req.setAttribute("restaurant", new RestaurantService().findBy(recommend.getRecomNo())); break;
			case RecommendContentType.FESTIVAL :  req.setAttribute("festival", new FestivalService().findBy(recommend.getRecomNo())); break;
		}
		
		

//		if(req.getSession().getAttribute("member") == null) {
//			AlertUtil.alert("로그인 후 글 작성하세요", "/member/signin?recomNo=" + recomNo + "&" + cri.getQs2(), req, resp, true);
//			return;
//		}
		
		
		PageDto dto = new PageDto(cri, service.getApiCount(cri, recommend.getRecomContenttype()));
		req.setAttribute("cri", cri);
		req.setAttribute("api", service.apiList(cri, recommend.getRecomContenttype()));
		req.setAttribute("recommend", recommend);
		req.setAttribute("pageDto", dto);
		req.getRequestDispatcher("/WEB-INF/views/info/modifyrecommend.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamUtil.get(req, Criteria.class);
		Recommend recommend = ParamUtil.get(req, Recommend.class);
        //session 내의 member attr 조회 후 null
//        if(req.getSession().getAttribute("member") == null) {
//            AlertUtil.alert("로그인 후 글 작성하세요", "/member/signin?" + cri.getQs2(), req, resp, true);
//            return;
//        }
        // 파라미터 수집
        String encodedStr =  req.getParameter("encodedStr");
        
		Type type =  new TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);
        //board 인스턴스 생성(4개)
		 
		log.info("{}", recommend);

        //서비스 호출(board 객체가지고)
        new RecommendService().modify(recommend);

//        //리디렉션(board/list)
        AlertUtil.alert("글이 수정되었습니다", "/info/view?recomNo=" + recommend.getRecomNo(), req, resp);
        //글쓰기작성 후 1페이지로 이동
		
	}
	
	
}
