package Services;

import model.Account;
import model.Cart;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginService {
    public static void login(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
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
        if (account != null) {
            Cart cart = CartService.getCart(account);
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
        }
    }
}
