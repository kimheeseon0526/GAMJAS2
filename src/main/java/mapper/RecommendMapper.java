package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Recommend;


public interface RecommendMapper {
	List<Recommend> list(@Param("criteria") Criteria cri, @Param("type") RecommendContentType type);
	
	void insert (Recommend Recommend);
	
	void update(Recommend Recommend);

	void delete(Long recomNo);
}
