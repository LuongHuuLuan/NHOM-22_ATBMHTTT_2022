package dao;

import beans.Role;
import mapper.RoleMapper;

import java.sql.*;

public class RoleDao {
    public static Role findOneById(String id) {
        Role role = null;
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM vaitro WHERE ma_vai_tro = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                role = RoleMapper.mapRow(resultSet);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }
}
