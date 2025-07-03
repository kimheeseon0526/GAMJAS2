package domain.info;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import domain.en.RecommendContentType;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("recommend")
public class Recommend {
	private Long recomNo;
	private RecommendContentType recomContenttype ;
	private String recomPlaceId;
	private String apiSubcontent;
	private String stationId;
	private Long memNo;
	private String regdatetime;
	private String moddatetime;
	
//	@Builder.Default
//	private List<Attach> attachs = new ArrayList<>();
	
}
