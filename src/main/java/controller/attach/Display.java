package controller.attach;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@WebServlet("/display")
@Slf4j
public class Display extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 쿼리스트일 해석으로 Attach 객체 생성
        // uuid, origin, path
        String uuid = req.getParameter("uuid");
        String path = req.getParameter("path");

        log.info("{}, {}", uuid, path);

        // 물리적 위치에 있는 실제 파일을 origin의 네임으로 치환 후 다운로드

        File file = new File(UploadFile.UPLOAD_PATH + "/" + path, uuid);
        if (!file.exists()) {  //만약 파일이 존재하지 않으면 리턴해라 뭐를? resp저걸
            resp.setContentType("text/html; charset=utf-8");
            resp.getWriter().println("<h3>파일이 존재하지 않습니다</h3>");
            return;
        }
        // 응답 헤더 설정
        resp.setContentType(Files.probeContentType(file.toPath()));
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());

        bos.write(bis.readAllBytes());

        bis.close();
        bos.close();  //다운로드 코드 끝. close로 꼭 닫아줘야함...신기함..
    }


}
