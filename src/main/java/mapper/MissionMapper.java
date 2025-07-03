package mapper;

import java.util.List;

import domain.dto.Criteria;
import domain.info.Mission;

public interface MissionMapper {
	List<Mission> list(Criteria cri);
	
	void insert (Mission mission);
	
	void update(Mission mission);

	void delete(Long missionNo);
}
