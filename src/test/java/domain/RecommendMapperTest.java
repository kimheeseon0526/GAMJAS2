package domain;

import org.junit.jupiter.api.Test;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import lombok.extern.slf4j.Slf4j;
import mapper.RecommendMapper;
import util.MybatisUtil;

@Slf4j
public class RecommendMapperTest {
	
	private RecommendMapper mapper = MybatisUtil.getSqlSession().getMapper(RecommendMapper.class);
	@Test
	public void listTest(){
		
		mapper.list(new Criteria(1, 5, "TCI", "축제"), RecommendContentType.FESTIVAL).forEach(a -> log.info("{}", a));
		
	}
}
