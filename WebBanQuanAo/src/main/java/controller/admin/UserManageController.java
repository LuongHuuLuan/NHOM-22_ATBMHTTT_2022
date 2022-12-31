package controller.admin;

import javax.servlet.http.HttpSession;

import Services.*;
import com.google.gson.Gson;
import model.Account;
import dao.AccountDao;
import dao.RoleDao;
import model.Role;
import model.Status;
import response.AccountResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "userManageController", value = "/admin-user-manage")
public class UserManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginService.login(request, response);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null || !(account.getRole().getName().equals("ADMIN"))) {
            response.sendRedirect("login");
        } else {
            List<Role> roles = RoleService.getRoles();
            List<Status> statuses = StatusService.getAllStatusWithStatusGroup("ACCOUNT");
            String base = request.getServletContext().getContextPath();
            request.setAttribute("roles", roles);
            request.setAttribute("statuses", statuses);
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String action = request.getParameter("action");
        Gson gson = new Gson();
        switch (action) {
            case "getAllUser": {
                List<Account> accounts = AccountServices.getAll();
                List<AccountResponse> accountResponses = new ArrayList<>();
                for (Account account : accounts) {
                    AccountResponse accountResponse = new AccountResponse(account.getId(), account.getLastName(), account.getFirstName(), account.getPhone(), account.getEmail(), account.getAddress(), account.getUsername(), account.getRole().getName(), account.getStatus().getName());
                    accountResponses.add(accountResponse);
                }
                String result = gson.toJson(accountResponses);
                pw.println(result);
                break;
            }
            case "getUser": {
                long id = Long.parseLong(request.getParameter("id"));
                Account account = AccountServices.getUser(id);
                AccountResponse accountResponse = new AccountResponse(account.getId(), account.getLastName(), account.getFirstName(), account.getPhone(), account.getEmail(), account.getAddress(), account.getUsername(), account.getRole().getName(), account.getStatus().getName());
                String result = gson.toJson(accountResponse);
                pw.println(result);
                break;
            }
            case "addUser": {
                Account account = new Account();
                account.setLastName(request.getParameter("lastName"));
                account.setFirstName(request.getParameter("firstName"));
                account.setPhone(request.getParameter("phone"));
                account.setEmail(request.getParameter("email"));
                account.setAddress(request.getParameter("address"));
                account.setUsername(request.getParameter("username"));
                account.setPassword(request.getParameter("password"));
                account.setRole(RoleService.getRole(Long.parseLong(request.getParameter("roleId"))));
                account.setStatus(StatusService.getStatus(2));
                if (RegisterService.checkUserNameExist(account.getUsername()) || RegisterService.checkEmailExist(account.getEmail())) {
                    pw.println(false);
                } else {
                    long id = AccountServices.addNewAccount(account);
                    account.setId(id);
                    AccountResponse accountResponse = new AccountResponse(account.getId(), account.getLastName(), account.getFirstName(), account.getPhone(), account.getEmail(), account.getAddress(), account.getUsername(), account.getRole().getName(), account.getStatus().getName());
                    String result = gson.toJson(accountResponse);
                    pw.println(result);
                }
                break;
            }
            case "deleteUser": {
                long id = Long.parseLong(request.getParameter("id"));
                pw.println(AccountServices.deleteAccount(id));
                break;
            }
            case "updateUser": {
                Account account = AccountServices.getUser(Long.parseLong(request.getParameter("id")));
                account.setLastName(request.getParameter("lastName"));
                account.setFirstName(request.getParameter("firstName"));
                account.setPhone(request.getParameter("phone"));
                account.setEmail(request.getParameter("email"));
                account.setAddress(request.getParameter("address"));
                account.setUsername(request.getParameter("username"));
                account.setRole(RoleService.getRoleByName(request.getParameter("roleName")));
                account.setStatus(StatusService.getStatusByName(request.getParameter("statusName")));
                boolean isUpdate = AccountServices.update(account, false);
                pw.println(isUpdate);
                break;
            }
            default:
                break;
        }
        pw.flush();
    }
}
