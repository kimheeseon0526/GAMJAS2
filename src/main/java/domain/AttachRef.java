package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttachRef {
	private String uuid; // FK (첨부파일 고유 식별자. attach테이블 pk랑 연결되는 fk임)
	private Long refNo; // rno, bno (ex. mno, nno등등으로 쓰이는)
	private AttachRefType refType; // enum으로 어떤 부분이랑 연결될건지
	private Long ano;  // 이게 attachRef PK
	
	// 두개의 컬럼 index
	
	public enum AttachRefType {
		BOARD, REPLY, MISSION, MEMBER, RECOMMENDPLACE
	}
}
