package Services;

import model.Order;
import dao.OrderDao;

import java.util.List;

public class OrderServices {

    public static boolean add(Order order) {
        long orderId = OrderDao.add(order);
        return orderId != -1;
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
