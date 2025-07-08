package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import service.BoardService;
import service.RecommendService;
import util.AlertUtil;
import util.ParamUtil;

@WebServlet("/info/remove")
public class RemoveRecommend extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RecommendService service = new RecommendService();
		Recommend recommend = service.findBy(Long.parseLong(req.getParameter("recomNo")));
		if(recommend.getRecomNo() == null) {
			AlertUtil.alert("잘못된 접근입니다", "/info/recommendlist", req, resp);
			return;
		}
		
		RecommendContentType rct = recommend.getRecomContenttype();
		
		service.remove(recommend);
		Criteria cri = Criteria.init(req);
		AlertUtil.alert("글이 삭제되었습니다", "/info/recommendlist?=" + cri.getQsRecom2(rct), req, resp); //글쓰기작성 후 1페이지로 이동
	}
	
}
