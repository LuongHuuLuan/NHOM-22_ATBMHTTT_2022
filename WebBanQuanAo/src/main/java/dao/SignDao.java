package dao;

import mapper.SignMapper;
import model.Sign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignDao {

    public static Sign findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Sign sign = null;
        try {
            String query = "SELECT * FROM sign WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = SignMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static Sign findOneByAccountId(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Sign sign = null;
        try {
            String query = "SELECT * FROM sign WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = SignMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static Sign findOneByAccountIdAndIsActive(long id, boolean isActive) {
        Connection connection = Connect.getInstance().getConnection();
        Sign sign = null;
        try {
            String query = "SELECT * FROM sign WHERE ACCOUNT_ID = ? AND IS_ACTIVE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.setBoolean(2, isActive);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sign = SignMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static int add(Sign sign) {
        String sql = "INSERT INTO sign(ACCOUNT_ID, SIGN, IS_ACTIVE) VALUES(?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        int id = -1;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, sign.getAccount().getId());
            preparedStatement.setString(2, sign.getSign());
            preparedStatement.setBoolean(3, sign.isActive());
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

    public static boolean delete(long id) {
        String sql = "DELETE FROM sign WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Sign sign) {
        String sql = "UPDATE sign SET SIGN = ?, IS_ACTIVE = ?  WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, sign.getSign());
            preparedStatement.setBoolean(2, sign.isActive());
            preparedStatement.setLong(3, sign.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
