package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;

import lombok.extern.slf4j.Slf4j;
import service.MissionService;

@WebServlet("/info/missionlist")
@Slf4j
public class MissionList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		MissionService missionService = new MissionService();
//		Criteria cri = Criteria.init(req);
//		log.info("{}", cri);
//		
		req.getRequestDispatcher("/WEB-INF/views/info/missionlist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	
}
