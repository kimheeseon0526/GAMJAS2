package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;


@WebServlet("/member/signup")
public class SignupServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터 수집
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String nation = req.getParameter("nation");
		String terms1 = req.getParameter("terms1");
		String terms2 = req.getParameter("terms2");
		
		if(terms1 == null || terms2 == null) {
			req.setAttribute("msg", "필수 약관에 동의해야 가입이 가능합니다");
			req.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(req, resp);
			return;
		}

		
		Member member = Member.builder().id(id).pw(pw).name(name).email(email).nation(nation).build();
		
		new MemberService().signup(member);
		
		resp.sendRedirect("../index");

	}
	
	

}
