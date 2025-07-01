package listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;

@WebListener
public class ContextPathListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc =  sce.getServletContext();
//		sc.getContextPath(); // /pbl
		sc.setAttribute("cp", sc.getContextPath());
		
		//카테고리 정보를 apllication 영역객체에 보관
//		try(SqlSession session = MybatisUtil.getSqlSession()){
//			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
//			sc.setAttribute("cate", mapper.list());
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
		
	}
	
}
