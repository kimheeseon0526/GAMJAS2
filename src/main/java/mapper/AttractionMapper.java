package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import api.Attraction;
import domain.dto.Criteria;

public interface AttractionMapper {
	List<Attraction> list(Criteria cri); 
	void insert(Attraction attraction);
	long getCount(Criteria cri);
	Attraction selectOne(String postSn);
}
