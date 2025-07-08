package service;

import java.util.List;

import org.junit.jupiter.api.Test;

import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.BoardMapper;
import util.MybatisUtil;

@Slf4j
public class BoardServiceTest {

//	private BoardMapper boardMapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
//	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria(1, 10, 1); // 1페이지, 10개, 1번카테고리
//		List<Board> list = boardMapper.list(cri);
//		list.forEach(b -> log.info("{}", b.getTitle()));
//	}
	
	BoardService boardService = new BoardService();

	@Test
	public void testListService() {
	    Criteria cri = new Criteria(1, 10, 4, null, null);
	    List<Board> list = boardService.list(cri); 
	    list.forEach(b -> log.info("{}", b.getTitle()));
	    
	    list.forEach(b -> log.info("bno={}, cViewType={}", b.getBno(), b.getCViewType()));
	}

}
