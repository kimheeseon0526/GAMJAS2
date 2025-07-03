package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import domain.info.Mission;
import mapper.BoardMapper;
import mapper.MissionMapper;
import util.MybatisUtil;

public class MissionService {
	public List<Mission> list(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			
			MissionMapper mapper = session.getMapper(MissionMapper.class);
			List<Mission> list = mapper.list(cri);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void write(Mission mission) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MissionMapper mapper = session.getMapper(MissionMapper.class);
//			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			mapper.insert(mission); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
