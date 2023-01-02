package controller.web;

import Services.CartService;
import Services.LoginService;
import model.Cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "SignController", value = "/sign")
@MultipartConfig()
public class SignController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Cart cart = (Cart) session.getAttribute("cart");

        long orderId = Long.parseLong(request.getParameter("id"));
        String base = request.getServletContext().getContextPath();
        String orderUrl = base + "\\orders\\download\\order-" + orderId + ".pdf";

        request.setAttribute("orderId", orderId);
        request.setAttribute("fileName", "order-" + orderId + ".pdf");
        request.setAttribute("orderUrl", orderUrl);
        request.setAttribute("totalCart", CartService.totalCart(cart));
        request.setAttribute("pageName", "Ký hóa đơn");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/sign.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long orderId = Long.parseLong(request.getParameter("orderId"));
        Part orderPdf = request.getPart("order-pdf");
        String readPath = request.getServletContext().getRealPath("/orders/upload");
        String fileName = "order-" + orderId + ".pdf";
        File folder = new File(readPath);
        if (!folder.exists()) {
            folder.mkdir();
        }
        orderPdf.write(readPath + "/" + fileName);

        orderPdf.write("E:\\GocHocTap\\intellij\\Antoanbaomathttt\\WebBanQuanAo\\src\\main\\webapp\\orders\\" + fileName);
    }
}
