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
//			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
//			AttachRefMapper attachRefMapper =  session.getMapper(AttachRefMapper.class);
//			
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
                    .peek(attachMapper::insert)
                    .map(a -> AttachRef.builder().ano(a.getAno())
                            .attachreftype(AttachRefType.REPLY)
                            .refno(reply.getRno())
                            .build())
                    .forEach(attachRefMapper::insert);

            session.commit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void modify(Reply reply) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            ReplyMapper mapper = session.getMapper(ReplyMapper.class);
            mapper.update(reply);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void remove(Long rno) {
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            ReplyMapper mapper = session.getMapper(ReplyMapper.class);
            mapper.delete(rno);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
