package dao;

import beans.Account;
import beans.Register;
import mapper.AccountMapper;
import mapper.RegisterMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegisterDao {

    public enum RegisterState {
        WAITING("DANG_CHO"), SUCCESS("THANH_CONG"), FAIL("THAT_BAI");
        private String value;

        private RegisterState(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    public static boolean addRegister(String lastName, String firstName, String phoneNumber, String email, String
            nameAccount, String password, String token) {
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "CALL themDangKy(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, token);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, firstName);
            preparedStatement.setString(4, phoneNumber);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, nameAccount);
            preparedStatement.setString(7, password);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getRegisterID(String userName, String token) {
        List<Integer> ids = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT MA_DK FROM DANGKY WHERE TEN_TK = ? AND MA_XAC_THUC = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, token);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int registerID = resultSet.getInt(1);
                ids.add(registerID);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ids.isEmpty() ? null : ids.get(0);
    }

    // new
    public static int add(Register register) {
        Connection connection = Connect.getInstance().getConnection();
        int id = -1;
        try {
            connection.setAutoCommit(false);
            String query = "INSERT INTO DANGKY(MA_XAC_THUC, HO, TEN, SDT, EMAIL, TEN_TK, MAT_KHAU) VALUES(?, ?, ?, ?, ?, ?, md5(?));";
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, register.getVerifyCode());
            preparedStatement.setString(2, register.getLastName());
            preparedStatement.setString(3, register.getFirstName());
            preparedStatement.setString(4, register.getPhoneNumber());
            preparedStatement.setString(5, register.getEmail());
            preparedStatement.setString(6, register.getUserName());
            preparedStatement.setString(7, register.getPassWord());
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

    public static Register findOneById(int id) {
        Register register = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM dangky WHERE ma_dk = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                register = RegisterMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return register;
    }
    public static Register findOneByUsernameAndStatus(String userName, String status) {
        Register register = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM dangky WHERE ten_tk = ? and trang_thai = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                register = RegisterMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return register;
    }
    public static Register findOneByEmailAndStatus(String email, String status) {
        Register register = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM dangky WHERE email = ? and trang_thai = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, status);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                register = RegisterMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return register;
    }

    public static boolean update(Register register, boolean isHash) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement preparedStatement = null;
        int result = -1;
        try {
            sql = "UPDATE dangky SET MA_XAC_THUC = ?, HO = ?, TEN = ?, SDT = ?, EMAIL = ?, TEN_TK = ?, MAT_KHAU =" + (isHash ? "md5(?)" : "?") + ", TRANG_THAI = ? WHERE MA_DK = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, register.getVerifyCode());
            preparedStatement.setString(2, register.getLastName());
            preparedStatement.setString(3, register.getFirstName());
            preparedStatement.setString(4, register.getPhoneNumber());
            preparedStatement.setString(5, register.getEmail());
            preparedStatement.setString(6, register.getUserName());
            preparedStatement.setString(7, register.getPassWord());
            preparedStatement.setString(8, register.getStatus());
            preparedStatement.setInt(9, register.getRegisterID());
            result = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result != -1;
    }

}
