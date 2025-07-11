package mapper;

import java.util.List;

import api.Attraction;
import api.Restaurant;
import domain.dto.Criteria;

public interface RestaurantMapper {
	void insert(Restaurant restaurant);

	List<Restaurant> list(Criteria cri);

	long getCount(Criteria cri);

	Restaurant selectOne(Long recomNo);

	List<Restaurant> getRecomList(Criteria cri);

	long getRecomCount(Criteria cri);

    Restaurant selectOneByPk(String pk);
}
