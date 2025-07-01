package domain;

import java.util.Map;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonConvertTest {
	
	
	Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.UPPER_CASE_WITH_UNDERSCORES).create();
	
	
	public void testToJson() {
//		Attraction
	}
	
	public void testFromJson() {
//		String input =
	}
}
