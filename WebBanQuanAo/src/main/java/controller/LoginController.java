package controller;

import Services.CartService;
import Services.LoginService;
import model.Account;
import Services.AccountServices;
import model.Cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "loginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Account account = (Account) session.getAttribute("account");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        if (account == null) {
            Cookie[] cookies = request.getCookies();
            String reLoginToken = "";
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("WBHReLoginToken")) {
                    reLoginToken = cookie.getValue();
                    break;
                }
            }
            if (reLoginToken.length() != 0) {
                account = AccountServices.reLogin(reLoginToken);
                Cookie cookieReLogin = new Cookie("WBHReLoginToken", account.getReLoginToken());
                cookieReLogin.setMaxAge(60 * 60 * 24);
                response.addCookie(cookieReLogin);
            }
        }
        if (account == null) {
            request.setAttribute("pageName", "Đăng nhập");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
            rd.forward(request, response);
        } else {
            Cart cart = CartService.getCart(account);
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
            if (account.getRole().getCode().equalsIgnoreCase("admin")) {
                response.sendRedirect("admin-dash-board");
            } else {
                response.sendRedirect("home");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberme");
        Account account = AccountServices.getAccount(userName, password, true);
        if (account == null) {
            request.setAttribute("userName", userName);
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            doGet(request, response);
        } else {
            Cart cart = CartService.getCart(account);
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
            if (rememberMe != null) {
                if (account.getReLoginToken() == null) {
                    String token = UUID.randomUUID().toString();
                    account.setReLoginToken(token);
                    AccountServices.update(account, false);
                }
                Cookie reLoginToken = new Cookie("WBHReLoginToken", account.getReLoginToken());
                reLoginToken.setMaxAge(60 * 60 * 24);
                response.addCookie(reLoginToken);
            }
            if (account.getRole().equals("ADMIN")) {
                response.sendRedirect("admin-dash-board");
            } else {
                response.sendRedirect("home");
            }
        }
    }
}
