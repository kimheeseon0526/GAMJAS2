package service;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import util.MybatisUtil;
import util.PasswordEncoder;
@Slf4j
public class MemberService {
	
	//회원가입
	public int signup(Member member) {
		try (SqlSession session = MybatisUtil.getSqlSession()){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			log.info("{}", member.getPw());
			member.setPw(PasswordEncoder.encode(member.getPw()));
			return mapper.insert(member);
		} catch (Exception e) {
			e.printStackTrace();
			}
		return 0;
	}
	
	//본인 확인
	public Member findById(String id) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
			}
		return null;
	}
	
	//로그인
	public Member signin(String id, String pw) {
		Member member = findById(id);
			if(member != null && PasswordEncoder.matches(pw, member.getPw())) {
				return member;
			}
		return null;
	
		}
	}

