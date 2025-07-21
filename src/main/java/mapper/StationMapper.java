package mapper;

import java.util.List;

import domain.Station;

public interface StationMapper {

	void insert(Station station);
	List<Station> List();
	List<Station> selectByLine(String lineName);

	List<Station> selectLine2();
	List<Station> selectLine5();


	List<Station> selectLine1Main();
	List<Station> selectLine1Branch1();



}
