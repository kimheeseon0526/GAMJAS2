package domain;

public class Station {
	
	private String id;
	private String name;
	private String lineName;
	private double lat;
	private double lng;
	private boolean isTransfer;	//환승역 여부
	private int odr;
	private String createdAt;	//등록일
	private String updatedAt;	//수정일
	private String markerIcon;	//마커 아이콘(사용 여부 확인)
	private String lineId;
	
}
