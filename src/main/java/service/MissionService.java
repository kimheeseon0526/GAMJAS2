package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Mission;
import domain.info.Recommend;
import mapper.BoardMapper;
import mapper.MissionMapper;
import mapper.RecommendMapper;
import util.MybatisUtil;

public class MissionService {
	public List<Mission> list(Criteria cri, RecommendContentType rct) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			
			MissionMapper mapper = session.getMapper(MissionMapper.class);
			List<Mission> list = mapper.list(cri, rct);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public long getCount(Criteria cri, RecommendContentType rct) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MissionMapper mapper = session.getMapper(MissionMapper.class);
			return mapper.getCount(cri, rct); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
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
	
	public Mission findBy(Long missionNo) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MissionMapper mapper = session.getMapper(MissionMapper.class);
			return mapper.selectOne(missionNo); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
