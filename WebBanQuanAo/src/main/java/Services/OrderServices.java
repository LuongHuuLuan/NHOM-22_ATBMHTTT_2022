package Services;

import beans.Account;
import beans.Order;
import dao.AccountDao;
import dao.OrderDao;

import java.util.ArrayList;
import java.util.List;

public class OrderServices {

    public static List<Order> getAll() {
        return OrderDao.getAllOrder();
    }

    public static  boolean deleteOrder(int id) {
        return OrderDao.deleteOrder(id);
    }

    public static  boolean updateStatus(int id, String status) {
        return OrderDao.updateStatus(id, status);
    }

}
