package controller.reply;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.google.gson.reflect.TypeToken;
import domain.Attach;
import domain.Board;
import domain.Reply;
//import domain.Review;
import lombok.extern.slf4j.Slf4j;
import service.ReplyService;
import util.JsonRespUtil;
import util.ParamUtil;

@WebServlet("/reply/*")
@Slf4j
public class ReplyServlet extends HttpServlet {
    private static final String ID = "/reply/";

    private String getURI(HttpServletRequest req) {
        String uri = req.getRequestURI();
        uri = uri.substring(uri.indexOf(ID) + ID.length());
        return uri;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = getURI(req);
        ReplyService service = new ReplyService();
        Object o = null;
        if (uri.startsWith("list") || uri.equals("*")) { //목록조회
            log.info("{}", uri);
            String tmp = "list/";
            if (uri.contains(tmp)) {
                String[] tmps = uri.split("/");
                // list/1234/1234
                if (tmps.length > 1) {
                    Long bno = Long.valueOf(tmps[1]);
                    Long lastRno = null;
                    if (tmps.length > 2) {
                        lastRno = Long.valueOf(tmps[2]);
                    }
                    o = service.list(bno, lastRno);

                }
            }

        } else { //단일조회
            o = service.findBy(Long.parseLong(uri));

        }
        log.info("{}", o);
        JsonRespUtil.writeJson(resp, o);
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = getURI(req);
        Long rno = Long.valueOf(uri);
        new ReplyService().remove(rno);  //서비스 호출
        JsonRespUtil.writeJson(resp, Map.of("result", true));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Reply reply = JsonRespUtil.readJson(req, Reply.class);

        log.info("Reply: {}", reply);
        //첨부파일 내용 수집
//        String encodedStr = req.getParameter("encodedStr");
//        if (encodedStr == null || encodedStr.trim().isEmpty()) {
//            encodedStr = "[]";
//        }
//        Type type = new TypeToken<List<Attach>>() {}.getType();
//        List<Attach> list = new Gson().fromJson(encodedStr, type);  //이건 json이 수집했기 때문에 빌더쓰는거 아님
//        log.info("{}", list);
//
//
//        if (list == null) {
//            list = new ArrayList<>();
//        }
//        reply.setAttachs(list);

        new ReplyService().register(reply);

        JsonRespUtil.writeJson(resp, Map.of("result", true, "reply", reply));
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Reply reply = JsonRespUtil.readJson(req, Reply.class);
        new ReplyService().modify(reply);
        JsonRespUtil.writeJson(resp, Map.of("result", true));


    }


}
