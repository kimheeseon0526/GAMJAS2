package domain.info;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("mission")
public class Mission {

	private Long missionNo;             
	private String title;              
	private String summary;            
	private String content;            
	private String  regDatetime; 
	private String  modDatetime; 
	private Integer providedTicket;    
	private Long createdBy;            
	private String stationId;          
	private String placeId;            
	private Long recomNo;              

}
