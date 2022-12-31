package controller.web;

import Services.LoginService;
import Services.RegisterService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "confirmController", value = "/confirm")
public class ConfirmController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService.login(request, response);
        long id = Long.parseLong(request.getParameter("id"));
        String token = request.getParameter("token");
        boolean confirm = RegisterService.confirmRegister(id, token);
        String message = "";
        String href = "";
        String hrefName = "";
        if(confirm) {
            message = "Chúc mừng bạn đăng ký thành công, ";
            href = "login";
            hrefName = "Đăng nhập ngay";
        } else {
            message = "Link sai hoặc quá hạn, ";
            href = "register";
            hrefName = "Đăng ký ngay";
        }
        request.setAttribute("message", message);
        request.setAttribute("href", href);
        request.setAttribute("hrefName", hrefName);
        request.setAttribute("pageName", "Thông báo");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/notification.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
