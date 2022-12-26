package mapper;

import beans.Account;
import beans.Brand;
import beans.Role;
import dao.RoleDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BrandMapper {
    public static Brand mapRow(ResultSet rs) throws SQLException {
        Brand brand = new Brand();
        brand.setId(rs.getString("MA_NHAN_HIEU"));
        brand.setName(rs.getString("TEN_NHAN_HIEU"));
        brand.setDate(rs.getTimestamp("NGAY_CAP_NHAT"));
        return brand;
    }
}
