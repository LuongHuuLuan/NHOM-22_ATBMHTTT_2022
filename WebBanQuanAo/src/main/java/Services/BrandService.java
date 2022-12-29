package Services;

import model.Brand;
import dao.BrandDao;

import java.util.List;

public class BrandService {
    public static List<Brand> getBrandList() {
//        return BrandDao.findAll();
        return null;
    }

    public static boolean addBrand(String id, String name) {
//        Brand brand = new Brand();
//        brand.setId(id);
//        brand.setName(name);
//        return BrandDao.add(brand);
        return false;
    }

    public static boolean deleteBrand(String id) {
//        return BrandDao.delete(id);
        return false;
    }

    public static boolean updateBrand(String id, String name) {
//        Brand brand = new Brand();
//        brand.setId(id);
//        brand.setName(name);
//        return BrandDao.update(brand);
        return false;
    }
}
