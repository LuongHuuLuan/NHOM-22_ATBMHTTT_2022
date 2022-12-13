package api;

import Services.ProductServices;
import beans.Product;
import beans.ProductNew;
import com.google.gson.Gson;
import dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductAPI", value = "/api/order")
@MultipartConfig
public class OrderAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<Product> listProductAPI = ProductDao.loadProduct();
        Gson gson = new Gson();
        String list = gson.toJson(listProductAPI);
        PrintWriter pw = response.getWriter();
        pw.println(list);
        pw.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        switch (uri) {
            case "/WebBanQuanAo/update-thumbnail":
                String codeProduct = request.getParameter("codeProduct");
                String oldPath = request.getParameter("oldPath");
                Part filePart = request.getPart("thumbnail");
                String readPath = request.getServletContext().getRealPath("/assets/imgs/product-imgs");
                ProductServices.updateThumbnail(codeProduct, filePart, readPath, oldPath);
                break;

            default:
                break;
        }
    }
}
