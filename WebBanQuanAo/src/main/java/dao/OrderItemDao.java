package dao;

import mapper.OrderItemMapper;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDao {
    public static List<OrderItem> findById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        List<OrderItem> orders = new ArrayList<>();
        try {
            String query = "SELECT * FROM order_detail WHERE ORDER_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItem item = OrderItemMapper.mapRow(resultSet);
                orders.add(item);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static boolean add(OrderItem item) {
        String sql = "INSERT INTO order_detail(ORDER_ID, PRODUCT_ID, COLOR_ID, SIZE_ID, AMOUNT, PRICE, DISCOUNT) VALUES(?, ?, ?, ?, ?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, item.getOrderId());
            preparedStatement.setLong(2, item.getProduct().getId());
            preparedStatement.setLong(3, item.getColor().getId());
            preparedStatement.setLong(4, item.getSize().getId());
            preparedStatement.setInt(5, item.getAmount());
            preparedStatement.setDouble(6, item.getPrice());
            preparedStatement.setInt(7, item.getDiscount());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(long id) {
        String sql = "DELETE FROM order_detail WHERE ORDER_ID = ?";
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
}
