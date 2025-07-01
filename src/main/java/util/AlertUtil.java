package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlertUtil {
	public static void alert(String msg, String url, HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//		resp.setContentType("text/html; charset=utf-8");
//		PrintWriter pw = resp.getWriter();
		req.setAttribute("msg", msg);
		req.setAttribute("url", req.getContextPath() + url);
		req.getRequestDispatcher("/WEB-INF/views/common/alert.jsp").forward(req, resp);
//		pw.print("<script>");
//		pw.print("alert('로그인 후 글 작성해주세요.'); ");
//		pw.print(String.format("location.href = '%s%s%s'", req.getContextPath(), "/member/login?url=", URLEncoder.encode(req.getRequestURL().toString(), "utf-8")));
//		pw.print("</script>");
	}
	public static void alert(String msg, String url, HttpServletRequest req, HttpServletResponse resp, boolean isUrl) throws IOException, ServletException {
		if(isUrl) {
			url = url + "&url=" + URLEncoder.encode(req.getRequestURL().toString(), "utf-8");
		}
		log.info("{}", url);
		alert(msg, url, req, resp);
//		req.setAttribute("msg", msg);
//		req.setAttribute("url", url, req, resp);
//		req.getRequestDispatcher("/WEB-INF/views/common/alert.jsp").forward(req, resp);
	}
	
}
