package mapper;

import beans.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper {
    public static Role mapRow(ResultSet rs) throws SQLException {
        Role role = new Role();
        role.setId(rs.getString("MA_VAI_TRO"));
        role.setName(rs.getString("TEN_VAI_TRO"));
        role.setCreateDate(rs.getTimestamp("NGAY_THEM"));
        role.setModifyDate(rs.getTimestamp("NGAY_CAP_NHAT"));
        return role;
    }
}
