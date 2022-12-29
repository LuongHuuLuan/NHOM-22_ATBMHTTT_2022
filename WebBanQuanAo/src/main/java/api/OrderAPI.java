package api;

import Services.OrderServices;
import model.Order;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrderAPI", value = "/api/order")
@MultipartConfig
public class OrderAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<Order> orders = OrderServices.getAll();
        Gson gson = new Gson();
        String ordersToJson = gson.toJson(orders);
        PrintWriter pw = response.getWriter();
        pw.println(ordersToJson);
        pw.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        boolean result = false;
        switch (type) {
            case "delete":
                result = OrderServices.deleteOrder(orderID);
                break;
            case "updateStatus":
                String status = request.getParameter("status");
                result = OrderServices.updateStatus(orderID, status);
                break;
            default:
                break;
        }
        PrintWriter pw = response.getWriter();
        pw.println(result);
        pw.flush();
    }
}
