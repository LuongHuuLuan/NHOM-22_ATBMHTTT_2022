package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import beans.Color;
import beans.Image;
import beans.Product;
import beans.ProductNew;
import beans.Size;
import beans.Tag;
import mapper.ProductMapper;
import mapper.SizeMapper;
import object_reponse.InfoDelete;
import page.Pageable;
import sort.SortProduct;

public class ProductDao {

    // new
    public static List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM sanpham";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = ProductMapper.mapRow(resultSet);
                products.add(product);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static List<Product> findAll(Pageable pageable) {
        List<Product> products = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "";
            SortProduct sortProduct = pageable.getSortProduct();
            if (sortProduct.getColor() == null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                query = "SELECT sanpham.* FROM sanpham WHERE MA_NHAN_HIEU = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() == null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU WHERE mau.MA_CT_MAU = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE WHERE the.MA_CT_THE = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() != null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE WHERE sanpham.MA_NHAN_HIEU = ? AND the.MA_CT_THE = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU WHERE sanpham.MA_NHAN_HIEU = ? AND mau.MA_CT_MAU = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN (mau LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU) ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN (the LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE) ON sanpham.MA_SP = the.MA_SP WHERE chitietmau.MA_CT_MAU = ? AND chitietthe.MA_CT_THE = ?";
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getType() != null) {
                query = "SELECT sanpham.* FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP WHERE sanpham.MA_NHAN_HIEU = ? AND the.MA_CT_THE = ? AND mau.MA_CT_MAU = ?";
            } else {
                query = "SELECT  * FROM sanpham";
            }
            if (pageable.getSortProduct().getOrderType() != null) {
                query += " ORDER BY sanpham.gia " + pageable.getSortProduct().getOrderType() + " LIMIT " + (pageable.getPage() - 1) + ", " + pageable.getMaxItem();
            } else {
                query += " LIMIT " + (pageable.getPage() - 1) + ", " + pageable.getMaxItem();
            }
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            if (sortProduct.getColor() == null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getColor());
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getType());
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getType());
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getColor());
            } else if (sortProduct.getColor() != null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getColor());
                preparedStatement.setString(2, sortProduct.getType());
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getType() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getType());
                preparedStatement.setString(3, sortProduct.getColor());
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = ProductMapper.mapRow(resultSet);
                products.add(product);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static Product findOneById(String id) {
        Connection connection = Connect.getInstance().getConnection();
        Product product = null;
        try {
            String query = "SELECT * FROM sanpham WHERE MA_SP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                product = ProductMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public static boolean add(Product product) {
        String sql = "insert into sanpham (ma_sp, ten_sp, ma_nhan_hieu, gia, mo_ta, hinh_nho, nguoi_them) values (?, ?,?, ?, ?, ?, ?)";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getBrand().getId());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getThumbnail());
            preparedStatement.setString(7, product.getCreateBy());
            for (Size size : product.getSizes()) {
                SizeDao.add(product, size);
            }
            for (Tag tag : product.getTags()) {
                TagDao.add(product, tag);
            }
            for (Color color : product.getColors()) {
                ColorDao.add(product, color);
            }
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Product product) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            sql = "UPDATE SANPHAM SET TEN_SP = ?, MA_NHAN_HIEU = ?, GIA = ?, MO_TA = ?, HINH_NHO = ?, TONG_DANH_GIA =?, TONG_SAO = ?, SO_LUONG = ? WHERE MA_SP = ? ";
            prep = connection.prepareStatement(sql);
            prep.setString(1, product.getName());
            prep.setString(2, product.getBrand().getId());
            prep.setDouble(3, product.getPrice());
            prep.setString(4, product.getDescription());
            prep.setString(5, product.getThumbnail());
            prep.setInt(6, product.getTotalReviews());
            prep.setInt(7, product.getTotalStar());
            prep.setInt(8, product.getAmount());
            int res1 = prep.executeUpdate();
            prep.close();
            return res1 == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(String id) {
        String sql = "DELETE FROM chitietkichthuoc WHERE ma_ct_kich_thuoc = ?";
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
        String sql = "SELECT count(*) from sanpham";
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

    public static int count(Pageable pageable) {
        Connection connection = Connect.getInstance().getConnection();
        int result = 0;
        try {
            String query = "";
            SortProduct sortProduct = pageable.getSortProduct();
            if (sortProduct.getColor() == null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                query = "SELECT count(sanpham.ma_sp) FROM sanpham WHERE MA_NHAN_HIEU = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() == null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU WHERE mau.MA_CT_MAU = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE WHERE the.MA_CT_THE = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() != null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE WHERE sanpham.MA_NHAN_HIEU = ? AND the.MA_CT_THE = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU WHERE sanpham.MA_NHAN_HIEU = ? AND mau.MA_CT_MAU = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN (mau LEFT JOIN chitietmau ON mau.MA_CT_MAU = chitietmau.MA_CT_MAU) ON sanpham.MA_SP = mau.MA_SP) LEFT JOIN (the LEFT JOIN chitietthe ON the.MA_CT_THE = chitietthe.MA_CT_THE) ON sanpham.MA_SP = the.MA_SP WHERE chitietmau.MA_CT_MAU = ? AND chitietthe.MA_CT_THE = ?";
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getType() != null) {
                query = "SELECT count(sanpham.ma_sp) FROM (sanpham LEFT JOIN the ON sanpham.MA_SP = the.MA_SP) LEFT JOIN mau ON sanpham.MA_SP = mau.MA_SP WHERE sanpham.MA_NHAN_HIEU = ? AND the.MA_CT_THE = ? AND mau.MA_CT_MAU = ?";
            } else {
                query = "SELECT count(sanpham.ma_sp) FROM sanpham";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            if (sortProduct.getColor() == null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getColor());
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getType());
            } else if (sortProduct.getColor() == null && sortProduct.getType() != null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getType());
            } else if (sortProduct.getColor() != null && sortProduct.getType() == null && sortProduct.getBrand() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getColor());
            } else if (sortProduct.getColor() != null && sortProduct.getType() != null && sortProduct.getBrand() == null) {
                preparedStatement.setString(1, sortProduct.getColor());
                preparedStatement.setString(2, sortProduct.getType());
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getType() != null) {
                preparedStatement.setString(1, sortProduct.getBrand());
                preparedStatement.setString(2, sortProduct.getType());
                preparedStatement.setString(3, sortProduct.getColor());
            }
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
