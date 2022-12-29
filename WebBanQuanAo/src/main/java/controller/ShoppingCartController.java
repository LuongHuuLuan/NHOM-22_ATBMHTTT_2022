package controller;

import Services.*;
import model.Cart;
import model.CartItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "shoppingCartController", value = "/shopping-cart")
public class ShoppingCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService.login(request, response);
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        request.setAttribute("pageName", "Giỏ hàng");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/shoppingCart.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        String type = request.getParameter("type");
        CartItem cartItem = new CartItem();
        cartItem.setCartId(Long.parseLong(request.getParameter("cartId")));
        cartItem.setProduct(ProductServices.getProduct(request.getParameter("productId")));
        cartItem.setColor(ColorService.getColor(request.getParameter("color")));
        cartItem.setSize(SizeService.getSize(request.getParameter("size")));
        cartItem.setAmount(Integer.parseInt(request.getParameter("amount")));
        switch (type) {
            case "add": {
                int isAdd = CartService.addItem(cartItem);
                pw.println(isAdd);
                break;
            }
            case "delete": {
                boolean isDelete = CartService.deleteItem(cartItem);
                cart.getCartItems().remove(cartItem);
                pw.println(isDelete);
                break;
            }
            case "update": {
                boolean isUpdate = CartService.updateItem(cartItem);
                pw.println(isUpdate);
                break;
            }
            default:
                pw.println(false);
                break;
        }
        pw.flush();
    }
}
