package controller.admin;

import javax.servlet.http.HttpSession;

import model.Account;
import Services.AccountServices;
import dao.AccountDao;
import dao.RoleDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "userManageController", value = "/admin-user-manage")
public class UserManageController extends HttpServlet {
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
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user-manage.jsp");
            request.setAttribute("subTabName", "manageUser");
            request.setAttribute("tabName", "manage");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");
//        String action = request.getParameter("action");
//        String idAccount = request.getParameter("idAccount");
//        String lastName = request.getParameter("last-name");
//        String firstName = request.getParameter("first-name");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String address = request.getParameter("address");
//        String userName = request.getParameter("username");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role_edit");
//
//        Account account = AccountDao.findOneById(Integer.parseInt(idAccount));
//        account.setLastName(lastName);
//        account.setFirstName(firstName);
//        account.setPhoneNumber(phone);
//        account.setEmail(email);
//        account.setAddress(address);
//        account.setUserName(userName);
//        account.setPassWord(password);
//        account.setRole(RoleDao.findOneById(role));
//        switch (action) {
//            case "update": {
//                boolean update = AccountServices.update(account, false);
//                break;
//            }
//            default: {
//
//                long checkAddAccount = AccountServices.addNewAccount(account);
//                String message = "Thêm thành công";
//                switch (checkAddAccount) {
//                    case 0:
//                        message = "Thêm tài khoản thành công";
//                        break;
//                    case 1:
//                        message = "Đã xảy ra lỗi trong quá trình đăng ký vui lòng thử lại sau";
//                        break;
//                    case 2:
//                        message = "Email đã được sử dụng";
//                        break;
//                    default:
//                        message = "Tên tài khoản đã được sử dụng, Vui lòng chọn tên tài khoản khác";
//                        break;
//                }
//                request.setAttribute("message", message);
//                break;
//            }
//
//        }

        doGet(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
