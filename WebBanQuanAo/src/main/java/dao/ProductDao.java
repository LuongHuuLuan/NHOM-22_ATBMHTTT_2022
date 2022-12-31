package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import mapper.ProductMapper;
import page.Pageable;
import sort.SortProduct;

public class ProductDao {

    // new
    public static List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM product";
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
            if (sortProduct.getColor() == null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                query = "SELECT product.* FROM product WHERE BRAND_ID = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() == null) {
                query = "SELECT PRODUCT.* FROM product WHERE product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                query = "SELECT product.* FROM product WHERE CATEGORY_ID = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() != null) {
                query = "SELECT product.* FROM product WHERE CATEGORY_ID = ? AND BRAND_ID = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                query = "SELECT PRODUCT.* FROM product WHERE product.BRAND_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                query = "SELECT PRODUCT.* FROM product WHERE product.CATEGORY_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getCategory() != null) {
                query = "SELECT PRODUCT.* FROM product WHERE product.BRAND_ID = ? AND product.CATEGORY_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else {
                query = "SELECT  * FROM product";
            }
            if (pageable.getSortProduct().getOrderType() != null) {
                query += " ORDER BY product.price " + pageable.getSortProduct().getOrderType() + " LIMIT " + (pageable.getPage() - 1) + ", " + pageable.getMaxItem();
            } else {
                query += " LIMIT " + (pageable.getPage() - 1) + ", " + pageable.getMaxItem();
            }
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            if (sortProduct.getColor() == null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getColor().getId());
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
                preparedStatement.setLong(2, sortProduct.getBrand().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
                preparedStatement.setLong(2, sortProduct.getColor().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
                preparedStatement.setLong(2, sortProduct.getColor().getId());
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getCategory() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
                preparedStatement.setLong(2, sortProduct.getCategory().getId());
                preparedStatement.setLong(3, sortProduct.getColor().getId());
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

    public static Product findOneById(long id) {
        Connection connection = Connect.getInstance().getConnection();
        Product product = null;
        try {
            String query = "SELECT * FROM product WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
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

    public static Product findOneByCode(String code) {
        Connection connection = Connect.getInstance().getConnection();
        Product product = null;
        try {
            String query = "SELECT * FROM product WHERE CODE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, code);
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

//    public static boolean add(Product product) {
//        String sql = "insert into sanpham (ma_sp, ten_sp, ma_nhan_hieu, gia, mo_ta, hinh_nho, nguoi_them) values (?, ?,?, ?, ?, ?, ?)";
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, product.getId());
//            preparedStatement.setString(2, product.getName());
//            preparedStatement.setString(3, product.getBrand().getId());
//            preparedStatement.setDouble(4, product.getPrice());
//            preparedStatement.setString(5, product.getDescription());
//            preparedStatement.setString(6, product.getThumbnail());
//            preparedStatement.setString(7, product.getCreateBy());
//            for (Size size : product.getSizes()) {
//                SizeDao.add(product, size);
//            }
//            for (Tag tag : product.getTags()) {
//                CategoryDao.add(product, tag);
//            }
//            for (Color color : product.getColors()) {
//                ColorDao.add(product, color);
//            }
//            int resultSet = preparedStatement.executeUpdate();
//            preparedStatement.close();
//            return resultSet == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    public static boolean update(Product product) {
//        Connection connection = Connect.getInstance().getConnection();
//        String sql = null;
//        PreparedStatement prep = null;
//        try {
//            sql = "UPDATE SANPHAM SET TEN_SP = ?, MA_NHAN_HIEU = ?, GIA = ?, MO_TA = ?, HINH_NHO = ?, TONG_DANH_GIA =?, TONG_SAO = ?, SO_LUONG = ? WHERE MA_SP = ? ";
//            prep = connection.prepareStatement(sql);
//            prep.setString(1, product.getName());
//            prep.setString(2, product.getBrand().getId());
//            prep.setDouble(3, product.getPrice());
//            prep.setString(4, product.getDescription());
//            prep.setString(5, product.getThumbnail());
//            prep.setInt(6, product.getTotalReviews());
//            prep.setInt(7, product.getTotalStar());
//            prep.setInt(8, product.getAmount());
//            int res1 = prep.executeUpdate();
//            prep.close();
//            return res1 == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public static boolean delete(long id) {
//        String sql = "DELETE FROM product WHERE ma_ct_kich_thuoc = ?";
//        Connection connection = Connect.getInstance().getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, id);
//            int resultSet = preparedStatement.executeUpdate();
//            preparedStatement.close();
//            return resultSet == 1;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

    public static int count() {
        Connection connection = Connect.getInstance().getConnection();
        String sql = "SELECT count(product.ID) from product";
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
            if (sortProduct.getColor() == null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                query = "SELECT count(product.ID) FROM product WHERE BRAND_ID = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() == null) {
                query = "SELECT count(product.ID) FROM product WHERE product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                query = "SELECT count(product.ID) FROM product WHERE CATEGORY_ID = ?";
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() != null) {
                query = "SELECT count(product.ID) FROM product WHERE CATEGORY_ID = ? AND BRAND_ID = ?";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                query = "SELECT count(product.ID) FROM product WHERE product.BRAND_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                query = "SELECT count(product.ID) FROM product WHERE product.CATEGORY_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getCategory() != null) {
                query = "SELECT count(product.ID) FROM product WHERE product.BRAND_ID = ? AND product.CATEGORY_ID = ? AND product.ID IN (SELECT DISTINCT warehouse.PRODUCT_ID FROM warehouse WHERE warehouse.COLOR_ID = ?)";
            } else {
                query = "SELECT count(product.ID) FROM product";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            if (sortProduct.getColor() == null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getColor().getId());
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
            } else if (sortProduct.getColor() == null && sortProduct.getCategory() != null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
                preparedStatement.setLong(2, sortProduct.getBrand().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() == null && sortProduct.getBrand() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
                preparedStatement.setLong(2, sortProduct.getColor().getId());
            } else if (sortProduct.getColor() != null && sortProduct.getCategory() != null && sortProduct.getBrand() == null) {
                preparedStatement.setLong(1, sortProduct.getCategory().getId());
                preparedStatement.setLong(2, sortProduct.getColor().getId());
            } else if (sortProduct.getBrand() != null && sortProduct.getColor() != null && sortProduct.getCategory() != null) {
                preparedStatement.setLong(1, sortProduct.getBrand().getId());
                preparedStatement.setLong(2, sortProduct.getCategory().getId());
                preparedStatement.setLong(3, sortProduct.getColor().getId());
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
