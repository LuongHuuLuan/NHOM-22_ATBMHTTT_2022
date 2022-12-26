package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Color;
import beans.Product;
import beans.Size;
import mapper.ColorMapper;
import mapper.SizeMapper;

public class SizeDao {
//    public static List<Size> getSizeList() {
//        String sql = "SELECT S.MA_CT_KICH_THUOC, S.TEN_KICH_THUOC FROM CHITIETKICHTHUOC S";
//        List<Size> sizeList = new ArrayList<>();
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                Size size = new Size();
//                String idSize = resultSet.getString(1);
//                String nameSize = resultSet.getString(2);
//                size.setIdSize(idSize);
//                size.setNameSize(nameSize);
//                sizeList.add(size);
//            }
//            resultSet.close();
//            preparedStatement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return sizeList;
//    }
//
//    public static List<Size> getColorOfProduct(String codeProduct) {
//        String sql = "select c.ma_ct_kich_thuoc, c.ten_kich_thuoc from chitietkichthuoc c \r\n"
//        		+ "left join kichthuoc k on c.ma_ct_kich_thuoc=k.ma_ct_kich_thuoc where k.ma_sp=?";
//        List<Size> sizeList = new ArrayList<>();
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, codeProduct);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//            	  Size size = new Size();
//                  size.setIdSize(resultSet.getString("ma_ct_kich_thuoc"));
//                  size.setNameSize(resultSet.getString("ten_kich_thuoc"));
//                  sizeList.add(size);
//            }
//            resultSet.close();
//            preparedStatement.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return sizeList;
//    }

    // new
    public static List<Size> findAll() {
        List<Size> sizes = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM chitietmau";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
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

    public static List<Size> findByProduct(Product product) {
        List<Size> sizes = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT chitietkichthuoc.* FROM chitietkichthuoc LEFT JOIN kichthuoc ON chitietkichthuoc.MA_CT_KICH_THUOC = kichthuoc.MA_CT_KICH_THUOC WHERE kichthuoc.MA_SP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, product.getId());
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

    public static Size findOneById(String id) {
        Connection connection = Connect.getInstance().getConnection();
        Size size = null;
        try {
            String query = "SELECT * FROM chitietkichthuoc WHERE MA_CT_KICH_THUOC = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                size = SizeMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return size;
    }

    public static boolean add(Size size) {
        String sql = "INSERT INTO chitietkichthuoc(MA_CT_KICH_THUOC, TEN_KICH_THUOC) VALUES (?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, size.getId());
            preparedStatement.setString(2, size.getName());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean add(Product product, Size size) {
        String sql = "INSERT INTO kichthuoc(MA_SP, MA_CT_KICH_THUOC) VALUES (?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, size.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Size size) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            sql = "UPDATE chitietkichthuoc SET ten_kich_thuoc =? WHERE ma_ct_kich_thuoc =?";
            prep = connection.prepareStatement(sql);
            prep.setString(1, size.getName());
            prep.setString(2, size.getId());
            int res1 = prep.executeUpdate();
            prep.close();
            return res1 == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(String id) {
        String sql = "DELETE FROM chitietkichthuoc WHERE ma_ct_kich_thuoc =?";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int count() {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "SELECT count(*) from chitietkichthuoc";
        int result = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
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
}
