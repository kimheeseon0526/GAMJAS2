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
import domain.dto.Criteria;
import domain.info.Mission;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import service.RecommendService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/writerecommend")
public class WriteRecommend extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = Criteria.init(req);
        //session 내의 member attr 조회 후 null
//        if(req.getSession().getAttribute("member") == null) {
//            AlertUtil.alert("로그인 후 글 작성하세요", "/member/login?" + cri.getQs2(), req, resp, true);
//            return;
//        }  // 로그인 기능 미구현으로 주석처리

        req.setAttribute("cri", cri);
        req.getRequestDispatcher("/WEB-INF/views/info/writerecommend.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = Criteria.init(req);
        //session 내의 member attr 조회 후 null
//        if(req.getSession().getAttribute("member") == null) {
//            AlertUtil.alert("로그인 후 글 작성하세요", "/member/login?" + cri.getQs2(), req, resp, true);
//            return;
//        }	// 로그인 기능 미구현으로 주석처리
        //첨부파일 내용 수집
//        String encodedStr =  req.getParameter("encodedStr");
//		Type type =  new TypeToken<List<Attach>>() {}.getType();
//		List<Attach> list = new Gson().fromJson(encodedStr, type);  //이건 json이 수집했기 때문에 빌더쓰는거 아님
//		log.info("{}", list);
		Recommend recommend = ParamUtil.get(req, Recommend.class);  
//		if(list != null) {
//			board.setAttachs(list);
//		}
		//board 인스턴스 생성(4개)
		
		log.info("{}", recommend);

		//서비스 호출(board 객체가지고)
		new RecommendService().write(recommend);
		
		log.info("{}", cri);
        //리디렉션(board/list)
        AlertUtil.alert("글이 등록되었습니다", "/info/recommendlist?cno=" + cri.getCno() + "&amount=" + cri.getAmount(), req, resp); //글쓰기작성 후 1페이지로 보내겠다
		}
	}
