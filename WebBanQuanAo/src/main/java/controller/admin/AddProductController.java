package controller.admin;

import Services.BrandService;
import Services.CategoryService;
import Services.LoginService;
import Services.ProductServices;
import com.google.gson.Gson;
import model.*;
import response.ProductResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addProductController", value = "/admin-add-product")
@MultipartConfig()
public class AddProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String category = request.getParameter("brand");
        String description = request.getParameter("description");
        Part thumbnail = request.getPart("thumbnail");
        Part images = request.getPart("images");


        String base = request.getServletContext().getContextPath();
        List<Brand> brands = BrandService.getBrandList();
        List<Category> categories = CategoryService.getAllCategory();
        request.setAttribute("message", "Thêm thành công");
        request.setAttribute("brands", brands);
        request.setAttribute("categories", categories);
        request.setAttribute("base", base);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product-manage.jsp");
        request.setAttribute("subTabName", "manageProduct");
        request.setAttribute("tabName", "manage");
        rd.forward(request, response);
    }
}
