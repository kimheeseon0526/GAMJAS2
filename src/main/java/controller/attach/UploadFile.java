package controller.attach;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import domain.Attach;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import util.S3Util;

@WebServlet("/upload")
@MultipartConfig(location = "d:/upload/tmp",
        maxRequestSize = 50 * 1024 * 1024,  // 한번의 요청당 최대 파일 크기
        maxFileSize = 10 * 1024 * 1024, //파일 하나당 최대 크기
        fileSizeThreshold = 10 * 1024 * 1024) // 이 크기를 넘어가면 location위치에 buffer를 기록
@Slf4j
public class UploadFile extends HttpServlet {
    public static final String UPLOAD_PATH = "d:/upload/files";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/uploadForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //업로드된 파일 처리
        Collection<Part> parts = req.getParts();

        List<Attach> attachs = new ArrayList<>();

        int odr = 0;
        for (Part part : parts) {
            if (part.getSize() == 0) {
                continue;  // part의 size가 0 일때 계속해라
            }
            Long fileSize = part.getSize();
            String origin = part.getSubmittedFileName();
            String contentType = part.getHeader("content-type");

            // ext 추출
            int idx = origin.lastIndexOf("."); // 못찾으면 -1로 나옴
            String ext = "";
            if (idx >= 0) {
                //확장자가 존재하는 경우
                ext = origin.substring(idx);
            }

            UUID uuid = UUID.randomUUID();
            String fileName = uuid + ext;

            boolean image = contentType.startsWith("image");
            String path = genPath();
            String realPath = UPLOAD_PATH + "/" + path + "/"; // 루트 디렉토리부터 다 결합하는거
            File file = new File(realPath);
            if (!file.exists()) {
                file.mkdirs();
            }
//			new File(realPath).mkdirs();  
            part.write(realPath + fileName);  //원본을 저장시켜라
            if (image) {
                try {
                    File thumb = new File(realPath + "t_" + fileName);
                    Thumbnails.of(new File(realPath + fileName)).size(150, 150).toFile(realPath + "t_" + fileName);
                    S3Util.upload(thumb, "upload/" + path + "/t_" + fileName);
                } catch (Exception e) {
                    image = false;
                }
            }
            log.info("{} :: {} :: {} :: {}", fileSize, origin, contentType, ext);

            attachs.add(Attach.builder()
                    .uuid(fileName)
                    .origin(origin)
                    .image(image)
                    .path(path)
                    .odr(odr++)   // 증감연산자
                    .size(fileSize)   // 증감연산자
                    .build());
        }

        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().print(new Gson().toJson(attachs));

    }

    private String genPath() {
        return new SimpleDateFormat("yyyy/MM/dd").format(new Date().getTime());
    }


}
