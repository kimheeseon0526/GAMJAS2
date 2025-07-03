package mapper;

import java.util.List;

import domain.dto.Criteria;
import domain.info.Recommend;


public interface RecommendMapper {
	List<Recommend> list(Criteria cri);
	
	void insert (Recommend Recommend);
	
	void update(Recommend Recommend);

	void delete(Long recomNo);
}
