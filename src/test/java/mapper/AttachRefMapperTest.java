package mapper;

import java.util.List;

import org.junit.jupiter.api.Test;

import domain.AttachRef;
import domain.AttachRef.AttachRefType;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class AttachRefMapperTest {
	private AttachRefMapper mapper = MybatisUtil.getSqlSession().getMapper(AttachRefMapper.class);
	

	@Test
	public void testList() {
	    AttachRef ref = AttachRef.builder().refno(200L).attachreftype(AttachRefType.BOARD).build();
		List<AttachRef> list = mapper.list(ref);
		list.forEach(ar -> log.info("{}", ar));
	}
	
//	@Test
	public void testInsert() {
	    AttachRef ref = AttachRef.builder()
	    		.refno(200L)
	    		.attachreftype(AttachRefType.BOARD)
	    		.build();
	    
	    mapper.insert(ref);
//		List<AttachRef> list = mapper.list(ref);
//		list.forEach(ar -> log.info("{}", ar));
	}
	
}
