package dao;

import beans.Color;
import beans.Product;
import beans.Tag;
import mapper.ColorMapper;
import mapper.TagMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TagDao {
//	public static List<Tag> getTagList() {
//		String sql = "SELECT c.MA_CT_THE, c.TEN_THE FROM CHITIETTHE c";
//		List<Tag> brandList = new ArrayList<>();
//		Connection connection = Connect.getInstance().getConnection();
//		PreparedStatement preparedStatement=null;
//		ResultSet resultSet = null;
//		try {
//			preparedStatement = connection.prepareStatement(sql);
//			resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				Tag tag = new Tag();
//				String idTag = resultSet.getString(1);
//				String nameTag = resultSet.getString(2);
//				tag.setIdTag(idTag);
//				tag.setNameTag(nameTag);
//				tag.setNumOfProducts(countTags(idTag));
//				brandList.add(tag);
//			}
//			return brandList;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			close(preparedStatement, connection, resultSet);
//		}
//	}
//
//	public static int countTags(String idTag) {
//		Connection connection = Connect.getInstance().getConnection();
//		String sql = "SELECT count(MA_CT_THE) from the where MA_CT_THE = ?";
//		int result = 0;
//		try {
//			PreparedStatement preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, idTag);
//			ResultSet resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				result = resultSet.getInt(1);
//			}
//			resultSet.close();
//			preparedStatement.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	// get tag of product
//	public static List<Tag> getTagOfProduct(String codeProduct) {
//		String sql = "select c.ma_ct_the, c.ten_the from chitietthe c \r\n"
//				+ "left join the t on c.ma_ct_the=t.ma_ct_the where t.ma_sp=?";
//		List<Tag> brandList = new ArrayList<>();
//		Connection connection = Connect.getInstance().getConnection();
//		PreparedStatement preparedStatement= null;
//		ResultSet resultSet =null;
//		try {
//			preparedStatement = connection.prepareStatement(sql);
//			preparedStatement.setString(1, codeProduct);
//			resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				Tag tag = new Tag();
//				tag.setIdTag(resultSet.getString(1));
//				tag.setNameTag(resultSet.getString(2));
//				brandList.add(tag);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(connection, preparedStatement, resultSet);
//		}
//		return brandList;
//	}
//
//	// method help close object in SQL
//	public static void close(Object... objects) {
//		Object[] listObject = objects;
//		for (Object object : listObject) {
//			try {
//				if (object instanceof Connection && object != null) {
//					((Connection) object).close();
//				} else if (object instanceof PreparedStatement && object != null) {
//					((PreparedStatement) object).close();
//					;
//				} else if (object instanceof ResultSet && object != null) {
//					((ResultSet) object).close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}

    // new
    public static List<Tag> findAll() {
        List<Tag> tags = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT * FROM chitietthe";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Tag tag = TagMapper.mapRow(resultSet);
                tags.add(tag);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tags;
    }

    public static List<Tag> findByProduct(Product product) {
        List<Tag> tags = new ArrayList<>();
        Connection connection = Connect.getInstance().getConnection();
        try {
            String query = "SELECT chitietthe.* FROM chitietthe LEFT JOIN the ON chitietthe.MA_CT_THE = the.MA_CT_THE WHERE the.MA_SP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, product.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Tag tag = TagMapper.mapRow(resultSet);
                tags.add(tag);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tags;
    }

    public static Tag findOneById(String id) {
        Connection connection = Connect.getInstance().getConnection();
        Tag tag = null;
        try {
            String query = "SELECT * FROM chitietthe WHERE MA_CT_THE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tag = TagMapper.mapRow(resultSet);
                break;
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tag;
    }

    public static boolean add(Tag tag) {
        String sql = "INSERT INTO chitietthe(MA_CT_THE, TEN_THE) VALUES (?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, tag.getId());
            preparedStatement.setString(2, tag.getName());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean add(Product product, Tag tag) {
        String sql = "INSERT INTO the(MA_SP, MA_CT_THE) VALUES (?, ?);";
        Connection connection = Connect.getInstance().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, tag.getId());
            int resultSet = preparedStatement.executeUpdate();
            preparedStatement.close();
            return resultSet == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean update(Tag tag) {
        Connection connection = Connect.getInstance().getConnection();
        String sql = null;
        PreparedStatement prep = null;
        try {
            sql = "UPDATE chitietthe SET ten_the =? WHERE ma_ct_the =?";
            prep = connection.prepareStatement(sql);
            prep.setString(1, tag.getName());
            prep.setString(2, tag.getId());
            int res1 = prep.executeUpdate();
            prep.close();
            return res1 == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean delete(String id) {
        String sql = "DELETE FROM chitietthe WHERE ma_ct_the =?";
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
        String sql = "SELECT count(*) from chitietthe";
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
