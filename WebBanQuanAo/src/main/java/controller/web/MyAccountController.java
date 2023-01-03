package controller.web;

import Services.AccountServices;
import Services.LoginService;
import Services.SignService;
import model.Account;
import model.Sign;
import org.json.JSONObject;
import util.Key;
import util.MySignature;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
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
//                Part part = request.getPart("sign");
//                String readPath = request.getServletContext().getRealPath("/orders/upload");
//                String fileName = UUID.randomUUID().toString() + ".json";
//                File folder = new File(readPath);
//                if (!folder.exists()) {
//                    folder.mkdir();
//                }
//                part.write(readPath + "/" + fileName);
//                MySignature mySignature = new MySignature(readPath + "/" + fileName);
//                Sign sign = SignService.getSignWithAccountAndIsActive(account, true);
//                if (sign != null) {
//                    sign.setActive(false);
//                    SignService.update(sign);
//                    sign.setSign(mySignature.getPublicKey());
//                    sign.setKeySize(mySignature.getKeySize());
//                    sign.setActive(true);
//                    SignService.add(sign);
//                } else {
//                    sign = new Sign();
//                    sign.setAccount(account);
//                    sign.setSign(mySignature.getPublicKey());
//                    sign.setKeySize(mySignature.getKeySize());
//                    sign.setActive(true);
//                    SignService.add(sign);
//                }
//                mySignature.delete();
                String func = request.getParameter("signDown");
                if (func.equals("update")) {

                } else {
                    Sign sign = SignService.getSignWithAccountAndIsActive(account, true);
                    if (sign != null) {
                        request.setAttribute("message", "Bạn đã có chữ ký");
                    } else {
                        Key key = new Key();
                        key.generatorKey(1024);
                        PublicKey publicKey = key.getPub();
                        String keyBase64 = Base64.getEncoder().encodeToString(publicKey.getEncoded());
                        sign = new Sign();
                        sign.setAccount(account);
                        sign.setSign(keyBase64);
                        sign.setKeySize(1024);
                        sign.setActive(true);
                        SignService.add(sign);

                        PrivateKey privateKey = key.getPri();
                        String privateKeyBase64 = Base64.getEncoder().encodeToString(privateKey.getEncoded());
                        JSONObject json = new JSONObject();
                        json.put("userName", account.getUsername());
                        json.put("email", account.getEmail());
                        json.put("phone", account.getPhone());
                        json.put("privateKey", privateKeyBase64);
                        json.put("keySize", 1024);

                        String signUrl = request.getServletContext().getRealPath("\\sign");
                        File f = new File(signUrl);
                        if (!f.exists()) {
                            f.mkdir();
                        }
                        String uuid = UUID.randomUUID().toString().substring(0, 6);
                        PrintWriter printWriter = new PrintWriter(signUrl + "\\" + uuid + ".json");
                        printWriter.write(json.toString());
                        printWriter.close();

                        String linkDownKey = "/WebBanQuanAo/sign/" + uuid + ".json";
                        request.setAttribute("linkDownKey", linkDownKey);
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
