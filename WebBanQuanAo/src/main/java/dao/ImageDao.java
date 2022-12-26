package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Image;
import beans.Product;
import beans.Size;
import mapper.ImageMapper;
import mapper.SizeMapper;

public class ImageDao {
//	public static List<Image> getImagesOfProduct(String codeProduct) {
//		String sql = "select h.ma_ct_mau, h.duong_dan_anh from hinhanh h where h.ma_sp=?";
//		List<Image> imageList = new ArrayList<>();
//		Connection connection = Connect.getInstance().getConnection();
//		try {
//			PreparedStatement preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, codeProduct);
//			ResultSet resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				Image image = new Image();
////				image.setColorCode(resultSet.getString("ma_ct_mau"));
////				image.setPathImage(resultSet.getString("duong_dan_anh"));
//				imageList.add(image);
//			}
//			resultSet.close();
//			preparedStatement.close();
//			connection.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return imageList;
//
//	}
//
//	public static String updateImageDetailProduct(String codeProduct, String codeColor, String pathImg, String oldPath) {
//		String sql = "UPDATE HINHANH SET MA_CT_MAU=?, DUONG_DAN_ANH=? WHERE MA_SP=? AND DUONG_DAN_ANH=?";
//		Connection connection = Connect.getInstance().getConnection();
//		PreparedStatement preparedStatement = null;
//		try {
//			connection.setAutoCommit(false);
//			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, codeColor);
//			preparedStatement.setString(2, pathImg);
//			preparedStatement.setString(3, codeProduct);
//			preparedStatement.setString(4, oldPath);
//			int rowEffects = preparedStatement.executeUpdate();
//			if (rowEffects > 0) {
//				connection.commit();
//				return "Cập nhật thành công";
//			}
//			return "Cập nhật thất bại";
//		} catch (SQLException e) {
//			return "Lỗi khi thực thi";
//		}
//	}

    // new

    public static List<Image> findByProduct(Product product) {
        Connection connection = Connect.getInstance().getConnection();
        List<Image> images = new ArrayList<>();
        try {
            String query = "SELECT * FROM hinhanh WHERE MA_SP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, product.getId());
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

    public static boolean add(Image image) {
        String sql = "INSERT INTO hinhanh(MA_SP, MA_CT_MAU, DUONG_DAN_ANH) VALUES (?, ?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, image.getProduct().getId());
            preparedStatement.setString(2, image.getColor().getId());
            preparedStatement.setString(3, image.getUrl());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Image image) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            sql = "UPDATE hinhanh SET DUONG_DAN_ANH = ? WHERE MA_SP = ? AND MA_CT_MAU = ?";
            prep = connection.prepareStatement(sql);
            prep.setString(1, image.getUrl());
            prep.setString(2, image.getProduct().getId());
            prep.setString(3, image.getColor().getId());
            int res1 = prep.executeUpdate();
            prep.close();
            return res1 == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(String productID, String colorId) {
        String sql = "DELETE FROM hinhanh WHERE MA_SP = ? AND MA_CT_MAU = ?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
