package domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("member")
public class Member {
	
	private Long memNo;	//회원 번호
	private String id;
	private String pw;
	private String name;
	private String email;
	private String nation;
	private String regdate;
	private Boolean isAdmin;	//관리자 여부
	private int presentTicket;	//현재 티켓수
	private boolean isVerified; //메일 인증 여부 default : false
	private String authToken;	//인증용 토큰
	
	@Builder.Default
	private List<Attach> attachs = new ArrayList<>();  //동기방식으로가져옴

	
}
