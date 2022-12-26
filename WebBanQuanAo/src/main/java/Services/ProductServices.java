package Services;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.Part;

import beans.Brand;
import beans.Color;
import beans.Image;
import beans.Product;
import beans.ProductNew;
import beans.Size;
import beans.Tag;
import dao.*;
import object_reponse.InfoDelete;
import object_reponse.InfoFormAddProduct;
import page.Pageable;
import sort.SortProduct;

public class ProductServices {

    public List<Product> getProducts() {
        return ProductDao.findAll();
    }

    public static List<Product> getProductForPage(int page, int numOfProducts, String type, String brand, String color,
                                                  String orderBy) {
        SortProduct sort = new SortProduct();
        if (!type.equals("")) {
            sort.setType(type);
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

    public static Product getInformationProduct(String productId) {
        return ProductDao.findOneById(productId);
    }
    public static List<Image> getImageForProduct(Product product) {
        return ImageDao.findByProduct(product);
    }

    public static int getNumOfPage(int numOfProducts, String type, String brand, String color) {
        SortProduct sort = new SortProduct();
        if (!type.equals("")) {
            sort.setType(type);
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

    public static InfoFormAddProduct getInfoFormAddProduct() {
//        List<Size> sizeList = SizeDao.getSizeList();
//        List<Color> colorList = ColorDao.getColorList();
//        List<Tag> tagList = TagDao.getTagList();
//        List<Brand> brandList = BrandDao.findAll();
        InfoFormAddProduct infoFormAddProduct = new InfoFormAddProduct();
//        infoFormAddProduct.setColorList(colorList);
//        infoFormAddProduct.setBrandList(brandList);
//        infoFormAddProduct.setTagList(tagList);
//        infoFormAddProduct.setSizeList(sizeList);
        return infoFormAddProduct;
    }

//    public static boolean checkCodeProduct(String codeProduct) {
//        return ProductDao.checkCodeProduct(codeProduct);
//    }
//
//    public static String addProduct(String codeProduct, String nameProduct, String brand, double price_product,
//                                    String description, String[] tag_product, String[] color_product, String[] size_product, String thumbnail, String nameCreator) throws SQLException {
//        return ProductDao.addProduct(codeProduct, nameProduct, brand, price_product, description, tag_product,
//                color_product, size_product, thumbnail, nameCreator);
//    }
//
//    public static String deleteProduct(String codeProduct, String pathBase) {
//        System.out.println("=====================");
//        StringBuffer preparePath = new StringBuffer(pathBase);
//        preparePath.deleteCharAt(preparePath.length() - 1);
//        InfoDelete infoDelete = ProductDao.deleteProduct(codeProduct);
//        File thumnail = new File(preparePath.toString() + infoDelete.getThumnail());
//        boolean status = thumnail.delete();// detele thumbnail on store
//        System.out.println("File đã xóa" + thumnail.getName() + " " + status);
//        for (String imgPath : infoDelete.getImages()) {
//            // delete images detail on store
//            File imgDetail = new File(preparePath.toString() + imgPath);
//            boolean status1 = imgDetail.delete();
//            System.out.println("File đã xóa" + imgDetail.getName() + " " + status1);
//        }
//        return infoDelete.getMessage();
//    }
//
//    public static List<Tag> getTagsList() {
//        return TagDao.getTagList();
//    }
//
//    public static List<Brand> getBrandsList() {
//        return BrandDao.findAll();
//    }
//
//    public static List<Color> getColorsList() {
//        return ColorDao.getColorList();
//    }
//
//    public static List<Image> getAllImage() {
//        return ProductDao.getAllImage();
//    }
//
//    public static ProductNew getProductEdit(String codeProduct) {
//        return ProductDao.getProductEdit(codeProduct);
//    }
//
//    public static String updateProduct(Product product) {
//        return ProductDao.updateProduct(product);
//    }
//
//    public static void updateThumbnail(String codeProduct, Part part, String readPath, String oldPath)
//            throws IOException {
//        String newPath = UploadService.uploadFile(part, readPath);
//        StringBuffer preparePath = new StringBuffer(readPath);
//        preparePath.deleteCharAt(preparePath.length() - 1);
//        if (!newPath.equals("")) {
//            File file = new File(preparePath + oldPath);
//            System.out.println(file.getPath());
//            file.delete();
//            ProductDao.updateThumbnail(codeProduct, newPath);
//        }
//    }
//
//    public static boolean addImageDetail(String idProduct, String colorProduct, String... pathImgs) {
//        boolean result = true;
//        for (int i = 0; i < pathImgs.length; i++) {
//            boolean add = ProductDao.addImageDetail(idProduct, colorProduct, pathImgs[i]);
//            if (!add) {
//                return false;
//            }
//        }
//        return result;
//    }
}