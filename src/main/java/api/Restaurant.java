package api;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Restaurant {
	private String postSn;
	private String langCodeId;
	private String postSj;
	private String postUrl;
	private String address;
	private String newAddress;
	private String cmmnTelNo;
	private String cmmnHmpgUrl;
	private String cmmnUseTime;
	private String subwayInfo;
	private String cmmnHmpgLang;
	private String fdReprsntMenu;
	private String recomNo;

}
