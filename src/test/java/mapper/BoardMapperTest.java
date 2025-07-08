package mapper;

import org.junit.jupiter.api.Test;

import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class BoardMapperTest {
	private BoardMapper mapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
	
	@Test
	public void testList() {
		mapper.list(new Criteria(1, 10, 2, null, null)).forEach(b -> {
			log.info("{}", b);
//			log.info("{}" , b.getCViewType());
//			log.info("{}" , b.getTitle());
//			log.info("{}" , b.getBno());
			
		});
	}
}
