package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.AttachRef;
import domain.AttachRef.AttachRefType;


public interface AttachRefMapper {
	void insert(AttachRef attachRefType);
	
	List<AttachRef> list(AttachRef ref);
	
	void delete(AttachRef ref);
	

	
}
