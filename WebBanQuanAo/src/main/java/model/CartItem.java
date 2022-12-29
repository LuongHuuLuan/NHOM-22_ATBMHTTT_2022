package model;

import java.io.Serializable;
import java.util.Objects;

public class CartItem implements Serializable {
    private long cartId;
    private Product product;
    private Color color;
    private Size size;
    private int amount;

    public long getCartId() {
        return cartId;
    }

    public void setCartId(long cartId) {
        this.cartId = cartId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartItem cartItem = (CartItem) o;
        return cartId == cartItem.cartId && amount == cartItem.amount && Objects.equals(product, cartItem.product) && Objects.equals(color, cartItem.color) && Objects.equals(size, cartItem.size);
    }
}
