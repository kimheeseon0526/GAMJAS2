package mapper;

import java.util.List;

import domain.Station;

public interface StationMapper {

	void insert(Station station);
	List<Station> List();
	List<Station> selectByLine(String lineName);
	List<Station> Line1All();
	//경인선 + 경부선 + 1호선 + 경원선
	List<Station> selectLine1();
	List<Station> selectLine2();
	List<Station> selectLine5();



}
