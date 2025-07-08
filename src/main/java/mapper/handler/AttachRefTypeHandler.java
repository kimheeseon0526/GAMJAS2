package mapper.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import domain.AttachRef.AttachRefType;
import domain.en.CategoryStatus;

@MappedTypes(AttachRefType.class)
@MappedJdbcTypes(JdbcType.VARCHAR)
public class AttachRefTypeHandler extends BaseTypeHandler<AttachRefType>{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, AttachRefType parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, parameter.name());
		
	}

	@Override
	public AttachRefType getNullableResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return AttachRefType.valueOf(rs.getString(columnName));  //rs -result타입
	}

	@Override
	public AttachRefType getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return AttachRefType.valueOf(rs.getString(columnIndex));
	}

	@Override
	public AttachRefType getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return AttachRefType.valueOf(cs.getString(columnIndex));
	}
	
	

}
