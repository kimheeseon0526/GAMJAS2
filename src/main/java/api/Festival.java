package api;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import com.google.gson.annotations.SerializedName;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("festival")
@NoArgsConstructor
@AllArgsConstructor
public class Festival {
	 	@SerializedName("addr1")
	    private String addr1;

	    @SerializedName("addr2")
	    private String addr2;

	    @SerializedName("zipcode")
	    private String zipcode;

	    @SerializedName("cat1")
	    private String cat1;

	    @SerializedName("cat2")
	    private String cat2;

	    @SerializedName("cat3")
	    private String cat3;

	    @SerializedName("contentid")
	    private String contentId;

	    @SerializedName("contenttypeid")
	    private String contentTypeId;

	    @SerializedName("createdtime")
	    private String createdTime;

	    @SerializedName("eventstartdate")
	    private String eventStartDate;

	    @SerializedName("eventenddate")
	    private String eventEndDate;

	    @SerializedName("firstimage")
	    private String firstImage;

	    @SerializedName("firstimage2")
	    private String firstImage2;

	    @SerializedName("cpyrhtDivCd")
	    private String cpyrhtDivCd;

	    @SerializedName("mapx")
	    private String mapX;

	    @SerializedName("mapy")
	    private String mapY;

	    @SerializedName("mlevel")
	    private String mLevel;

	    @SerializedName("modifiedtime")
	    private String modifiedTime;

	    @SerializedName("areacode")
	    private String areaCode;

	    @SerializedName("sigungucode")
	    private String sigunguCode;

	    @SerializedName("tel")
	    private String tel;

	    @SerializedName("title")
	    private String title;

	    @SerializedName("lDongRegnCd")
	    private String lDongRegnCd;

	    @SerializedName("lDongSignguCd")
	    private String lDongSignguCd;

	    @SerializedName("lclsSystm1")
	    private String lclsSystm1;

	    @SerializedName("lclsSystm2")
	    private String lclsSystm2;

	    @SerializedName("lclsSystm3")
	    private String lclsSystm3;

	    @SerializedName("progresstype")
	    private String progressType;

	    @SerializedName("festivaltype")
	    private String festivalType;

	    private String recomNo;
}
