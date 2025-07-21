package util;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

@Slf4j
public class HikariCPutilTest {
//    private final HikariCPutil hikariCPutil = new HikariCPutil();

    @Test
    public void testHikariCPutil() {
        log.info("{}", HikariCPutil.getDataSource());
    }

    @Test
    public void testHikariCPutil2() {
        Properties properties = PropsLoaderUtil.getProperties("classpath:db.properties");
        log.info("{}", properties);
    }

    @Test
    public void testClasspathLocation() {
        // 1. 리소스 경로 출력
        String resourcePath = "mybatis-config.xml";

        // 클래스패스에서 리소스 찾기
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        URL resourceUrl = classLoader.getResource(resourcePath);

        System.out.println("리소스 경로: " + resourcePath);
        System.out.println("클래스패스에서 읽은 URL: " + resourceUrl);

        // 2. 실제로 읽어지는지 확인
        try (InputStream in = classLoader.getResourceAsStream(resourcePath)) {
            if (in != null) {
                System.out.println("✅ 리소스 정상적으로 읽힘");
            } else {
                System.out.println("❌ 리소스 못 읽음 (classpath 경로 문제일 수 있음)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
