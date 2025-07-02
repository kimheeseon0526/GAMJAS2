package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;


@WebServlet("/member/signin")
public class SigninServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberService service = new MemberService();
		boolean signinMember = service.signin(id, pw);
		
		if(signinMember) {//로그인 성공
			req.getSession().setAttribute("signinMember", signinMember);	//세션 저장
			resp.sendRedirect(req.getContextPath() + "index.jsp");
		}
		else {
			resp.sendRedirect("login fail");
		}
	
	}
	

}
