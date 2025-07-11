package api;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("restaurant")
@NoArgsConstructor
@AllArgsConstructor
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
