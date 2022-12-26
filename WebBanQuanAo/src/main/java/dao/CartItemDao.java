package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartItemDao {
    public static boolean delete(int id) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            sql = "DELETE FROM CHITIETGIO WHERE MA_GIO = ?";
            prep = connection.prepareStatement(sql);
            prep.setInt(1, id);
            int res = prep.executeUpdate();
            return res != -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
