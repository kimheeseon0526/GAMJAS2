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
@Alias("reply")
public class Reply {
	
	private String content;
	private String id;
	private int seq;
	private int depth;
	private Long rno;
	private Long bno;
	private Long grp;

	
	@Builder.Default
	private List<Attach> attachs = new ArrayList<>();  //동기방식으로가져옴

}


