package listener;

import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.session.SqlSession;

import mapper.CategoryMapper;
import util.MybatisUtil;
import util.PropsLoaderUtil;

@WebListener
public class S3UtilListener implements ServletContextListener {

		@Override
		public void contextInitialized(ServletContextEvent sce) {
			ServletContext sc =  sce.getServletContext();
			Properties props = PropsLoaderUtil.getProperties("secret/aws_s3.properties");
			String s3url = String.format("https://%s.s3.%s.amazonaws.com/upload/", props.get("bucket-name"), props.get("region-name"));
			sc.setAttribute("s3url", s3url);
		
		}
		//톰캣이 구동하기 직전에 딱 한번 수행함.
		
}
