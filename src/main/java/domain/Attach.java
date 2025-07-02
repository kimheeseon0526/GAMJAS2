package domain;


import java.io.File;

import org.apache.ibatis.type.Alias;

//import controller.attach.UploadFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("attach")
public class Attach {
	
	private String uuid; //파일명
	private String path; //날짜에 대한 경로
	private boolean isImage; //파일 존재 여부
	private String origin; //파일 원본
	private int odr;  //integer 은 기본값이 0
	private long size;  //null이 올 필요가 없는 애들
//	private Long bno;
//	private Long rno;  --> attachRef에서 Long ref로 처리

}
