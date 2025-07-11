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

@WebServlet("/winner/list")
@Slf4j
public class WinnerList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService service = new BoardService();
        Criteria cri = new Criteria();
        cri.setCno(3);  //공지사항 cno번호

        req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
        req.setAttribute("boards", service.list(cri));
        req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
    }

}
