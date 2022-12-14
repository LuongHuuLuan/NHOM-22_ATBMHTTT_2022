package dao;

import beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDao {
    public static List<OrderItem> getItems(int orderID) {
        String sql = "SELECT * FROM CTHD WHERE MA_HOA_DON = ?";
        List<OrderItem> items = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                OrderItem item = new OrderItem();
                Product product = ProductDao.getProduct(resultSet.getString("MA_SP"));
                String size = resultSet.getString("KICH_THUOC");
                String color = resultSet.getString("MAU_SAC");
                int amount = resultSet.getInt("SO_LUONG");
                item.setOrderID(orderID);
                item.setProduct(product);
                item.setSize(size);
                item.setColor(color);
                item.setAmount(amount);
                items.add(item);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public static boolean deleteItem(int id) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "DELETE FROM CTHD WHERE MA_HOA_DON=?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int rowEffects = preparedStatement.executeUpdate();
            if (rowEffects > 0) {
                return true;
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
