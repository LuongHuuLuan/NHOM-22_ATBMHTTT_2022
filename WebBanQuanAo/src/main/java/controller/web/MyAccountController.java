package controller.web;

import Services.AccountServices;
import Services.LoginService;
import model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "myAccountController", value = "/my-account")
public class MyAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService.login(request, response);
        request.setAttribute("pageName", "Tài khoản");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/myAccount.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            String type = request.getParameter("type");
            if (type.equals("updateAccount")) {
                String lastName = request.getParameter("lastname");
                String firstName = request.getParameter("firstname");
                String email = request.getParameter("email");
                String sdt = request.getParameter("sdt");
                String address = request.getParameter("address");

                account.setLastName(lastName);
                account.setFirstName(firstName);
                account.setEmail(email);
                account.setPhone(sdt);
                account.setAddress(address);
                if (AccountServices.update(account, false)) {
                    request.setAttribute("message", "Cập nhật thành công");
                }
            } else if (type.equals("changePass")) {
                String password = request.getParameter("password");
                String newPass = request.getParameter("newpass");

                Account accountWithNewPass = AccountServices.getAccount(account.getUsername(), password, true);
                if (account != null) {
                    if (accountWithNewPass == null) {
                        request.setAttribute("message", "Sai mật khẩu");
                    } else {
                        accountWithNewPass.setPassword(newPass);
                        if (AccountServices.update(accountWithNewPass, true)) {
                            request.setAttribute("message", "Cập nhật thành công");
                        }
                    }
                }
            }
        } else {
            request.setAttribute("message", "Vui lòng đăng nhập");
        }
        session.setAttribute("account", account);
        doGet(request, response);
    }
}
