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

	@Builder.Default
	private List<Attach> attachs = new ArrayList<>();  //동기방식으로가져옴
}
