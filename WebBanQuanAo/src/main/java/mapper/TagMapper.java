package mapper;

import beans.Color;
import beans.Tag;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TagMapper {
    public static Tag mapRow(ResultSet rs) throws SQLException {
        Tag tag = new Tag();
        tag.setId(rs.getString("MA_CT_THE"));
        tag.setName(rs.getString("TEN_THE"));
        tag.setCreateBy(rs.getString("NGUOI_THEM"));
        tag.setCreateDate(rs.getTimestamp("NGAY_THEM"));
        return tag;
    }
}
