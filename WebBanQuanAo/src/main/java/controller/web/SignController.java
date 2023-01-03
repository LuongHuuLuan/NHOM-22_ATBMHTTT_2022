package controller.web;

import Services.*;
import model.*;
import util.FileUtil;
import util.VerifySign;

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
        Order order = OrderServices.getOrder(orderId);
        if (order.getStatus().getName().equals("WAIT")) {
            String base = request.getServletContext().getContextPath();
            String orderUrl = base + "\\orders\\download\\order-" + orderId + ".pdf";
            request.setAttribute("orderId", orderId);
            request.setAttribute("fileName", "order-" + orderId + ".pdf");
            request.setAttribute("orderUrl", orderUrl);
            request.setAttribute("totalCart", CartService.totalCart(cart));
            request.setAttribute("pageName", "Ký hóa đơn");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/sign.jsp");
            rd.forward(request, response);
        } else {
            String message = "";
            if (order.getStatus().getName().equals("CANCEL")) {
                message = "Hóa đơn không tồn tại";
            } else {
                message = "Hóa đơn đã được ký";
            }
            request.setAttribute("message", message);
            request.setAttribute("pageName", "Thông báo");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/notification.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        Sign sign = SignService.getSignWithAccountAndIsActive(account, true);

        long orderId = Long.parseLong(request.getParameter("orderId"));
        Part orderPdf = request.getPart("order-pdf");
        String readPath = request.getServletContext().getRealPath("/orders/upload");
        String fileName = "order-" + orderId + ".pdf";

        String message = "";
        // neu chua co chu ky
        if (sign == null) {
            message = "Bạn chưa có chữ ký hãy vào phần tài khoản để cập nhật chữ ký";
        } else {
            File folder = new File(readPath);
            if (!folder.exists()) {
                folder.mkdir();
            }
            orderPdf.write(readPath + "/" + fileName);
            FileUtil.copyFile(readPath + "/" + fileName, "E:\\GocHocTap\\intellij\\Antoanbaomathttt\\WebBanQuanAo\\src\\main\\webapp\\orders\\upload\\order-" + orderId + ".pdf", false);

            String orderNoSignUrl = request.getServletContext().getRealPath("/orders/download/order-" + orderId + ".pdf");
            String orderSignUrl = readPath + "/" + fileName;

            try {
                VerifySign verifySign = new VerifySign(orderNoSignUrl, orderSignUrl, sign);
                if (verifySign.isValid()) {
                    Verification verification = new Verification();
                    verification.setOrder(OrderServices.getOrder(orderId));
                    verification.setHashValue(verifySign.getHashOrderNoSign());
                    verification.setSign(sign);
                    verification.setOK(true);
                    VerificationService.add(verification);
                    CartService.clear(cart);
                    Order order = OrderServices.getOrder(orderId);
                    order.setStatus(StatusService.getStatusByName("VERIFY"));
                    OrderServices.updateStatus(order);
                    cart = CartService.getCart(account);
                    session.setAttribute("cart", cart);
                    message = "Thanh toán thành công";
                } else {
                    message = "Thanh toán thất bại chữ ký không đúng";
                }
            } catch (Exception e) {
                message = "Chữ ký sai không thể xác thực";
            }
        }
        request.setAttribute("message", message);
        request.setAttribute("pageName", "Thông báo");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/notification.jsp");
        rd.forward(request, response);
    }
}
