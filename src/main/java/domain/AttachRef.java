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
	private Long refno; // rno, bno (ex. mno, nno등등으로 쓰이는)
	private AttachRefType attachreftype; // enum으로 어떤 부분이랑 연결될건지
	private Long ano;  // 이게 attachRef PK
	
	// 두개의 컬럼 index
	
	public enum AttachRefType {
		BOARD, REPLY, MISSION, MEMBER, RECOMMENDPLACE
	}
}
