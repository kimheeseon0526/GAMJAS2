package mapper;

import java.util.List;

import domain.Reply;
import org.apache.ibatis.annotations.Param;

import domain.AttachRef;
import domain.AttachRef.AttachRefType;


public interface AttachRefMapper {
	void insert(AttachRef attachRefType);
	
	List<AttachRef> list(AttachRef ref);
	
	void delete(AttachRef ref);


	List<AttachRef> list(@Param("attachreftype") AttachRefType attachrefType, @Param("refno") Long refno);
}
