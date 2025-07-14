package domain.info;

import java.util.ArrayList;
import java.util.List;

import domain.Station;
import org.apache.ibatis.type.Alias;

import domain.en.RecommendContentType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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

	//JOIN에 의한 column

	private String title;

	private String firstImage;

	@Builder.Default
	private List<String> images = new ArrayList<>();

	@Builder.Default
	private List<StationsByRecom> stations = new ArrayList<>();

	
}
