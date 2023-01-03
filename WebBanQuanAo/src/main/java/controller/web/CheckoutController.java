package controller.web;

import Services.LoginService;
import Services.OrderServices;
import Services.StatusService;
import model.*;
import Services.CartService;
import util.CreatePDFOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "checkoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Cart cart = (Cart) session.getAttribute("cart");
        request.setAttribute("totalCart", CartService.totalCart(cart));
        request.setAttribute("pageName", "Thanh toán");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/checkout.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String recipient = request.getParameter("fullname");
        String phone = request.getParameter("sdt");
        String address = request.getParameter("address");
        String base = request.getServletContext().getContextPath();

        Cart cart = CartService.getCart(account);
        File file = new File(request.getServletContext().getRealPath("orders/download"));
        if (!file.exists()) {
            file.mkdir();
        }
        if (cart.getCartItems().isEmpty()) {
            request.setAttribute("message", "Giỏ hàng rỗng");
        } else {
            Order order = OrderServices.getOrderByAccountAndStatus(account, StatusService.getStatusByName("WAIT"));
            if (order != null) {
                order.setStatus(StatusService.getStatusByName("CANCEL"));
                OrderServices.updateStatus(order);
                File oldOrder = new File(request.getServletContext().getRealPath("/orders/download/order-" + order.getId() + ".pdf"));
                oldOrder.delete();
            }
            long orderId = OrderServices.add(account, cart, recipient, phone, address);
            order = OrderServices.getOrder(orderId);
            CreatePDFOrder createPDFOrder = new CreatePDFOrder("order-" + orderId, order);
            createPDFOrder.setRootFolder(request.getServletContext().getRealPath(base));
//            CreatePDFOrder createPDFOrder = new CreatePDFOrder(request.getServletContext().getRealPath("/"), request.getServletContext().getRealPath("/orders/download/order-" + order.getId() + ".pdf"), request.getServletContext().getRealPath("/assets/fonts/ARIALUNI.TTF"), order);
            createPDFOrder.createPdf();
            response.sendRedirect("sign?id=" + orderId);
        }
    }
}
