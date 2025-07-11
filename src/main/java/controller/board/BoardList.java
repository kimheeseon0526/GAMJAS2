package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@WebServlet("/board/list")
@Slf4j
public class BoardList extends HttpServlet {  // 전체 목록 조회

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService service = new BoardService();

        Criteria cri = Criteria.init(req);  //클래스 매서드로 정의하겠다
        log.info("{}", cri);

        req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
        req.setAttribute("boards", service.list(cri));
        req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
    }


}
