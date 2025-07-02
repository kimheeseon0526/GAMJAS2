package mapper;

import domain.Member;

public interface MemberMapper {

	int insert(Member member);

	Member findById(String id);
	
//	int delete(Long memNo);
//	
//	int update(Member member);

}
