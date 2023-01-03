package dao;

import mapper.SignMapper;
import mapper.VerificationMapper;
import model.Sign;
import model.Verification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VerificationDao {

    public static Verification findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Verification verification = null;
        try {
            String query = "SELECT * FROM verification WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                verification = VerificationMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return verification;
    }

    public static Verification findOneByOrderId(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Verification verification = null;
        try {
            String query = "SELECT * FROM sign WHERE Order_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                verification = VerificationMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return verification;
    }

    public static int add(Verification verification) {
        String sql = "INSERT INTO verification(ORDER_ID, HASH_VALUE, SIGN_ID, IS_OK) VALUES(?, ?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        int id = -1;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, verification.getOrder().getId());
            preparedStatement.setString(2, verification.getHashValue());
            preparedStatement.setLong(3, verification.getSign().getId());
            preparedStatement.setBoolean(4, verification.isOK());
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
        String sql = "DELETE FROM verification WHERE ID = ?";
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

    public static boolean update(Verification verification) {
        String sql = "UPDATE sign SET HASH_VALUE = ?, IS_OK = ?  WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, verification.getHashValue());
            preparedStatement.setBoolean(2, verification.isOK());
            preparedStatement.setLong(3, verification.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
