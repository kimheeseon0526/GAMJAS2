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

	public List<?> apiRecomList(Criteria cri, RecommendContentType rct) {

		if(rct.equals(RecommendContentType.ATTRACTION)) {
			AttractionService service = new AttractionService();
			return service.getRecomList(cri);
		}
		else if(rct.equals(RecommendContentType.RESTAURANT)) {
			RestaurantService service = new RestaurantService();
			return service.getRecomList(cri);
		}
		else if(rct.equals(RecommendContentType.FESTIVAL)) {
			FestivalService service = new FestivalService();
			return service.getRecomList(cri);
		}

		return null;
	}
	public long getRecomApiCount(Criteria cri, RecommendContentType rct) {
		if(rct.equals(RecommendContentType.ATTRACTION)) {
			AttractionService service = new AttractionService();
			return service.getRecomCount(cri);
		}
		else if(rct.equals(RecommendContentType.RESTAURANT)) {

			RestaurantService service = new RestaurantService();
			return service.getRecomCount(cri);
		}
		else if(rct.equals(RecommendContentType.FESTIVAL)) {

			FestivalService service = new FestivalService();
			return service.getRecomCount(cri);
		}
		return 0;
	}

	public void modify(Mission mission) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MissionMapper mapper = session.getMapper(MissionMapper.class);
			mapper.update(mission);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void remove(Mission mission) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {
			MissionMapper mapper = session.getMapper(MissionMapper.class);

			mapper.removeRecomNo(mission.getMissionNo());

			mapper.update(mission);

			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함.

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}  //try catch -> 롤백해라
	}
}
