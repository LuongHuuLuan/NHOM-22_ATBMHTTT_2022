package controller;

import beans.Image;
import beans.Product;
import Services.ProductServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "singleProductController", value = "/single-product")
public class SingleProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        Product product = ProductServices.getInformationProduct(productId);
        List<Image> images = ProductServices.getImageForProduct(product);
        request.setAttribute("product", product);
        request.setAttribute("productImages", images);
        request.setAttribute("pageName", "Sản phẩm");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/singleProduct.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
