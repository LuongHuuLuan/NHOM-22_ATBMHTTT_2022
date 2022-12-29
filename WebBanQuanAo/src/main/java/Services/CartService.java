package Services;

import dao.CartItemDao;
import model.Account;
import model.Cart;
import model.CartItem;
import dao.CartDao;

import java.util.List;

public class CartService {
    public static Cart getCart(Account account) {
        Cart cart = CartDao.findOneByAccount(account);
        if (cart == null) {
            cart = new Cart();
            cart.setAccount(account);
            long idCart = CartDao.add(cart);
            cart = CartDao.findOneById(idCart);
        }
        return cart;
    }

    public static int addItem(CartItem item) {
        CartItem existItem = CartItemDao.findByProductIdAndColorIdAndSizeId(item.getProduct().getId(), item.getColor().getId(), item.getSize().getId());
        if (existItem == null) {
            CartItemDao.add(item);
            return 0;
        } else {
            existItem.setAmount(existItem.getAmount() + item.getAmount());
            CartItemDao.update(existItem);
            return 1;
        }
    }

    public static boolean deleteItem(CartItem item) {
        return CartItemDao.delete(item);
    }

    public static  boolean updateItem(CartItem item) {
        // check sp trong kho k du thi k update
        CartItem existItem = CartItemDao.findByProductIdAndColorIdAndSizeId(item.getProduct().getId(), item.getColor().getId(), item.getSize().getId());
        existItem.setAmount(item.getAmount());
        return  CartItemDao.update(existItem);
    }

}
