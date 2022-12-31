package mapper;

import model.Size;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SizeMapper {
    public static Size mapRow(ResultSet rs) throws SQLException {
        Size size = new Size();
        size.setId(rs.getLong("ID"));
        size.setCode(rs.getString("CODE"));
        size.setName(rs.getString("NAME"));
        size.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        size.setCreatedBy(rs.getString("CREATED_BY"));
        size.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        size.setModifiedBy(rs.getString("MODIFIED_BY"));
        return size;
    }
}
