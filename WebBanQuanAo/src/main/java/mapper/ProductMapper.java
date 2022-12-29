package mapper;

import model.Product;
import dao.*;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper {
    public static Product mapRow(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getLong("ID"));
        product.setCode(rs.getString("CODE"));
        product.setName(rs.getString("NAME"));
        product.setBrand(BrandDao.findOneById(rs.getLong("BRAND_ID")));
        product.setCategory(CategoryDao.findOneById(rs.getLong("CATEGORY_ID")));
        product.setPrice(rs.getDouble("PRICE"));
        product.setDiscount(rs.getInt("DISCOUNT"));
        product.setDescription(rs.getString("DESCRIPTION"));
        product.setThumbnail(rs.getString("THUMBNAIL"));
        product.setTotalReviews(rs.getInt("TOTAL_REVIEW"));
        product.setTotalStars(rs.getInt("TOTAL_STAR"));
        product.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        product.setCreatedBy(rs.getString("CREATED_BY"));
        product.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        product.setModifiedBy(rs.getString("MODIFIED_BY"));
        product.setImages(ImageDao.findByProductId(product.getId()));
        return product;
    }
}
