package mapper;

import model.Category;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper {
    public static Category mapRow(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getLong("ID"));
        category.setCode(rs.getString("CODE"));
        category.setName(rs.getString("NAME"));
        category.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        category.setCreatedBy(rs.getString("CREATED_BY"));
        category.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        category.setModifiedBy(rs.getString("MODIFIED_BY"));
        return category;
    }
}
