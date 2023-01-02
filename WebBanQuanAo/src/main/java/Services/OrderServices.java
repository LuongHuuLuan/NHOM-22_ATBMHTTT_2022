package Services;

import dao.OrderItemDao;
import model.*;
import dao.OrderDao;

import java.util.ArrayList;
import java.util.List;

public class OrderServices {

    public static long add(Order order) {
        long orderId = OrderDao.add(order);
        return orderId;
    }

    public static long add(Account account, Cart cart, String recipient, String phone, String address) {
        Order order = new Order();
        order.setAccount(account);
        order.setRecipient(recipient);
        order.setOrderPhone(phone);
        order.setOrderAddress(address);
        long orderId = OrderServices.add(order);
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setColor(cartItem.getColor());
            orderItem.setSize(cartItem.getSize());
            orderItem.setPrice(cartItem.getProduct().getPrice());
            orderItem.setDiscount(cartItem.getProduct().getDiscount());
            orderItem.setAmount(cartItem.getAmount());
            OrderItemDao.add(orderItem);
        }
        return orderId;
    }

    public static Order getOrder(long id) {
        return OrderDao.findOneById(id);
    }

    public static List<Order> getAll() {
        return OrderDao.findAll();
    }

    public static boolean deleteOrder(long id) {
        return OrderDao.delete(id);
    }

    public static boolean updateStatus(long id, String status) {
        return false;
    }

}
