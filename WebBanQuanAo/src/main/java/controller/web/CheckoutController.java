package controller.web;

import Services.LoginService;
import Services.OrderServices;
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
        if (cart.getCartItems().isEmpty()) {
            request.setAttribute("message", "Giỏ hàng rỗng");
        } else {
            long orderId = OrderServices.add(account, cart, recipient, phone, address);
            Order order = OrderServices.getOrder(orderId);
            CreatePDFOrder createPDFOrder = new CreatePDFOrder("order-" + orderId, order);
            createPDFOrder.setRootFolder(request.getServletContext().getRealPath(base));
            createPDFOrder.createPdf();
            response.sendRedirect("sign?id=" + orderId);
        }
    }
}
