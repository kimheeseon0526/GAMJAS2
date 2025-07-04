package mapper;

import java.util.List;

import api.Attraction;

public interface AttractionMapper {
	List<Attraction> list(); 
	void insert(Attraction attraction);
}
