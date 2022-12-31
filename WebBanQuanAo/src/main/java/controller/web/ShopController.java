package controller.web;

import Services.LoginService;
import model.Brand;
import model.Category;
import model.Color;
import model.Product;
import Services.ProductServices;
import dao.BrandDao;
import dao.ColorDao;
import dao.CategoryDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "shopController", value = "/shop")
public class ShopController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService.login(request, response);
        String indexPage = request.getParameter("page");
        int index = Integer.parseInt(indexPage);
        String numOfProductsString = request.getParameter("numOfProducts");
        String sort = request.getParameter("sort");
        String type = request.getParameter("type");
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        int numOfProducts = 9;
        if (numOfProductsString != null) {
            numOfProducts = Integer.parseInt(numOfProductsString);
        }
        int endPage = ProductServices.getNumOfPage(numOfProducts, type, brand, color);
        List<Product> products = ProductServices.getProductForPage(index, numOfProducts, type, brand, color, sort);
        List<Brand> brands = BrandDao.findAll();
        List<Category> categories = CategoryDao.findAll();
        List<Color> colors = ColorDao.findAll();

        request.setAttribute("numOfProducts", numOfProducts);
        request.setAttribute("sort", sort);
        request.setAttribute("type", type);
        request.setAttribute("brand", brand);
        request.setAttribute("color", color);


        request.setAttribute("currentPage", index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("products", products);
        request.setAttribute("brands", brands);
        request.setAttribute("categories", categories);
        request.setAttribute("colors", colors);
        request.setAttribute("pageName", "Cửa hàng");

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/shop.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
