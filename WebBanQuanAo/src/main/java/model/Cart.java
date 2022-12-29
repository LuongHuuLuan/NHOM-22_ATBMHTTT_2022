package model;

import java.io.Serializable;
import java.util.List;

public class Cart extends ModelParent implements Serializable {
   private Account account;
   private List<CartItem> cartItems;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
}
