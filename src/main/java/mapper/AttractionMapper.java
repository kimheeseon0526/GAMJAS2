package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import api.Attraction;
import domain.dto.Criteria;

public interface AttractionMapper {
	List<Attraction> list(Criteria cri); 

	void insert(Attraction attraction);

	long getCount(Criteria cri);

	Attraction selectOne(Long recomNo);

	List<Attraction> getRecomList(Criteria cri);

	long getRecomCount(Criteria cri);

    Attraction selectOneByPk(String pk);
}
