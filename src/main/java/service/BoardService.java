package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import mapper.AttachMapper;
import mapper.BoardMapper;
import mapper.ReplyMapper;
import util.MybatisUtil;

public class BoardService {
	public List<Board> list(Criteria cri) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			List<Board> list = mapper.list(cri);
			long cnt =  mapper.getCount(cri);
			return list; //1page 10개씩
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Board findBy(Long bno) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			mapper.increseCnt(bno);  // 조회수 증가
			Board board = mapper.selectOne(bno);  //게시글 한개 조회
			board.setAttachs(attachMapper.list(bno));  
			return board;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void write(Board board) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {	
			BoardMapper mapper = session.getMapper(BoardMapper.class);
//			Long bno = board.getBno();  // bno는 부모의 번호
//			if(bno == null) {  // 여기는 답글 아님
				mapper.insert(board);   // 글 작성
//				mapper.updateGrpMyself(board);  // 그룹번호 부여
//			}
//			else { // 여기가 답글
 				// 1. 부모글 조회
//				Board parent =  mapper.selectOne(bno);  // 부모글을 가져오는거
				// 내 위치에 작성하기 위한 update. 나보다 seq값을 더 밀어내야함
				
				// 2. maxSeq 취득
				// select
//				int maxSeq = mapper.selectMaxSeq(parent);
//				board.setSeq(parent.getSeq()+1); // 수정   
//				
//				// 3. 해당조건의 게시글들의 seq 밀어내기
//				board.setGrp(parent.getGrp());  // 확정
//				board.setDepth(parent.getDepth()+1); // 확정 
//				mapper.updateSeqIncease(parent);  // 이제 한번 밀려남.
//				
//				// 4. insert
//				
//				mapper.insertChild(board);
//				
//			}
//			
//				mapper.insert(board);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			board.getAttachs().forEach(a -> {
				a.setBno(board.getBno());
				attachMapper.insert(a);
			});
			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함. 
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}  //try catch -> 롤백해라
	}
	
	
	public long getCount(Criteria cri) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			return mapper.getCount(cri); //1page 10개씩
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public void modify(Board board) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {	
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.update(board);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			board.getAttachs().forEach(a -> {
				a.setBno(board.getBno());
				attachMapper.insert(a);
			});
			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함. 
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}
			
	}
	
	public void remove(Long bno) { 
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {	
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
//			ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
					
//			replyMapper.deleteByBno(bno);
			attachMapper.deleteByBno(bno);
			mapper.delete(bno);
			
			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함. 
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}
			
	
	}
}
