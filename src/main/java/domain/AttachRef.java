package domain;

public class AttachRef {
	String uuid; // FK (첨부파일 고유 식별자. attach테이블 pk랑 연결되는 fk임)
	Long ref; // rno, bno (ex. mno, nno등등으로 쓰이는)
	AttachRefType attachRefType; // enum으로 어떤 부분이랑 연결될건지
	
	// 두개의 컬럼 index
	
	enum AttachRefType {
		BOARD, REPLY, MISSION, MEMBER, RECOMMENDPLACE
	}
}
