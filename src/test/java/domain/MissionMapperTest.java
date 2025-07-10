package domain;

import org.junit.jupiter.api.Test;

import domain.info.Mission;
import service.MissionService;
import util.MybatisUtil;

public class MissionMapperTest {
	MissionService missionService = MybatisUtil.getSqlSession().getMapper(MissionService.class);
	
//	@Test
	public void writeTest() {
		
		missionService.write(null);
	}
}
