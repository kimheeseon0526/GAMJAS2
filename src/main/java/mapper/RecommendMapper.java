package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import domain.info.StationsByRecom;


public interface RecommendMapper {
	List<Recommend> list(@Param("criteria") Criteria cri, @Param("type") RecommendContentType type);
	
	void insert (Recommend Recommend);
	
	void update(Recommend Recommend);

	void delete(Recommend recommend);
	
	long getCount(@Param("criteria") Criteria cri, @Param("type") RecommendContentType type);

	void insertRecomAttr(Long recomNo);

	void insertRecomRest(Long recomNo);

	void insertRecomFest(Long recomNo);

	Recommend selectOne(Long recomNo);

	void removeRecomAttr(Long recomNo);
	
	void removeRecomRest(Long recomNo);

	void removeRecomFest(Long recomNo);

	List<String> selectImgByRecomNo(Long recomNo);

	List<StationsByRecom> selectStationByrecomPlaceId(@Param("type") RecommendContentType rct, @Param("id") String recomPlaceId);
}
