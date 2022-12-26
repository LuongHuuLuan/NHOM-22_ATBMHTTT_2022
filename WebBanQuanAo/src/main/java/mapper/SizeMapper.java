package mapper;

import beans.Color;
import beans.Size;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SizeMapper {
    public static Size mapRow(ResultSet rs) throws SQLException {
        Size size = new Size();
        size.setId(rs.getString("MA_CT_KICH_THUOC"));
        size.setName(rs.getString("TEN_KICH_THUOC"));
        size.setCreateBy(rs.getString("NGUOI_THEM"));
        size.setCreateDate(rs.getTimestamp("NGAY_THEM"));
        return size;
    }
}
