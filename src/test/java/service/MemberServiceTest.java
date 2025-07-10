package service;

import org.junit.jupiter.api.Test;

import domain.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberServiceTest {

	@Test
	public void testlogin() {
		MemberService service = new MemberService();
		Member admin = service.signin("q", "q");
		
		log.info("관리자 확인: {}" , admin.getIsAdmin());
	}
}
