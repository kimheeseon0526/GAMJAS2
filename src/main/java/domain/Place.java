package domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Place {
	//private String stationId;	//고유 역 id
	private String stationName;	//역이름
	private String title;	//제목
	private double lat;
	private double lng;
	private String type;	//카데고리
	private String addr;	//주소
	private double dist;	//거리

}
