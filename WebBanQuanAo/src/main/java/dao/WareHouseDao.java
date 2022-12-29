package dao;

import mapper.ColorMapper;
import mapper.SizeMapper;
import model.Color;
import model.Product;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WareHouseDao {
    public static int sumAmountProduct(Product product) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "SELECT SUM(AMOUNT) FROM warehouse WHERE PRODUCT_ID = ?";
        int result = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, product.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                result = resultSet.getInt(1);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static int sumAmountProductWithSizeAndColor(Product product, Size size, Color color) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "SELECT SUM(AMOUNT) FROM warehouse WHERE PRODUCT_ID = ? AND SIZE_ID = ? AND COLOR_ID = ?";
        int result = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, product.getId());
            preparedStatement.setLong(2, size.getId());
            preparedStatement.setLong(3, color.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                result = resultSet.getInt(1);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static List<Color> findColorByProduct(Product product) {
        List<Color> colors = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT color.* FROM color WHERE color.ID IN (SELECT COLOR_ID FROM warehouse WHERE PRODUCT_ID = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, product.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Color color = ColorMapper.mapRow(resultSet);
                colors.add(color);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colors;
    }

    public static List<Size> findSizeByProduct(Product product) {
        List<Size> sizes = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT size.* FROM size WHERE size.ID IN (SELECT SIZE_ID FROM warehouse WHERE PRODUCT_ID = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, product.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Size size = SizeMapper.mapRow(resultSet);
                sizes.add(size);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sizes;
    }
}
