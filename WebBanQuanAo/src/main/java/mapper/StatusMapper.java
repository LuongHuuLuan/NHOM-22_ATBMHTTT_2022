package mapper;

import model.Status;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StatusMapper {
    public static Status mapRow(ResultSet rs) throws SQLException {
        Status status = new Status();
        status.setId(rs.getLong("ID"));
        status.setCode(rs.getString("CODE"));
        status.setName(rs.getString("NAME"));
        status.setDescription(rs.getString("DESCRIPTION"));
        status.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        status.setCreatedBy(rs.getString("CREATED_BY"));
        status.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        status.setModifiedBy(rs.getString("MODIFIED_BY"));
        return status;
    }
}
