package mapper;

import domain.Board;

public interface BoardMapper {

	void insert(Board board);
	
	void update(Board board);
	
	void delete(Long bno);
	
	
	

}
