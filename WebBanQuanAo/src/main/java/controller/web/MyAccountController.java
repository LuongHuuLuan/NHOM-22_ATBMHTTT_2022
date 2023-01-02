package controller.web;

import Services.AccountServices;
import Services.LoginService;
import Services.SignService;
import model.Account;
import model.Sign;
import util.MySignature;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "myAccountController", value = "/my-account")
@MultipartConfig()
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
            } else if (type.equals("updateSign")) {
                Part part = request.getPart("sign");
                String readPath = request.getServletContext().getRealPath("/orders/upload");
                String fileName = UUID.randomUUID().toString() + ".json";
                File folder = new File(readPath);
                if (!folder.exists()) {
                    folder.mkdir();
                }
                part.write(readPath + "/" + fileName);
                MySignature mySignature = new MySignature(readPath + "/" + fileName);
                Sign sign = SignService.getSignWithAccountAndIsActive(account, true);
                if (sign != null) {
                    sign.setActive(false);
                    SignService.update(sign);
                    sign.setSign(mySignature.getPublicKey());
                    sign.setActive(true);
                    SignService.add(sign);
                } else {
                    sign = new Sign();
                    sign.setAccount(account);
                    sign.setSign(mySignature.getPublicKey());
                    sign.setActive(true);
                    SignService.add(sign);
                }
                mySignature.delete();
                request.setAttribute("message", "Đã cập nhật chữ ký");
            }
        } else {
            request.setAttribute("message", "Vui lòng đăng nhập");
        }
        session.setAttribute("account", account);
        doGet(request, response);
    }
}
