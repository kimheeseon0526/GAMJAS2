package mapper;

import java.util.List;

import org.junit.jupiter.api.Test;

import domain.Station;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class StationMapperTest {

	public StationMapper mapper = MybatisUtil.getSqlSession().getMapper(StationMapper.class);

	@Test
	public void selectByLineTest() {
		String lineName = "2호선";
		List<Station> stations = mapper.selectByLine(lineName);
		
		stations.forEach(s -> log.info("{} :: {} :: {} :: {} :: {}", s.getId() + s.getName()  + s.getLineName() + s.getLat() + s.getLng()));
	}
		
}
