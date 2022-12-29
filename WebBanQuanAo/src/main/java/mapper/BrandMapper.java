package mapper;

import model.Brand;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BrandMapper {
    public static Brand mapRow(ResultSet rs) throws SQLException {
        Brand brand = new Brand();
        brand.setId(rs.getLong("ID"));
        brand.setCode(rs.getString("CODE"));
        brand.setName(rs.getString("NAME"));
        brand.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        brand.setCreatedBy(rs.getString("CREATED_BY"));
        brand.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        brand.setModifiedBy(rs.getString("MODIFIED_BY"));
        return brand;
    }
}
