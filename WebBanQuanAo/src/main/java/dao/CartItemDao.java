package dao;

import mapper.CartItemMapper;
import model.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartItemDao {

    public static List<CartItem> findById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        List<CartItem> items = new ArrayList<>();
        try {
            String query = "SELECT * FROM cart_detail WHERE CART_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                CartItem item = CartItemMapper.mapRow(resultSet);
                items.add(item);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    public static CartItem findByProductIdAndColorIdAndSizeId(long productId, long colorId, long sizeId) {
        Connection connection = Connect.getInstance().getConnection();
        CartItem item = null;
        try {
            String query = "SELECT * FROM cart_detail WHERE PRODUCT_ID = ? AND COLOR_ID = ? AND SIZE_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, productId);
            preparedStatement.setLong(2, colorId);
            preparedStatement.setLong(3, sizeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                item = CartItemMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }

    public static boolean add(CartItem item) {
        String sql = "INSERT INTO cart_detail(CART_ID, PRODUCT_ID, COLOR_ID, SIZE_ID, AMOUNT) VALUES(?, ?, ?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, item.getCartId());
            preparedStatement.setLong(2, item.getProduct().getId());
            preparedStatement.setLong(3, item.getColor().getId());
            preparedStatement.setLong(4, item.getSize().getId());
            preparedStatement.setInt(5, item.getAmount());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean update(CartItem item) {
        String sql = "UPDATE cart_detail SET AMOUNT = ? WHERE  CART_ID = ? AND PRODUCT_ID = ? AND COLOR_ID = ? AND SIZE_ID  = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, item.getAmount());
            preparedStatement.setLong(2, item.getCartId());
            preparedStatement.setLong(3, item.getProduct().getId());
            preparedStatement.setLong(4, item.getColor().getId());
            preparedStatement.setLong(5, item.getSize().getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean delete(long id) {
        String sql = "DELETE FROM cart_detail WHERE CART_ID = ?";
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

    public static boolean delete(CartItem item) {
        String sql = "DELETE FROM cart_detail WHERE CART_ID = ? AND PRODUCT_ID = ? AND COLOR_ID = ? AND SIZE_ID = ? AND AMOUNT = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, item.getCartId());
            preparedStatement.setLong(2, item.getProduct().getId());
            preparedStatement.setLong(3, item.getColor().getId());
            preparedStatement.setLong(4, item.getSize().getId());
            preparedStatement.setInt(5, item.getAmount());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
