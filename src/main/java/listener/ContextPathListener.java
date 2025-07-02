package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import mapper.CategoryMapper;
import util.MybatisUtil;

@WebListener
@Slf4j
public class ContextPathListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc =  sce.getServletContext();
		sc.setAttribute("cp", sc.getContextPath()); 
		log.info("컨텍스트 패스 정의 완료 : {}", sc.getAttribute("cp"));
		
		//카테고리 정보를 application 영역 객체에 보관
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			sc.setAttribute("cate", mapper.list());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
}
