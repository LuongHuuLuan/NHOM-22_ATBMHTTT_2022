package controller;

import Services.AccountServices;
import Services.HashService;
import beans.Account;

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
                AccountServices.updateAccount(account.getUserID() + "", lastName, firstName, sdt, email, address, account.getUserName());
                account.setLastName(lastName);
                account.setFirstName(firstName);
                account.setEmail(email);
                account.setPhoneNumber(sdt);
                account.setAddress(address);
            } else if (type.equals("changePass")) {
                String password = request.getParameter("password");
                String newPass = request.getParameter("newpass");
                String hashPass = HashService.getHash(password);
                if(hashPass.equals(account.getPassWord())) {
                    AccountServices.updateAccount(account.getUserID()+"", HashService.getHash(newPass));
                }
            }
        }
        response.sendRedirect("my-account");
    }
}
