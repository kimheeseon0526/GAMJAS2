package mapper;

import java.util.List;

import domain.Station;

public interface StationMapper {

	void insert(Station station);
	List<Station> List();
	List<Station> selectByLine(String lineName);

}
