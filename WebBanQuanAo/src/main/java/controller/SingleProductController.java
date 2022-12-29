package controller;

import Services.*;
import model.Color;
import model.Product;
import model.Size;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "singleProductController", value = "/single-product")
public class SingleProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService.login(request, response);
        String productId = request.getParameter("productId");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        Product product = ProductServices.getProduct(productId);
        int totalAmount = WarehouseService.getAmountProduct(product);
        List<Color> colors = WarehouseService.getProductColors(product);
        List<Size> sizes = WarehouseService.getProductSizes(product);
        request.setAttribute("product", product);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("colors", colors);
        request.setAttribute("sizes", sizes);
        request.setAttribute("color", color);
        request.setAttribute("size", size);
        request.setAttribute("pageName", "Sản phẩm");
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/singleProduct.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter pw = response.getWriter();

        String productId = request.getParameter("productId");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        Product product = ProductServices.getProduct(productId);
        List<Color> colors = WarehouseService.getProductColors(product);
        List<Size> sizes = WarehouseService.getProductSizes(product);
        int currentAmount = 0;
        if (size == null && color == null) {
            currentAmount = WarehouseService.getAmountProductWithSizeAndColor(product, sizes.get(0), colors.get(0));
        } else {
            Size s = SizeService.getSize(size);
            Color c = ColorService.getColor(color);
            currentAmount = WarehouseService.getAmountProductWithSizeAndColor(product, s, c);
        }
        pw.println(currentAmount);
        pw.flush();
    }
}
