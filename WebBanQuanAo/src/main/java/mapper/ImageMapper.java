package mapper;

import model.Image;
import dao.ColorDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageMapper {
    public static Image mapRow(ResultSet rs) throws SQLException {
        Image image = new Image();
        image.setProductId(rs.getLong("PRODUCT_ID"));
        image.setUrl(rs.getString("PHOTO_URL"));
        return image;
    }
}
