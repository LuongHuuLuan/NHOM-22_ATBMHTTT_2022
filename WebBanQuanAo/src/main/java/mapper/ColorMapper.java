package mapper;

import beans.Brand;
import beans.Color;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ColorMapper {
    public static Color mapRow(ResultSet rs) throws SQLException {
        Color color = new Color();
        color.setId(rs.getString("MA_CT_MAU"));
        color.setName(rs.getString("TEN_MAU"));
        color.setCreateBy(rs.getString("NGUOI_THEM"));
        color.setCreateDate(rs.getTimestamp("NGAY_THEM"));
        return color;
    }
}
