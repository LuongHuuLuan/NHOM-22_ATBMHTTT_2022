package mapper;

import dao.*;
import model.Cart;
import model.Order;
import model.OrderItem;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper {
    public static Order mapRow(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getLong("ID"));
        order.setAccount(AccountDao.findOneById(rs.getLong("ACCOUNT_ID")));
        order.setRecipient(rs.getString("RECIPIENT"));
        order.setOrderPhone(rs.getString("ORDERS_PHONE"));
        order.setOrderAddress(rs.getString("ORDERS_ADDRESS"));
        order.setStatus(StatusDao.findOneById(rs.getLong("STATUS_ID")));
        order.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
        order.setCreatedBy(rs.getString("CREATED_BY"));
        order.setModifiedDate(rs.getTimestamp("MODIFIED_DATE"));
        order.setModifiedBy(rs.getString("MODIFIED_BY"));
        order.setItems(OrderItemDao.findById(order.getId()));
        return order;
    }
}
