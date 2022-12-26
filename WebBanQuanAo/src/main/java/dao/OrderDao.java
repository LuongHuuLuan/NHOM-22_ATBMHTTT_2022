package dao;

import beans.Account;
import beans.Color;
import beans.Order;
import beans.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    public static List<Order> getAllOrder() {
        String sql = "SELECT * FROM HOADON";
        List<Order> orders = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                int orderID = resultSet.getInt("MA_HOA_DON");
                Account account = AccountDao.findOneById(resultSet.getInt("MA_TK"));
                String address = resultSet.getString("DIA_CHI_GH");
                String phone = resultSet.getString("SDT");
                String receiver = resultSet.getString("NGUOI_NHAN");
                Timestamp date = resultSet.getTimestamp("NGAY_THEM");
                double price = resultSet.getDouble("THANH_TIEN");
                String status = resultSet.getString("TRANG_THAI");
                order.setOrderID(orderID);
                order.setAccount(account);
                order.setAddress(address);
                order.setPhone(phone);
                order.setReceiver(receiver);
                order.setDate(date);
                order.setPrice(price);
                order.setStatus(status);
                order.setOrderItems(OrderItemDao.getItems(orderID));
                orders.add(order);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static Order getOrder(int id) {
        String sql = "SELECT * FROM HOADON WHERE MA_HOA_DON = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                int orderID = resultSet.getInt("MA_HOA_DON");
                Account account = AccountDao.findOneById(resultSet.getInt("MA_TK"));
                String address = resultSet.getString("DIA_CHI_GH");
                String phone = resultSet.getString("SDT");
                String receiver = resultSet.getString("NGUOI_NHAN");
                Timestamp date = resultSet.getTimestamp("NGAY_THEM");
                double price = resultSet.getDouble("THANH_TIEN");
                String status = resultSet.getString("TRANG_THAI");
                order.setOrderID(orderID);
                order.setAccount(account);
                order.setAddress(address);
                order.setPhone(phone);
                order.setReceiver(receiver);
                order.setDate(date);
                order.setPrice(price);
                order.setStatus(status);
                order.setOrderItems(OrderItemDao.getItems(orderID));
                return order;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean deleteOrder(int id) {
        Order order = getOrder(id);
        if (order != null) {
            for (OrderItem orderItem : order.getOrderItems()) {
                OrderItemDao.deleteItem(orderItem.getOrderID());
            }
        }
        Connection connection = Connect.getInstance().getConnection();
        String sql = "DELETE FROM HOADON WHERE MA_HOA_DON=?";
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

    public static boolean updateStatus(int id, String status) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "UPDATE HOADON SET TRANG_THAI = ? WHERE MA_HOA_DON = ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
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
