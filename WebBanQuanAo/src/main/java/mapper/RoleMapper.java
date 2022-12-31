package mapper;

import model.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper {
    public static Role mapRow(ResultSet rs) throws SQLException {
        Role role = new Role();
        role.setId(rs.getLong("ID"));
        role.setCode(rs.getString("CODE"));
        role.setName(rs.getString("NAME"));
        role.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        role.setCreatedBy(rs.getString("CREATED_BY"));
        role.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        role.setModifiedBy(rs.getString("MODIFIED_BY"));
        return role;
    }
}
