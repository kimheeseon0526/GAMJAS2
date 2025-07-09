package controller.mypage;

import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import domain.Attach;
import domain.Member;


@WebServlet("/member/mypage")
public class Mypage extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session == null || session.getAttribute("loginMember") == null) {  // signin.java 세션에서 loginMember이름으로 들어가있기때문에 loginMember로 
			resp.sendRedirect(req.getContextPath() + "/member/signin");  // 로그인 안한 사용자는 로그인 화면으로, 로그인한 사용자는 마이페이지로
			return;
		}

			
			
		req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Member member = (Member) req.getSession().getAttribute("loginMember"); // 로그인 회원 가져오기
//		
//		Part filePart = req.getPart("profileImg");  // 파일 꺼내기
//		
//		if(filePart != null && filePart.getSize() > 0) {
//			Attach attach = UploadUtil.save(filePart);   // 업로드 되었을 시 
//			
//			List<Attach> list = new ArrayList<>();  
//			list.add(attach);
//			member.setAttachs(list);  // member에 저장
//			
//			profileImageService.uploadProfile(member);
//		}
//		
//		resp.sendRedirect(req.getContextPath() + "/member/mypage");  // 마이페이지 이동
		doGet(req, resp);
	}
	
}
