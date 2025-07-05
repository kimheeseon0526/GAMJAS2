package mapper;

import java.util.List;

import domain.Attach;

public interface AttachMapper {
	void insert(Attach attach);
	List<Attach> list(Long bno);  //특정 글을 봐야하기 때문에
	Attach selectOne(String uuid);
	void delete(String uuid);
	void deleteByBno(Long bno);
	
	List<Attach> selectYesterdayList();
}
