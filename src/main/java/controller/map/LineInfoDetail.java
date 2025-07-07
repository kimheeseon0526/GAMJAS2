package controller.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;

import domain.Station;
import mapper.StationMapper;
import util.MybatisUtil;

@WebServlet("/map/lineinfodetail")
public class LineInfoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//2호선 리스트 가져오기
		try(SqlSession sqlsession = MybatisUtil.getSqlSession()) {
			StationMapper mapper = sqlsession.getMapper(StationMapper.class);
			List<Station> list = mapper.selectByLine("2호선");
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			
			req.setAttribute("stationDetailLsit", json);
			req.getRequestDispatcher("/WEB-INF/views/map/lineinfodetail.jsp").forward(req, resp);			
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

}
