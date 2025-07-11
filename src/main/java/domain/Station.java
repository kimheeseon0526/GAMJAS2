package domain;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Station {
	
	@SerializedName("BLDN_ID")
	private String id;
	@SerializedName("BLDN_NM")
	private String name;
	@SerializedName("ROUTE")
	private String lineName;
	@SerializedName("LAT")
	private double lat;
	@SerializedName("LOT")
	private double lng;
	private String lineColor;
	private String BranchGroup; //분기 여부

	
	private boolean isTransfer;	//환승역 여부
	private Integer odr;
	private String createdAt;	//등록일
	private String updatedAt;	//수정일
	private String markerIcon;	//마커 아이콘(사용 여부 확인)
	private String lineId;
	
	
	public Station(String id, double lat, double lng) {
		super();
		this.id = id;
		this.lat = lat;
		this.lng = lng;
	}


	public Station(String lineName, String name, String id, double lat, double lng) {
		this.lineName = lineName;
		this.name = name;
		this.id = id;
		this.lat = lat;
		this.lng = lng;
	}
	
	public Station(String name, String id, double lat, double lng) {
		this.name = name;
		this.id = id;
		this.lat = lat;
		this.lng = lng;
	}


	
	
}
