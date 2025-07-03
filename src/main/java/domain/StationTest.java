package domain;

import java.util.ArrayList;
import java.util.List;

public class StationTest {
	public static List<Station> getLine2Station() {
		List<Station> list = new ArrayList<>();
		
		//예시
		list.add(new Station("합정", 37.549463, 126.913739));
		list.add(new Station("당산", 37.53438, 126.902281));
		
		return list;
	}
}
