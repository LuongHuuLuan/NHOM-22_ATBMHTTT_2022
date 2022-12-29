package Services;

import model.Order;
import dao.OrderDao;

import java.util.List;

public class OrderServices {

    public static List<Order> getAll() {
//        return OrderDao.getAllOrder();
        return null;
    }

    public static  boolean deleteOrder(int id) {
//        return OrderDao.deleteOrder(id);
        return false;
    }

    public static  boolean updateStatus(int id, String status) {
//        return OrderDao.updateStatus(id, status);
        return false;
    }

}
