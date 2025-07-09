package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.AttachRef;
import domain.Reply;
import domain.AttachRef.AttachRefType;
import mapper.AttachMapper;
import mapper.AttachRefMapper;
import mapper.ReplyMapper;
import util.MybatisUtil;

public class ReplyService {
	public Reply findBy(Long rno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			return mapper.selectOne(rno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Reply> list(long bno, Long lastRno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			return mapper.list(bno, lastRno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void register(Reply reply) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			mapper.insert(reply);
			
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper =  session.getMapper(AttachRefMapper.class);
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
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			mapper.update(reply);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void remove(Long rno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			mapper.delete(rno);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
