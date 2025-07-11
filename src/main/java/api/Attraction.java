package api;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("attraction")
@NoArgsConstructor
@AllArgsConstructor
public class Attraction {
	private String postSn;
	private String langCodeId;
	private String postSj;
	private String postUrl;
	private String address;
	private String newAddress;
	private String cmmnTelNo;
	private String cmmnFax;
	private String cmmnHmpgUrl;
	private String cmmnUseTime;
	private String cmmnBsnde;
	private String cmmnRstde;
	private String subwayInfo;
	private String tag;
	private String bfDesc;
	private String recomNo;
	private String mapx;
	private String mapy;
}
