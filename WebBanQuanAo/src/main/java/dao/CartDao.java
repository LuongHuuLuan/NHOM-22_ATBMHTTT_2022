package dao;

import mapper.CartMapper;
import model.Account;
import model.Cart;
import model.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDao {
    public static Cart findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Cart cart = null;
        try {
            String query = "SELECT * FROM cart WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                cart = CartMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public static Cart findOneByAccount(Account account) {
        Connection connection = Connect.getInstance().getConnection();
        Cart cart = null;
        try {
            String query = "SELECT * FROM cart WHERE ACCOUNT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, account.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                cart = CartMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public static long add(Cart cart) {
        String sql = "INSERT INTO cart(ACCOUNT_ID) VALUES(?);";
        Connection connection = Connect.getInstance().getConnection();
        long id = -1;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, cart.getAccount().getId());
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

    public static void update(Cart cart) {
        for (CartItem cartItem : cart.getCartItems()) {
            CartItemDao.update(cartItem);
        }
    }

    public static void empty(Cart cart) {
        CartItemDao.delete(cart.getId());
    }

    public static boolean delete(long id) {
        CartItemDao.delete(id);
        String sql = "DELETE FROM cart WHERE ID = ?";
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
