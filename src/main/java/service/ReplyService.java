package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachRef;
import domain.Reply;
import domain.AttachRef.AttachRefType;
import mapper.AttachMapper;
import mapper.AttachRefMapper;
import mapper.ReplyMapper;
import util.MybatisUtil;

public class ReplyService {
	public Reply findBy(Long rno) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);

			return mapper.selectOne(rno);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Reply> list(long bno, Long lastRno) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper =  session.getMapper(AttachRefMapper.class);

//			List<Reply> list = mapper.list(bno, lastRno);
//
//			for(Reply r : list) {  // r 선언
//				List<AttachRef> refList = attachRefMapper.list("REPLY", r.getRno());
//				List<Attach> attachList = refList.stream().map(ref -> attachMapper.selectOne(ref.getAno())).toList();
//				r.setAttachs(attachList); // 댓글에 첨부파일
//			}
//
//
//
//			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public void register(Reply reply) {
		try (SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			mapper.insert(reply);

			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);

			reply.getAttachs().stream()
					.peek(attachMapper::insert)  // 지금 attachref 상태
					.map(a -> AttachRef.builder().ano(a.getAno()).attachreftype(AttachRefType.REPLY).refno(reply.getRno()).build())
					.forEach(attachRefMapper::insert);

//			List<AttachRef> refList = attachRefMapper.list("REPLY", reply.getRno());
//			List<Attach> attachList = refList.stream()
//					.map(ref -> attachMapper.selectOne(ref.getAno()))
//					.toList();
//			reply.setAttachs(attachList);
////
			session.commit();

		} catch(Exception e) {
			e.printStackTrace();
	}
}

    public void modify(Reply reply) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            ReplyMapper mapper = session.getMapper(ReplyMapper.class);
            mapper.update(reply);

			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);

			Long rno = reply.getRno(); // 수정중인 글의 번호

			// 1. 기존 첨부 삭제
			AttachRef ar = AttachRef.builder().refno(rno).attachreftype(AttachRefType.REPLY).build();
			attachRefMapper.list(ar).stream() // 게시글에 연결된 attachref 리스트 불러오기
					.peek(attachRefMapper::delete)
					.map(a -> a.getAno())
					.forEach(attachMapper::delete);  // 불러온 attachref 삭제

			// 2. 새로운 첨부 추가
			reply.getAttachs().stream()
					.peek(attachMapper::insert)  // 새로 저장
					.map(a -> AttachRef.builder()
							.ano(a.getAno())
							.refno(reply.getRno())
							.attachreftype(AttachRefType.REPLY)
							.build())
					.forEach(attachRefMapper::insert); // 추가된 attachref 정보 추가

			session.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void remove(Long rno) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            ReplyMapper mapper = session.getMapper(ReplyMapper.class);

			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper = session.getMapper(AttachRefMapper.class);

			AttachRef ar = AttachRef.builder().refno(rno).attachreftype(AttachRefType.REPLY).build();
			attachRefMapper.list(ar).stream()
					.peek(attachRefMapper::delete)  // 지금 attachref 상태
					.map(a -> a.getAno())
					.forEach(attachMapper::delete);


			mapper.delete(rno);  //본문 삭제

			session.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
