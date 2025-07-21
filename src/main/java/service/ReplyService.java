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

			List<Reply> list = mapper.list(bno, lastRno);
			// 댓글 목록 가져오는 매서드. bno, 마지막 댓글번호 가져와서 댓글 목록 조회.(select문 실행해서 결과를 List<Reply>로 가져오는)

			// 댓글이 여러개 있음 -> 댓글마다 첨부파일 있을 수도(따로 조회해야함) -> for문으로 댓들들 반복처리필요
			// 그 부분만 stream 써서 attachref를 attach로 변환해서 사용
			for(Reply r : list) {
				List<AttachRef> refList = attachRefMapper.list(AttachRefType.REPLY, r.getRno());
				List<Attach> attachList = refList.stream()
						.map(ref -> attachMapper.selectOne(String.valueOf(ref.getAno())))
						.toList();
				r.setAttachs(attachList);  // 이부분을 해줘야 똑같은 파일이 들어가지 않음
			}
			return list;

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
