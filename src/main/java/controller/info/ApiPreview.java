package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.en.RecommendContentType;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.AttractionService;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/apipreview")
public class ApiPreview extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long recomNo = Long.parseLong(req.getParameter("recomNo")) ;
		RecommendContentType recomContenttype = RecommendContentType.valueOf(req.getParameter("recomContenttype").toUpperCase()); 
		log.info("{} {}", recomNo, recomContenttype);
		
		Recommend recommend = Recommend.builder().recomNo(recomNo).recomContenttype(recomContenttype).build();
		 
		
		Object api = null;
		
		switch(recomContenttype) {
			
			case RecommendContentType.ATTRACTION : api = new AttractionService().findBy(recomNo);  break;
			
			case RecommendContentType.RESTAURANT : api = new AttractionService().findBy(recomNo);  break;
			
			case RecommendContentType.FESTIVAL : api = new AttractionService().findBy(recomNo);  break;
		}
	
		req.setAttribute("api", api);
		req.setAttribute("recommend", recommend);
		
		req.getRequestDispatcher("/WEB-INF/views/info/writemission.jsp").forward(req, resp);
	}
	
}
