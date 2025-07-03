package domain;

import com.google.gson.annotations.SerializedName;

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
	
	private boolean isTransfer;	//환승역 여부
	private int odr;
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


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public double getLat() {
		return lat;
	}


	public void setLat(double lat) {
		this.lat = lat;
	}


	public double getLng() {
		return lng;
	}


	public void setLng(double lng) {
		this.lng = lng;
	}
	
	
	
}
