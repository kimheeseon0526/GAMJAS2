package domain;


import java.io.File;

import org.apache.ibatis.type.Alias;

import controller.attach.UploadFile;
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
	private boolean image; //파일 존재 여부
	private String origin; //파일 원본
	private int odr;  //integer 은 기본값이 0
	private long size;  //null이 올 필요가 없는 애들
	private Long ano;
	
	public Attach(String uuid, String path, boolean image, String origin, int odr, long size) {
		super();
		this.uuid = uuid;
		this.path = path;
		this.image = image;
		this.origin = origin;
		this.odr = odr;
		this.size = size;
	}
	
	public File toFile() {  // 물리적 경로에 있는 파일명이 중요
		return new File(UploadFile.UPLOAD_PATH + "/" + path, uuid);
	}

	public Attach toThumb() { // 새 객체를 만들어서 리턴
		return Attach.builder().image(image).uuid("t_" + uuid).origin(origin).odr(odr). size(size).build();
	}

}
