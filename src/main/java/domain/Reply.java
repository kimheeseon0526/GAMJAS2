package domain;

import java.sql.Date;

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

}
