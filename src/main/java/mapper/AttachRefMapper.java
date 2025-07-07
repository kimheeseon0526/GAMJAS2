package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.AttachRef;


public interface AttachRefMapper {
	void insert(AttachRef attachRefType);
	
	List<AttachRef> list(@Param("refType") String refType, @Param("refNo") Long refNo);
	
	void delete(@Param("refType") String refType, @Param("refNo") Long refNo);


	
}
