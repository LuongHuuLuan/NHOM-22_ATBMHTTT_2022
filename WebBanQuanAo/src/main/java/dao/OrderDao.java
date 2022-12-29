package dao;

import mapper.CartMapper;
import mapper.OrderMapper;
import mapper.RoleMapper;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public static List<Order> findAll() {
        List<Order> orders = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM orders";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = OrderMapper.mapRow(resultSet);
                orders.add(order);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static Order findOneByAccount(Account account) {
        Connection connection = Connect.getInstance().getConnection();
        Order order = null;
        try {
            String query = "SELECT * FROM orders WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, account.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order = OrderMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static Order findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Order order = null;
        try {
            String query = "SELECT * FROM orders WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                order = OrderMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public static boolean delete(long id) {
        OrderItemDao.delete(id);
        String sql = "DELETE FROM orders WHERE ID = ?";
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

    public static boolean update(Order order) {
        String sql = "UPDATE orders SET STATUS_ID = ? WHERE ID = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, order.getStatus().getId());
            preparedStatement.setLong(2, order.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
