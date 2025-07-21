package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Place;
import mapper.NearbyPlaceMapper;
import util.MybatisUtil;

public class NearbyPlaceService {

	public List<Place> getNearPlaces(String StationName) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			NearbyPlaceMapper mapper = session.getMapper(NearbyPlaceMapper.class);
			return mapper.selectNearbyPlaces(StationName);
			
		}
	}
}
