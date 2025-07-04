package controller.reply;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Reply;
//import domain.Review;
import lombok.extern.slf4j.Slf4j;
import service.ReplyService;
import util.JsonRespUtil;

@WebServlet("/reply/*")
@Slf4j
public class ReplyServlet extends HttpServlet{
	private static final String ID = "/reply/";
	
	private String getURI(HttpServletRequest req) {
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf(ID) + ID.length());
		return uri;
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("health check");
//		// uri
//		// /review/list
//		System.out.println(req.getContextPath());
//		System.out.println(req.getRequestURI());
//      //review_api/review/list/asdf
		
		String uri = getURI(req);
		ReplyService service = new ReplyService();
		Object o = null;
		if(uri.startsWith("list") || uri.equals("*")) { //목록조회
			log.info("{}", uri);
			String tmp = "list/";
			if(uri.contains(tmp)) {
				String[] tmps = uri.split("/");
				// list/1234/1234
				if(tmps.length > 1) {
					Long bno = Long.valueOf(tmps[1]);
					Long lastRno = null;
					if(tmps.length > 2) {
						lastRno = Long.valueOf(tmps[2]);
					}
					o = service.list(bno, lastRno);
					
				}
			}
			// uri를 판단해야함
//			ret = gson.toJson(service.list());
			
		}
		else { //단일조회
			o = service.findBy(Long.parseLong(uri));
			
		}
		JsonRespUtil.writeJson(resp, o);
		// json
		
		// /review/1
	}    


	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = getURI(req);
		Long rno = Long.valueOf(uri);
		
		
		new ReplyService().remove(rno);  //서비스 호출
		
		JsonRespUtil.writeJson(resp, Map.of("result", true));
		
//		resp.setContentType("application/json; charset=utf-8");
//		resp.getWriter().print(new Gson().toJson(Map.of("result", "true")));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		
//		String ret = String.join("", req.getReader().lines().toList());
//		
		Reply reply= JsonRespUtil.readJson(req, Reply.class);
		new ReplyService().register(reply);
		JsonRespUtil.writeJson(resp, Map.of("result", true, "reply", reply));
		
//		resp.setContentType("application/json; charset=utf-8");
//		resp.getWriter().print(new Gson().toJson(Map.of("result", true)));
		
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String uri = getURI(req);
//		Long rno = Long.valueOf(uri);
//		
//		String ret = String.join("", req.getReader().lines().toList());
		Reply reply = JsonRespUtil.readJson(req, Reply.class);
		
		// 이 시점에서는 rno > null
		new ReplyService().modify(reply);
		// 이 시점에서는 rno > not null

		JsonRespUtil.writeJson(resp, Map.of("result", true));
//		resp.setContentType("application/json; charset=utf-8");
//		resp.getWriter().print(new Gson().toJson(Map.of("result", true, "reply", reply)));  
		/// "reply", reply 이거 추가한게 key value가 되고, 또하나의 Key value가 됨
	
	}
	
	
}
