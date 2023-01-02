package mapper;

import dao.AccountDao;
import model.Sign;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SignMapper {
    public static Sign mapRow(ResultSet rs) throws SQLException {
        Sign sign = new Sign();
        sign.setId(rs.getLong("ID"));
        sign.setAccount(AccountDao.findOneById(rs.getLong("ACCOUNT_ID")));
        sign.setSign(rs.getString("SIGN"));
        sign.setKeySize(rs.getInt("KEY_SIZE"));
        sign.setActive(rs.getBoolean("IS_ACTIVE"));
        sign.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        sign.setCreatedBy(rs.getString("CREATED_BY"));
        sign.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        sign.setModifiedBy(rs.getString("MODIFIED_BY"));
        return sign;
    }
}
