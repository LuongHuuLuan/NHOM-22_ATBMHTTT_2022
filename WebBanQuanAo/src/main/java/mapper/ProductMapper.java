package mapper;

import beans.Account;
import beans.Product;
import beans.Role;
import dao.*;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper {
    public static Product mapRow(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getString("MA_SP"));
        product.setName(rs.getString("TEN_SP"));
        product.setBrand(BrandDao.findOneById(rs.getString("MA_NHAN_HIEU")));
        product.setPrice(rs.getDouble("GIA"));
        product.setDescription(rs.getString("MO_TA"));
        product.setThumbnail(rs.getString("HINH_NHO"));
        product.setCreateBy(rs.getString("NGUOI_THEM"));
        product.setCreateDate(rs.getTimestamp("NGAY_THEM"));
        product.setTotalReviews(rs.getInt("TONG_DANH_GIA"));
        product.setTotalStar(rs.getInt("TONG_SAO"));
        product.setAmount(rs.getInt("SO_LUONG"));
        product.setColors(ColorDao.findByProduct(product));
        product.setTags(TagDao.findByProduct(product));
        product.setSizes(SizeDao.findByProduct(product));
        return product;
    }
}
