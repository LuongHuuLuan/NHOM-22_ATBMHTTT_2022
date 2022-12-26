package Services;

import beans.Brand;
import dao.BrandDao;

import java.util.List;

public class BrandService {
    public static List<Brand> getBrandList() {
        return BrandDao.findAll();
    }

    public static boolean addBrand(String id, String name) {
        Brand brand = new Brand();
        brand.setId(id);
        brand.setName(name);
        return BrandDao.add(brand);
    }

    public static boolean deleteBrand(String id) {
        return BrandDao.delete(id);
    }

    public static boolean updateBrand(String id, String name) {
        Brand brand = new Brand();
        brand.setId(id);
        brand.setName(name);
        return BrandDao.update(brand);
    }
}
