package mapper;

import dao.StatusDao;
import model.Account;
import model.Role;
import dao.RoleDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper {
    public static Account mapRow(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setId(rs.getLong("ID"));
        account.setReLoginToken(rs.getString("RE_LOGIN_TOKEN"));
        account.setValidateToken(rs.getString("VALIDATE_TOKEN"));
        account.setLastName(rs.getString("LAST_NAME"));
        account.setFirstName(rs.getString("FIRST_NAME"));
        account.setPhone(rs.getString("PHONE"));
        account.setEmail(rs.getString("EMAIL"));
        account.setAddress(rs.getString("ADDRESS"));
        account.setUsername(rs.getString("USER_NAME"));
        account.setPassword(rs.getString("PASSWORD"));
        account.setRole(RoleDao.findOneById(rs.getLong("ROLE_ID")));
        account.setStatus(StatusDao.findOneById(rs.getLong("STATUS_ID")));
        account.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        account.setCreatedBy(rs.getString("CREATED_BY"));
        account.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        account.setModifiedBy(rs.getString("MODIFIED_BY"));
        return account;
    }
}
