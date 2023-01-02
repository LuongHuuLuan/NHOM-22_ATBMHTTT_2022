package Services;

import java.util.List;

import model.Image;
import model.Product;
import dao.*;
import page.Pageable;
import sort.SortProduct;

public class ProductServices {

    public static List<Product> getProducts() {
        return ProductDao.findAll();
    }

    public static List<Product> getProductForPage(int page, int numOfProducts, String type, String brand, String color,
                                                  String orderBy) {
        SortProduct sort = new SortProduct();
        if (!type.equals("")) {
            sort.setCategory(type);
        }
        if (!brand.equals("")) {
            sort.setBrand(brand);
        }
        if (!color.equals("")) {
            sort.setColor(color);
        }
        if (!orderBy.equals("")) {
            sort.setOrderType(orderBy);
        }
        Pageable pageable = new Pageable();
        pageable.setPage(page);
        pageable.setMaxItem(numOfProducts);
        pageable.setSortProduct(sort);
        return ProductDao.findAll(pageable);
    }

    public static Product getProduct(String productCode) {
        return ProductDao.findOneByCode(productCode);
    }
    public static Product getProduct(long id) {
        return ProductDao.findOneById(id);
    }

    public static List<Image> getImageForProduct(Product product) {
//        return ImageDao.findByProduct(product);
        return null;
    }

    public static int getNumOfPage(int numOfProducts, String type, String brand, String color) {
        SortProduct sort = new SortProduct();
        if (!type.equals("")) {
            sort.setCategory(type);
        }
        if (!brand.equals("")) {
            sort.setBrand(brand);
        }
        if (!color.equals("")) {
            sort.setColor(color);
        }
        Pageable pageable = new Pageable();
        pageable.setMaxItem(numOfProducts);
        pageable.setSortProduct(sort);
        int items = ProductDao.count(pageable);
        return items % numOfProducts == 0 ? items / numOfProducts : (items / numOfProducts) + 1;
    }
    public static int count() {
        return ProductDao.count();
    }
}