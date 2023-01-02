package Services;

import dao.CategoryDao;
import model.Category;

import java.util.List;

public class CategoryService {
    public static List<Category> getAllCategory() {
        return CategoryDao.findAll();
    }
}
