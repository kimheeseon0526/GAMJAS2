package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.AlertUtil;

@Slf4j
@WebServlet("/board/write")
public class Write extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = Criteria.init(req);
        //session 내의 member attr 조회 후 null
        if(req.getSession().getAttribute("member") == null) {
            AlertUtil.alert("로그인 후 글 작성하세요", "/member/login?" + cri.getQs2(), req, resp, true);
            return;
        }

        req.setAttribute("cri", cri);
        req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = Criteria.init(req);
        //session 내의 member attr 조회 후 null
        if(req.getSession().getAttribute("member") == null) {
            AlertUtil.alert("로그인 후 글 작성하세요", "/member/login?" + cri.getQs2(), req, resp, true);
            return;
        }	
	}
}
