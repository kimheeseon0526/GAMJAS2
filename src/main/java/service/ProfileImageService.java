package service;

import org.apache.ibatis.session.SqlSession;

import domain.AttachRef;
import domain.AttachRef.AttachRefType;
import domain.Member;
import mapper.AttachMapper;
import mapper.AttachRefMapper;
import mapper.BoardMapper;
import mapper.MemberMapper;
import software.amazon.awssdk.services.cloudformation.model.AttributeChangeType;
import util.MybatisUtil;

public class ProfileImageService {
	
	public void uploadProfile(Member member) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			Long memNO = member.getMemNo();
			
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			AttachRefMapper attachRefMapper =  session.getMapper(AttachRefMapper.class);
	
			
			// 1. 기존 첨부 삭제 
			AttachRef ar = AttachRef.builder().refno(memNO).attachreftype(AttachRefType.MEMBER).build();
			attachRefMapper.list(ar).stream() // 게시글에 연결된 attachref 리스트 불러오기
			.peek(attachRefMapper::delete)
			.map(a -> a.getAno())
			.forEach(attachMapper::delete);  // 불러온 attachref 삭제
			
			// 2. 새로운 첨부 추가
			member.getAttachs().stream()
			.peek(attachMapper::insert)
			.map(a -> AttachRef.builder()
					.ano(a.getAno())
					.attachreftype(AttachRefType.MEMBER)
					.refno(member.getMemNo())
					.build())
			.forEach(attachRefMapper::insert);    // 추가된 attachref 정보 추가
		

			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
