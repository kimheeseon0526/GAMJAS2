package controller.info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.en.RecommendContentType;
import domain.info.Recommend;
import lombok.extern.slf4j.Slf4j;
import service.AttractionService;
import service.FestivalService;
import service.RestaurantService;
import util.ParamUtil;

@Slf4j
@WebServlet("/info/apipreview")
public class ApiPreview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RecommendContentType recomContenttype = RecommendContentType.valueOf(req.getParameter("recomContenttype").toUpperCase());
		Object api = null;
		if(req.getParameter("recomNo") == null) {
			String pk = req.getParameter("recomPlaceId");
			switch (recomContenttype) {

				case RecommendContentType.ATTRACTION:
					api = new AttractionService().findByPk(pk);
					break;

				case RecommendContentType.RESTAURANT:
					api = new RestaurantService().findByPk(pk);
					break;
//
				case RecommendContentType.FESTIVAL:
					api = new FestivalService().findByPk(pk);
					break;
			}
			req.setAttribute("api", api);
			req.setAttribute("recomPlaceId", pk);
			switch (recomContenttype) {
				case RecommendContentType.ATTRACTION:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/attraction.jsp").forward(req, resp);
					break;

				case RecommendContentType.RESTAURANT:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/restaurant.jsp").forward(req, resp);
					break;

				case RecommendContentType.FESTIVAL:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/festival.jsp").forward(req, resp);
					break;
			}
		}
		else {
			Long recomNo = Long.parseLong(req.getParameter("recomNo"));

				switch (recomContenttype) {

					case RecommendContentType.ATTRACTION:
						api = new AttractionService().findBy(recomNo);
						break;

					case RecommendContentType.RESTAURANT:
						api = new RestaurantService().findBy(recomNo);
						break;

					case RecommendContentType.FESTIVAL:
						api = new FestivalService().findBy(recomNo);
						break;
				}
			Recommend recommend = Recommend.builder().recomNo(recomNo).recomContenttype(recomContenttype).build();
			req.setAttribute("api", api);
			req.setAttribute("recommend", recommend);

			switch (recomContenttype) {
				case RecommendContentType.ATTRACTION:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/attraction.jsp").forward(req, resp);
					break;

				case RecommendContentType.RESTAURANT:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/restaurant.jsp").forward(req, resp);
					break;

				case RecommendContentType.FESTIVAL:
					req.getRequestDispatcher("/WEB-INF/views/info/contenttype_template/festival.jsp").forward(req, resp);
					break;
			}
		}


		//log.info("recomNo :: {} post_sn 또는 content_id:: {} recomContenttype {}", recomNo, pk ,recomContenttype);

		}

	}


