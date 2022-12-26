package dao;


import beans.Account;
import mapper.AccountMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
    // get user va password da ton tai trong bang tai khoan
//    public static Account getUser(String userName, String passWord) {
//        List<Account> accounts = new ArrayList<>();
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "CALL layTaiKhoan(?, ?)";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, userName);
//            preparedStatement.setString(2, passWord);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                Account ac = new Account();
//                int userID = resultSet.getInt(1);
//                String firstName = resultSet.getString(2);
//                String lastName = resultSet.getString(3);
//                String phoneNumber = resultSet.getString(4);
//                String email = resultSet.getString(5);
//                String address = resultSet.getString(6);
//                String userName1 = resultSet.getString(7);
//                String passWord1 = resultSet.getString(8);
//                Timestamp dateRegister = resultSet.getTimestamp(9);
//                String role = resultSet.getString(10);
//                ac.setUserID(userID);
//                ac.setFirstName(firstName);
//                ac.setLastName(lastName);
//                ac.setPhoneNumber(phoneNumber);
//                ac.setEmail(email);
//                ac.setAddress(address);
//                ac.setUserName(userName1);
//                ac.setPassWord(passWord1);
//                ac.setDateRegister(dateRegister);
//                ac.setRole(role);
//                accounts.add(ac);
//            }
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return accounts.isEmpty() ? null : accounts.get(0);
//    }
//
//    // get username trong ca hai bang dang ky va tai khoan neu ton tai se lay
//    public static String getUserName(String userName) {
//        Connection connection = Connect.getInstance().getConnection();
//        List<String> usernames = new ArrayList<>();
//        try {
//            String query = "SELECT TEN_TK FROM TAIKHOAN WHERE TEN_TK = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, userName);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                usernames.add(resultSet.getString(1));
//            }
//            if (usernames.isEmpty()) {
//                String query1 = "SELECT TEN_TK, NGAY_DK FROM DANGKY WHERE TEN_TK = ? AND TRANG_THAI = 'DANG_CHO'";
//                preparedStatement = connection.prepareStatement(query1);
//                preparedStatement.setString(1, userName);
//                resultSet = preparedStatement.executeQuery();
//                String username1 = "";
//                Timestamp date = null;
//                while (resultSet.next()) {
//                    username1 = resultSet.getString(1);
//                    date = resultSet.getTimestamp(2);
//                }
//                if (!username1.equals("") && date != null) {
////                  Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không nếu có là sai ngc lại là đúng
//                    boolean checkExpires = date.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)));
//                    if (checkExpires) {
//                        usernames.add(username1);
//                    }
//                }
//            }
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return usernames.isEmpty() ? null : usernames.get(0);
//    }
//
//    public static Account getAccount(int accountID) {
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "SELECT * FROM TAIKHOAN WHERE MA_TK = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setInt(1, accountID);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            Account account = new Account();
//            while (resultSet.next()) {
//                String lastName = resultSet.getString("HO");
//                String firstName = resultSet.getString("TEN");
//                String phone = resultSet.getString("SDT");
//                String email = resultSet.getString("EMAIL");
//                String address = resultSet.getString("HO");
//                String userName = resultSet.getString("TEN_TK");
//                String passWord = resultSet.getString("MAT_KHAU");
//                Timestamp registerDate = resultSet.getTimestamp("NGAY_DK");
//                String role = resultSet.getString("MA_VAI_TRO");
//                account.setUserID(accountID);
//                account.setLastName(lastName);
//                account.setFirstName(firstName);
//                account.setPhoneNumber(phone);
//                account.setEmail(email);
//                account.setAddress(address);
//                account.setUserName(userName);
//                account.setPassWord(passWord);
//                account.setDateRegister(registerDate);
//                account.setRole(role);
//            }
//            resultSet.close();
//            preparedStatement.close();
//            return account;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    public static String getEmail(String email) {
//        Connection connection = Connect.getInstance().getConnection();
//        List<String> emails = new ArrayList<>();
//        try {
//            String query = "SELECT EMAIL FROM TAIKHOAN WHERE EMAIL = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, email);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                emails.add(resultSet.getString(1));
//            }
//            if (emails.isEmpty()) {
//                String query1 = "SELECT EMAIL, NGAY_DK FROM DANGKY WHERE EMAIL = ? AND TRANG_THAI = 'DANG_CHO'";
//                preparedStatement = connection.prepareStatement(query1);
//                preparedStatement.setString(1, email);
//                resultSet = preparedStatement.executeQuery();
//                String email1 = "";
//                Timestamp date = null;
//                while (resultSet.next()) {
//                    email1 = resultSet.getString(1);
//                    date = resultSet.getTimestamp(2);
//                }
//                if (!email1.equals("") && date != null) {
////                  Kiểm tra thời gian đăng ký có quá thời gian hiện tại trừ đi 24 tiếng hay không nếu có là sai ngc lại là đúng
//                    boolean checkExpires = date.after(Timestamp.valueOf(LocalDateTime.now().minus(1, ChronoUnit.DAYS)));
//                    if (checkExpires) {
//                        emails.add(email1);
//                    }
//                }
//            }
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return emails.isEmpty() ? null : emails.get(0);
//    }
//
//    public enum RegisterState {
//        WAITING("DANG_CHO"), SUCCESS("THANH_CONG"), FAIL("THAT_BAI");
//        private String value;
//
//        private RegisterState(String value) {
//            this.value = value;
//        }
//    }
//
//    public static boolean updateStateRegister(int registerID, String token, RegisterState state) {
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "UPDATE DANGKY SET TRANG_THAI = ? WHERE MA_DK = ? AND MA_XAC_THUC = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, state.value);
//            preparedStatement.setInt(2, registerID);
//            preparedStatement.setString(3, token);
//            int result = preparedStatement.executeUpdate();
//            preparedStatement.close();
//            return result == -1 ? false : true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public static String getEmailFromTaiKhoanTable(String email) {
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "Select email from taikhoan where email = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, email);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                return email;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    public static List<Account> getListUser() {
//        List<Account> accounts = new ArrayList<>();
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "SELECT TK.MA_TK, TK.HO, TK.TEN, TK.SDT, TK.EMAIL, TK.DIA_CHI, TK.TEN_TK" +
//                    ", TK.MA_VAI_TRO   FROM TAIKHOAN TK ";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                Account ac = new Account();
//                int userID = resultSet.getInt(1);
//                String firstName = resultSet.getString(2);
//                String lastName = resultSet.getString(3);
//                String phoneNumber = resultSet.getString(4);
//                String email = resultSet.getString(5);
//                String address = resultSet.getString(6);
//                String userName1 = resultSet.getString(7);
//                String role = resultSet.getString(8);
//                ac.setUserID(userID);
//                ac.setFirstName(firstName);
//                ac.setLastName(lastName);
//                ac.setPhoneNumber(phoneNumber);
//                ac.setEmail(email);
//                ac.setAddress(address);
//                ac.setUserName(userName1);
//                ac.setRole(role);
//                accounts.add(ac);
//            }
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return accounts;
//    }
//
//    public static boolean addAccount(String lastName, String firstName, String phoneNumber, String email, String
//            nameAccount, String password) {
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            String query = "INSERT INTO TAIKHOAN(HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU) VALUES (?, ?, ?, ?, ?, ?);";
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, lastName);
//            preparedStatement.setString(2, firstName);
//            preparedStatement.setString(3, phoneNumber);
//            preparedStatement.setString(4, email);
//            preparedStatement.setString(5, nameAccount);
//            preparedStatement.setString(6, password);
//            int resultSet = preparedStatement.executeUpdate();
//            preparedStatement.close();
//            return resultSet != -1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    // xóa tài khoản người dùng
//    public static boolean deleteAccount(String id) {
//        Connection connection = Connect.getInstance().getConnection();
//        String sql = null;
//        PreparedStatement prep = null;
//        try {
//            sql = "DELETE FROM CHITIETGIO WHERE MA_GIO = ?";
//            prep = connection.prepareStatement(sql);
//            prep.setInt(1, Integer.parseInt(id));
//            int res0 = prep.executeUpdate();
//
//            sql = "DELETE FROM GIO WHERE MA_TK = ?";
//            prep = connection.prepareStatement(sql);
//            prep.setInt(1, Integer.parseInt(id));
//            int res1 = prep.executeUpdate();
//
//            sql = "DELETE FROM TAIKHOAN WHERE MA_TK = ? ";
//            prep = connection.prepareStatement(sql);
//            prep.setInt(1, Integer.parseInt(id));
//            int res2 = prep.executeUpdate();
//            prep.close();
//            return (res1 + res2) == 2;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    // cập nhật tài khoản người dùng
//    public static boolean updateAccount(String idAccount, String lastname, String firstname, String phone, String email, String address, String username, String role) {
//        Connection connection = Connect.getInstance().getConnection();
//        String sql = null;
//        PreparedStatement prep = null;
//        try {
//            sql = "UPDATE TAIKHOAN SET HO = ?, TEN = ?, SDT = ?, EMAIL = ?, DIA_CHI = ?, MA_VAI_TRO = ? WHERE MA_TK = ?";
//            prep = connection.prepareStatement(sql);
//            prep.setString(1, lastname);
//            prep.setString(2, firstname);
//            prep.setString(3, phone);
//            prep.setString(4, email);
//            prep.setString(5, address);
//            prep.setString(6, role);
//            prep.setInt(7, Integer.parseInt(idAccount.trim()));
//            int res1 = prep.executeUpdate();
//            prep.close();
//            return res1 == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public static boolean updateAccount(String idAccount, String lastname, String firstname, String phone, String email, String address, String username) {
//        Connection connection = Connect.getInstance().getConnection();
//        String sql = null;
//        PreparedStatement prep = null;
//        try {
//            sql = "UPDATE TAIKHOAN SET HO = ?, TEN = ?, SDT = ?, EMAIL = ?, DIA_CHI = ? WHERE MA_TK = ?";
//            prep = connection.prepareStatement(sql);
//            prep.setString(1, lastname);
//            prep.setString(2, firstname);
//            prep.setString(3, phone);
//            prep.setString(4, email);
//            prep.setString(5, address);
//            prep.setInt(6, Integer.parseInt(idAccount.trim()));
//            int res1 = prep.executeUpdate();
//            prep.close();
//            return res1 == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public static boolean updateAccount(String idAccount, String password) {
//        Connection connection = Connect.getInstance().getConnection();
//        String sql = null;
//        PreparedStatement prep = null;
//        try {
//            sql = "UPDATE TAIKHOAN SET MAT_KHAU = ? WHERE MA_TK = ?";
//            prep = connection.prepareStatement(sql);
//            prep.setString(1, password);
//            prep.setInt(2, Integer.parseInt(idAccount.trim()));
//            int res1 = prep.executeUpdate();
//            prep.close();
//            return res1 == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }


    // new

    public static Account findOneById(int id) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM taikhoan WHERE ma_tk = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account = AccountMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static List<Account> findAll() {
        List<Account> accounts = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM taikhoan";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account account = AccountMapper.mapRow(resultSet);
                accounts.add(account);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public static Account findOneByUserNameAndPassword(String userName, String password, boolean isHash) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM taikhoan WHERE ten_tk = ? and mat_khau = " + (isHash ? "md5(?)" : "?");
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account = AccountMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static Account findOneByUserName(String userName) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM taikhoan WHERE ten_tk = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account = AccountMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static int add(Account account) {
        Connection connection = Connect.getInstance().getConnection();
        int id = -1;
        try {
            connection.setAutoCommit(false);
            String query = "INSERT INTO TAIKHOAN(HO, TEN, SDT, EMAIL, DIA_CHI, TEN_TK, MAT_KHAU) VALUES (?, ?, ?, ?, ?, ?, md5(?));";
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, account.getLastName());
            preparedStatement.setString(2, account.getFirstName());
            preparedStatement.setString(3, account.getPhoneNumber());
            preparedStatement.setString(4, account.getEmail());
            preparedStatement.setString(5, account.getAddress());
            preparedStatement.setString(6, account.getUserName());
            preparedStatement.setString(7, account.getPassWord());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
            connection.setAutoCommit(true);
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public static Account findOneByEmail(String email) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM taikhoan WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account = AccountMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public static boolean update(Account account, boolean isHash) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement preparedStatement = null;
        int result = -1;
        try {
            sql = "UPDATE taikhoan SET HO = ?, TEN = ?, SDT = ?, EMAIL = ?, DIA_CHI = ?, TEN_TK = ?, MAT_KHAU =" + (isHash ? "md5(?)" : "?") + ", CHU_KY = ?, KHOA_CONG_KHAI = ?, MA_VAI_TRO = ? WHERE MA_TK = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getLastName());
            preparedStatement.setString(2, account.getFirstName());
            preparedStatement.setString(3, account.getPhoneNumber());
            preparedStatement.setString(4, account.getEmail());
            preparedStatement.setString(5, account.getAddress());
            preparedStatement.setString(6, account.getUserName());
            preparedStatement.setString(7, account.getPassWord());
            preparedStatement.setString(8, account.getSign());
            preparedStatement.setString(9, account.getPublicKey());
            preparedStatement.setString(10, account.getRole().getId());
            preparedStatement.setInt(11, account.getUserID());
            result = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result != -1;
    }

    public static boolean delete(int id) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            CartItemDao.delete(id);
            CartDao.delete(id);
            sql = "DELETE FROM TAIKHOAN WHERE MA_TK = ? ";
            prep = connection.prepareStatement(sql);
            prep.setInt(1, id);
            int res = prep.executeUpdate();
            prep.close();
            return res != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
