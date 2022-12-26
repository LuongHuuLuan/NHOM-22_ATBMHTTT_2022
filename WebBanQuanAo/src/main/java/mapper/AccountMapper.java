package mapper;

import beans.Account;
import beans.Role;
import dao.RoleDao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AccountMapper {
    public static Account mapRow(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setUserID(rs.getInt("MA_TK"));
        account.setLastName(rs.getString("HO"));
        account.setFirstName(rs.getString("TEN"));
        account.setPhoneNumber(rs.getString("SDT"));
        account.setEmail(rs.getString("EMAIL"));
        account.setAddress(rs.getString("DIA_CHI"));
        account.setUserName(rs.getString("TEN_TK"));
        account.setPassWord(rs.getString("MAT_KHAU"));
        account.setSign(rs.getString("CHU_KY"));
        account.setPublicKey(rs.getString("KHOA_CONG_KHAI"));
        account.setDateRegister(rs.getTimestamp("NGAY_DK"));
        Role role = RoleDao.findOneById(rs.getString("MA_VAI_TRO"));
        account.setRole(role);
        return account;
    }
}
