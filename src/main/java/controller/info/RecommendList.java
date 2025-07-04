package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import lombok.extern.slf4j.Slf4j;
import service.MissionService;
import service.RecommendService;

@WebServlet("/info/recommendlist")
@Slf4j
public class RecommendList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RecommendService recommendService = new RecommendService();
//		RecommendContentType contentType = 
//		Criteria cri = new Criteria(1, 10,  , getServletInfo())
		req.getRequestDispatcher("/WEB-INF/views/info/recommendlist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	
}
