package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachRef;
import domain.AttachRef.AttachRefType;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachMapper;
import mapper.AttachRefMapper;
import mapper.BoardMapper;
import mapper.ReplyMapper;
import util.MybatisUtil;

@Slf4j
public class BoardService {
    public List<Board> list(Criteria cri) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            List<Board> list = mapper.list(cri);
            return list; // 1page 10개씩
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Board findBy(Long bno) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.increseCnt(bno);
            Board board = mapper.selectOne(bno);
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
            Long bno = board.getBno();
            if (bno == null) { // 답글 아님
                mapper.insert(board);
                mapper.updateGrpMyself(board);
            } else { // 답글임
                // 1. 부모글 조회
                Board parent = mapper.selectOne(bno);
                // 내 위치에 작성하기 위한 update

                // 2. maxSeq 취득
                // select
                int maxSeq = mapper.selectMaxSeq(parent);
                board.setSeq(maxSeq + 1); // 수정

                // 3. 해당조건의 게시글들의 seq 밀어내기
                board.setGrp(parent.getGrp()); // 확정
                board.setDepth(parent.getDepth() + 1); // 확정
                mapper.updateSeqIncrease(board); // 수정

                // 4. insert
                mapper.insertChild(board);
            }


            AttachMapper attachMapper = session.getMapper(AttachMapper.class);

//			// 첨부파일 insert(원래)
//			board.getAttachs().forEach(a -> {
//				a.setBno(board.getBno());
//				attachMapper.insert(a);
//			});

            AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);
            board.getAttachs().stream()
                    .peek(attachMapper::insert)  // 지금 attachref 상태
                    .map(a -> AttachRef.builder().ano(a.getAno()).attachreftype(AttachRefType.BOARD).refno(board.getBno()).build())
                    .forEach(attachRefMapper::insert);

//			NotificationSocket.broadcast(board.getBno() + "번 게시글 등록<br>" + board.getTitle());

            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public long getCount(Criteria cri) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            return mapper.getCount(cri); // 1page 10개씩
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void modify(Board board) {
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            mapper.update(board); // 내용 수정

            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);

            Long bno = board.getBno(); // 수정중인 글의 번호

            // 1. 기존 첨부 삭제
            AttachRef ar = AttachRef.builder().refno(bno).attachreftype(AttachRefType.BOARD).build();
            attachRefMapper.list(ar).stream() // 게시글에 연결된 attachref 리스트 불러오기
                    .peek(attachRefMapper::delete)
                    .map(a -> a.getAno())
                    .forEach(attachMapper::delete);  // 불러온 attachref 삭제

            // 2. 새로운 첨부 추가
            board.getAttachs().stream()
                    .peek(attachMapper::insert)  // 새로 저장
                    .map(a -> AttachRef.builder()
                            .ano(a.getAno())
                            .attachreftype(AttachRefType.BOARD)
                            .refno(board.getBno())
                            .build())
                    .forEach(attachRefMapper::insert); // 추가된 attachref 정보 추가

            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void remove(Long bno) {
        SqlSession session = MybatisUtil.getSqlSession(false);
        try {
            BoardMapper mapper = session.getMapper(BoardMapper.class);
            AttachMapper attachMapper = session.getMapper(AttachMapper.class);
            ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
            AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);

            replyMapper.deleteByBno(bno);

            AttachRef ar = AttachRef.builder().refno(bno).attachreftype(AttachRefType.BOARD).build();
            attachRefMapper.list(ar).stream()
                    .peek(attachRefMapper::delete)  // 지금 attachref 상태
                    .map(a -> a.getAno())
                    .forEach(attachMapper::delete);


            mapper.delete(bno);

            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}