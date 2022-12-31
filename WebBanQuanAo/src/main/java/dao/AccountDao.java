package dao;


import model.Account;
import mapper.AccountMapper;
import model.Cart;
import model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
    // new
    public static Account findOneById(long id) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM account WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
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
            String query = "SELECT * FROM account";
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
            String query = "SELECT * FROM account WHERE USER_NAME = ? and PASSWORD = " + (isHash ? "md5(?)" : "?");
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
            String query = "SELECT * FROM account WHERE USER_NAME = ?";
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

    public static Account findOneByReLoginToken(String reLoginToken) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM account WHERE RE_LOGIN_TOKEN = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, reLoginToken);
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

    public static Account findOneByIdAndValidateToken(long id, String validateToken) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM account WHERE ID = ? AND VALIDATE_TOKEN = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.setString(2, validateToken);
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

    public static Account findOneByEmail(String email) {
        Account account = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM account WHERE EMAIL = ?";
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

    public static long add(Account account) {
        Connection connection = Connect.getInstance().getConnection();
        long id = -1;
        try {
            connection.setAutoCommit(false);
            String query = "INSERT INTO ACCOUNT(RE_LOGIN_TOKEN, VALIDATE_TOKEN, LAST_NAME, FIRST_NAME, PHONE, EMAIL, USER_NAME, PASSWORD, ROLE_ID, STATUS_ID) VALUES (?, ?, ?, ?, ?, ?, ?, md5(?), ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, account.getReLoginToken());
            preparedStatement.setString(2, account.getValidateToken());
            preparedStatement.setString(3, account.getLastName());
            preparedStatement.setString(4, account.getFirstName());
            preparedStatement.setString(5, account.getPhone());
            preparedStatement.setString(6, account.getEmail());
            preparedStatement.setString(7, account.getUsername());
            preparedStatement.setString(8, account.getPassword());
            preparedStatement.setLong(9, account.getRole().getId());
            preparedStatement.setLong(10, account.getStatus().getId());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getLong(1);
            }
            connection.commit();
            connection.setAutoCommit(true);
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public static boolean update(Account account, boolean isHash) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement preparedStatement = null;
        int result = -1;
        try {
            sql = "UPDATE account SET RE_LOGIN_TOKEN = ?, VALIDATE_TOKEN = ?, LAST_NAME = ?, FIRST_NAME = ?, PHONE = ?, EMAIL = ?, ADDRESS = ?, USER_NAME = ?, PASSWORD =" + (isHash ? "md5(?)" : "?") + ", ROLE_ID = ?, STATUS_ID = ? WHERE ID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getReLoginToken());
            preparedStatement.setString(2, account.getValidateToken());
            preparedStatement.setString(3, account.getLastName());
            preparedStatement.setString(4, account.getFirstName());
            preparedStatement.setString(5, account.getPhone());
            preparedStatement.setString(6, account.getEmail());
            preparedStatement.setString(7, account.getAddress());
            preparedStatement.setString(8, account.getUsername());
            preparedStatement.setString(9, account.getPassword());
            preparedStatement.setLong(10, account.getRole().getId());
            preparedStatement.setLong(11, account.getStatus().getId());
            preparedStatement.setLong(12, account.getId());
            result = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result != -1;
    }

    public static boolean delete(long id) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            Account account = findOneById(id);
            Cart cart = CartDao.findOneByAccount(account);
            Order order = OrderDao.findOneByAccount(account);
            if (cart != null) {
                CartDao.delete(cart.getId());
            }
            if (order != null) {
                OrderDao.delete(order.getId());
            }
            sql = "DELETE FROM account WHERE ID = ? ";
            prep = connection.prepareStatement(sql);
            prep.setLong(1, id);
            int res = prep.executeUpdate();
            prep.close();
            return res != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
