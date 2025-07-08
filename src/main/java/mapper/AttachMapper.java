package mapper;

import java.util.List;

import domain.Attach;

public interface AttachMapper {
	void insert(Attach attach);
	Attach selectOne(String uuid);
	void delete(Long bno);
	
	List<Attach> selectYesterdayList();
}
