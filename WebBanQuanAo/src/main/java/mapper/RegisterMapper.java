package mapper;

import beans.Account;
import beans.Register;
import beans.Role;
import dao.RoleDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterMapper {
    public static Register mapRow(ResultSet rs) throws SQLException {
        Register register = new Register();
        register.setRegisterID(rs.getInt("MA_DK"));
        register.setVerifyCode(rs.getString("MA_XAC_THUC"));
        register.setLastName(rs.getString("HO"));
        register.setFirstName(rs.getString("TEN"));
        register.setPhoneNumber(rs.getString("SDT"));
        register.setEmail(rs.getString("EMAIL"));
        register.setUserName(rs.getString("TEN_TK"));
        register.setPassWord(rs.getString("MAT_KHAU"));
        register.setDateRegister(rs.getTimestamp("NGAY_DK"));
        register.setStatus(rs.getString("TRANG_THAI"));
        return register;
    }
}
