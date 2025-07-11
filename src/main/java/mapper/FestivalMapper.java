package mapper;

import java.util.List;

import api.Attraction;
import api.Festival;
import domain.dto.Criteria;

public interface FestivalMapper {
	void insert(Festival festival);

	List<Festival> list(Criteria cri);

	long getCount(Criteria cri);

	Festival selectOne(Long recomNo);

	List<Festival> getRecomList(Criteria cri);

	long getRecomCount(Criteria cri);

	Festival selectOneByPk(String pk);
}
