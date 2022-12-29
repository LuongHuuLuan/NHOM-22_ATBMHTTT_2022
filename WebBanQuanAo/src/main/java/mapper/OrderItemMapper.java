package mapper;

import dao.ColorDao;
import dao.ProductDao;
import dao.SizeDao;
import model.OrderItem;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderItemMapper {
    public static OrderItem mapRow(ResultSet rs) throws SQLException {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderId(rs.getLong("ORDER_ID"));
        orderItem.setProduct(ProductDao.findOneById(rs.getLong("PRODUCT_ID")));
        orderItem.setColor(ColorDao.findOneById(rs.getLong("COLOR_ID")));
        orderItem.setSize(SizeDao.findOneById(rs.getLong("SIZE_ID")));
        orderItem.setAmount(rs.getInt("AMOUNT"));
        orderItem.setPrice(rs.getDouble("PRICE"));
        orderItem.setDiscount(rs.getInt("DISCOUNT"));
        return orderItem;
    }
}
