package controller.web;

import Services.AccountServices;
import Services.LoginService;
import Services.SignService;
import model.Account;
import model.Sign;
import org.json.JSONObject;
import util.*;
import util.Key;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
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

        Sign sign = SignService.getSignWithAccountAndIsActive(account, true);
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
                if (sign != null) {
                    Part privateKeyPart = request.getPart("privateKey");
                    Part publicKeyPart = request.getPart("publicKey");
                    PartKey partPrivateKey = new PartKey(privateKeyPart, "privateKey");
                    PartKey partPublicKey = new PartKey(publicKeyPart, "publicKey");

                    RSA rsa = null;
                    try {
                        byte[] keyBytes = Base64.getDecoder().decode(sign.getSign());
                        X509EncodedKeySpec ks = new X509EncodedKeySpec(keyBytes);
                        KeyFactory kf = KeyFactory.getInstance("RSA");
                        PublicKey currentPublicKey = kf.generatePublic(ks);

                        rsa = new RSA();
                        String randomText = UUID.randomUUID().toString().substring(0, 6);
                        String encrypt = rsa.encrypt(randomText, Constants.PRIVATE_KEY, partPrivateKey.getPrivateKey(), 1024);
                        String decrypt = rsa.decrypt(encrypt, Constants.PUBLIC_KEY, currentPublicKey, 1024);
                        if (decrypt.startsWith(randomText) || decrypt.endsWith(randomText)) {
                            sign.setActive(false);
                            SignService.update(sign);
                            sign.setSign(partPublicKey.getStringKey());
                            sign.setKeySize(1024);
                            sign.setActive(true);
                            SignService.add(sign);
                            request.setAttribute("message", "Đã cập nhật chữ ký mới");
                        } else {
                            request.setAttribute("message", "Khóa bị sai không thể cập nhật chữ ký mới");
                        }
                    } catch (Exception e) {
                        request.setAttribute("message", "Không thể đọc khóa");
                    }
                } else {
                    request.setAttribute("message", "Bạn chưa có chữ ký tải chữ ký trước");
                }
            } else if (type.equals("download")) {
                if (sign == null) {
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
                } else {
                    request.setAttribute("message", "Bạn đã có chữ ký");
                }
            }
        } else {
            request.setAttribute("message", "Vui lòng đăng nhập");
        }
        session.setAttribute("account", account);
        doGet(request, response);
    }
}
