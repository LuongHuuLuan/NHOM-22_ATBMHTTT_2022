package controller.admin;

import model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "productManageController", value = "/admin-product-manage")
public class ProductManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null || !(account.getRole().getName().equals("ADMIN"))) {
            response.sendRedirect("login");
        } else {
            String base = request.getServletContext().getContextPath();
            request.setAttribute("base", base);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product-manage.jsp");
            request.setAttribute("subTabName", "manageProduct");
            request.setAttribute("tabName", "manage");
            rd.forward(request, response);
        }
    }
}
