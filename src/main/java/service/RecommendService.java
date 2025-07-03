package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import domain.info.Recommend;
import mapper.RecommendMapper;
import util.MybatisUtil;

public class RecommendService {
	public List<Recommend> list(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()){
			
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
			List<Recommend> list = mapper.list(cri);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void write(Recommend Recommend) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			RecommendMapper mapper = session.getMapper(RecommendMapper.class);
//			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			mapper.insert(Recommend); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
