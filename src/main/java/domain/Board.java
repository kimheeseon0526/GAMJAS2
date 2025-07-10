package domain;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import domain.en.CategoryViewType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("board")
public class Board {

	private Long bno;
	private String title;
	private String content;
	private String id;
	private String regdate; // 작성일
	private String moddate; // 수정일
	private Integer cnt; // 조회수 넘버
	private Integer cno; // 카테고리 넘버
	private int replyCnt; // 댓글 갯수 넘버
	private int attachCnt; // 첨부 파일 수
	private int isSecret;  // 공개여부


//	   답글을 위한 3개의 필드 
		private Long grp;  
		
		@Builder.Default
		private int seq = 1; 
		@Builder.Default
		private int depth = 1;
		
//     categoryViewType 자유, 후기, 공지, qna 가져오기 위한
		private CategoryViewType cViewType;
		
		public CategoryViewType getCViewType() {
		    return this.cViewType;
		}
		
	public Board(Long bno, String title, String content, String id, String regdate, String moddate, Integer cnt,
				Integer cno, int replyCnt, int attachCnt, CategoryViewType cViewType) {
			super();
			this.bno = bno;
			this.title = title;
			this.content = content;
			this.id = id;
			this.regdate = regdate;
			this.moddate = moddate;
			this.cnt = cnt;
			this.cno = cno;
			this.replyCnt = replyCnt;
			this.attachCnt = attachCnt;
			this.cViewType = cViewType;
		}





	@Builder.Default
	private List<Attach> attachs = new ArrayList<>();  //동기방식으로가져옴

}
