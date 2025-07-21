package mapper;

import java.util.List;

import domain.Place;

public interface NearbyPlaceMapper {
	List<Place> selectNearbyPlaces(String stationName);

}
