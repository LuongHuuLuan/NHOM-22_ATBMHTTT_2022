package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Image;
import mapper.ImageMapper;

public class ImageDao {
    // new
    public static List<Image> findAll() {
        List<Image> images = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM photo";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Image image = ImageMapper.mapRow(resultSet);
                images.add(image);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public static List<Image> findByProductId(Long productId) {
        List<Image> images = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM photo WHERE PRODUCT_ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Image image = ImageMapper.mapRow(resultSet);
                images.add(image);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public static Image findOneByProductIdAndPhotoURL(long id, String photoUrl) {
        Connection connection = Connect.getInstance().getConnection();
        Image image = null;
        try {
            String query = "SELECT * FROM image WHERE PRODUCT_ID = ? AND PHOTO_URL = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.setString(2, photoUrl);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                image = ImageMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return image;
    }

    public static boolean add(Image image) {
        String sql = "INSERT INTO photo(PRODUCT_ID, PHOTO_URL) VALUES(?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, image.getProductId());
            preparedStatement.setString(2, image.getUrl());
            int result =  preparedStatement.executeUpdate();
            preparedStatement.close();
            return result != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(long productId, String url) {
        String sql = "DELETE FROM image WHERE PHOTO_ID = ? AND PHOTO_URL";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, productId);
            preparedStatement.setString(2, url);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet != -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
