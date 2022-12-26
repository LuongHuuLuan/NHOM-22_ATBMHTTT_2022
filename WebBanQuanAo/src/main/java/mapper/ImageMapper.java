package mapper;

import beans.Color;
import beans.Image;
import dao.ColorDao;
import dao.ProductDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageMapper {
    public static Image mapRow(ResultSet rs) throws SQLException {
        Image image = new Image();
        image.setColor(ColorDao.findOneById(rs.getString("MA_CT_MAU")));
        image.setUrl(rs.getString("DUONG_DAN_ANH"));
        return image;
    }
}
