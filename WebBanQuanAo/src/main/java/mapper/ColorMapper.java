package mapper;

import model.Color;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ColorMapper {
    public static Color mapRow(ResultSet rs) throws SQLException {
        Color color = new Color();
        color.setId(rs.getLong("ID"));
        color.setCode(rs.getString("CODE"));
        color.setName(rs.getString("NAME"));
        color.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        color.setCreatedBy(rs.getString("CREATED_BY"));
        color.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        color.setModifiedBy(rs.getString("MODIFIED_BY"));
        return color;
    }
}
