package mapper;

import dao.ColorDao;
import dao.ProductDao;
import dao.SizeDao;
import model.CartItem;
import model.Size;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemMapper {
    public static CartItem mapRow(ResultSet rs) throws SQLException {
        CartItem cartItem = new CartItem();
        cartItem.setCartId(rs.getLong("CART_ID"));
        cartItem.setProduct(ProductDao.findOneById(rs.getLong("PRODUCT_ID")));
        cartItem.setColor(ColorDao.findOneById(rs.getLong("COLOR_ID")));
        cartItem.setSize(SizeDao.findOneById(rs.getLong("SIZE_ID")));
        cartItem.setAmount(rs.getInt("AMOUNT"));
        return cartItem;
    }
}
