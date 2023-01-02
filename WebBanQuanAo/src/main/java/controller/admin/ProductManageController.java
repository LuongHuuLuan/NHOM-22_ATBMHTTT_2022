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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "productManageController", value = "/admin-product-manage")
public class ProductManageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService.login(request, response);
        Account account = (Account) session.getAttribute("account");
        if (account == null || !(account.getRole().getName().equals("ADMIN"))) {
            response.sendRedirect("login");
        } else {
            String base = request.getServletContext().getContextPath();
            List<Brand> brands = BrandService.getBrandList();
            List<Category> categories = CategoryService.getAllCategory();
            request.setAttribute("brands", brands);
            request.setAttribute("categories", categories);
            request.setAttribute("base", base);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product-manage.jsp");
            request.setAttribute("subTabName", "manageProduct");
            request.setAttribute("tabName", "manage");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();
        String action = request.getParameter("action");
        Gson gson = new Gson();

        switch (action) {
            case "getAllProduct": {
                List<Product> products = ProductServices.getProducts();
                List<ProductResponse> productResponses = new ArrayList<>();
                for (Product product : products) {
                    List<String> images = new ArrayList<>();
                    for (Image i : product.getImages()) {
                        images.add(i.getUrl());
                    }
                    ProductResponse productResponse = new ProductResponse(product.getId(), product.getCode(), product.getName(), product.getBrand().getName(), product.getCategory().getName(), product.getPrice(), product.getDiscount(), product.getDescription(), product.getThumbnail(), images);
                    productResponses.add(productResponse);
                }
                String result = gson.toJson(productResponses);
                pw.println(result);
                break;
            }
            case "getProduct": {
                long id = Long.parseLong(request.getParameter("id"));
                Product product = ProductServices.getProduct(id);
                List<String> images = new ArrayList<>();
                for (Image i : product.getImages()) {
                    images.add(i.getUrl());
                }
                ProductResponse productResponse = new ProductResponse(product.getId(), product.getCode(), product.getName(), product.getBrand().getName(), product.getCategory().getName(), product.getPrice(), product.getDiscount(), product.getDescription(), product.getThumbnail(), images);
                String result = gson.toJson(productResponse);
                pw.println(result);
                break;
            }
            case "checkProductCode": {
                String productCode = request.getParameter("code");
                if (productCode.trim().length() != 0) {
                    pw.println(ProductServices.getProduct(productCode) == null);
                } else {
                    pw.println(false);
                }
                break;
            }
            case "createProductCode": {
                response.setContentType("application/text");
                String productCode = "SP" + (ProductServices.count() + 1);
                pw.println(productCode);
                break;
            }
            case "addProduct": {
                String code = request.getParameter("code");
                String name = request.getParameter("name");
                String brand = request.getParameter("brand");
                String category = request.getParameter("brand");
                String description = request.getParameter("description");
                System.out.println(request.getParameter("thumbnail"));
                System.out.println(request.getParameter("images"));
                break;
            }
            default:
                break;
        }
        pw.flush();
    }
}
