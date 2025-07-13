package mapper.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import domain.en.RecommendContentType;

@MappedTypes(RecommendContentType.class)
@MappedJdbcTypes(JdbcType.VARCHAR)
public class RecomContentTypeHandler extends BaseTypeHandler<RecommendContentType>{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, RecommendContentType parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter.name());
		
	}

	@Override
	public RecommendContentType getNullableResult(ResultSet rs, String columnName) throws SQLException {
		
		return RecommendContentType.valueOf(rs.getString(columnName).toUpperCase());
	}

	@Override
	public RecommendContentType getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return RecommendContentType.valueOf(rs.getString(columnIndex));
	}

	@Override
	public RecommendContentType getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return RecommendContentType.valueOf(cs.getString(columnIndex));
	}
	
}
