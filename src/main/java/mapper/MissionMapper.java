package mapper;

import java.util.List;

import domain.info.Recommend;
import org.apache.ibatis.annotations.Param;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Mission;

public interface MissionMapper {
	List<Mission> list(@Param("criteria") Criteria cri, @Param("type") RecommendContentType type);
	
	void insert (Mission mission);
	
	void update(Mission mission);

	void delete(Long missionNo);

	long getCount(@Param("criteria") Criteria cri, @Param("type") RecommendContentType type);

	Mission selectOne(Long missionNo);

    Mission selectOneByRecomNo(Long recomNo);

	void removeRecomNo(Long missionNo);
}
