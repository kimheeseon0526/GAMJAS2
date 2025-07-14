package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import api.Attraction;
import domain.Board;
import domain.dto.Criteria;
import domain.en.RecommendContentType;
import domain.info.Recommend;
import domain.info.StationsByRecom;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachMapper;
import mapper.BoardMapper;
import mapper.RecommendMapper;
import util.MybatisUtil;

@Slf4j
public class RecommendService {
	public List<Recommend> list(Criteria cri, RecommendContentType rct) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			List<Recommend> list = mapper.list(cri, rct);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	
	public void write(Recommend recommend) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {	
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
//			
				mapper.insert(recommend);   // 글 작성
				
			switch(recommend.getRecomContenttype()) {
				case RecommendContentType.ATTRACTION : mapper.insertRecomAttr(recommend.getRecomNo()); break;
				
				case RecommendContentType.RESTAURANT : mapper.insertRecomRest(recommend.getRecomNo()); break;
				
				case RecommendContentType.FESTIVAL : mapper.insertRecomFest(recommend.getRecomNo()); break;
			}
				
			
			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함. 
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}  //try catch -> 롤백해라
	}

	public long getCount(Criteria cri, RecommendContentType rct) { 
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			return mapper.getCount(cri, rct); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	
	public Recommend findBy(Long recomNo) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			return mapper.selectOne(recomNo); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<?> apiList(Criteria cri, RecommendContentType rct) {
		
		if(rct.equals(RecommendContentType.ATTRACTION)) {
			AttractionService service = new AttractionService();
			return service.list(cri);
		}
		else if(rct.equals(RecommendContentType.RESTAURANT)) {
			RestaurantService service = new RestaurantService();
			return service.list(cri);
		}
		else if(rct.equals(RecommendContentType.FESTIVAL)) {
			FestivalService service = new FestivalService();
			return service.list(cri);
		}
		
		return null;
	} 
	
	
	
	public long getApiCount(Criteria cri, RecommendContentType rct) { 
		if(rct.equals(RecommendContentType.ATTRACTION)) {
			AttractionService service = new AttractionService();
			return service.getCount(cri);
		}
		else if(rct.equals(RecommendContentType.RESTAURANT)) {
			
			RestaurantService service = new RestaurantService();
			return service.getCount(cri);
		}
		else if(rct.equals(RecommendContentType.FESTIVAL)) {
			
			FestivalService service = new FestivalService();
			return service.getCount(cri);
		}
		return 0;
	}

	public void modify(Recommend recommend) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			mapper.update(recommend); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void remove(Recommend recommend) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {	
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
				
			switch(recommend.getRecomContenttype()) {
				case RecommendContentType.ATTRACTION : mapper.removeRecomAttr(recommend.getRecomNo()); break;
				
				case RecommendContentType.RESTAURANT : mapper.removeRecomRest(recommend.getRecomNo()); break;
				
				case RecommendContentType.FESTIVAL : mapper.removeRecomFest(recommend.getRecomNo()); break;
			}
			
			mapper.delete(recommend);
			
			session.commit();  //session에 수동커밋을 한다. 하나가 실패하면 다 실패함. 
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();  // 아까 데이터가 나타나지 않아서 선생님이 적어주심
		} finally {
			session.close();
		}  //try catch -> 롤백해라
	}

	public List<String> findByImgByRecomNo(Long recomNo) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			List<String> list = mapper.selectImgByRecomNo(recomNo);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public List<StationsByRecom> findByStationByrecomPlaceId(RecommendContentType rct, String recomPlaceId) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			List<StationsByRecom> list = mapper.selectStationByrecomPlaceId(rct, recomPlaceId);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}
	
}
	

