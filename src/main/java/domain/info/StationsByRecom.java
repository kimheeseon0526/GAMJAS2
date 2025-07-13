package domain.info;

import org.apache.ibatis.type.Alias;

import domain.en.RecommendContentType;
import lombok.Data;

@Data
@Alias("stationsbyrecom")
public class StationsByRecom {
	String stationId;
	String stationName;
	String stationLine;
	String id;
	String title;
	double lat;
	double lng;
	RecommendContentType type;
	String addr;
	double dist;
}
