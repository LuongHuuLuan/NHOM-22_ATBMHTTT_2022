package sort;

import dao.BrandDao;
import dao.CategoryDao;
import dao.ColorDao;
import model.Brand;
import model.Category;
import model.Color;

public class SortProduct {
    private String orderType = null;
    private Category category = null;
    private Brand brand = null;
    private Color color = null;

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        if (!orderType.equalsIgnoreCase("default"))
            this.orderType = orderType;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(String category) {
        if (!category.equalsIgnoreCase("all")) {
            this.category = CategoryDao.findOneByCode(category);
        }
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        if (!brand.equalsIgnoreCase("all"))
            this.brand = BrandDao.findOneByCode(brand);
    }

    public Color getColor() {
        return color;
    }

    public void setColor(String color) {
        if (!color.equalsIgnoreCase("all"))
            this.color = ColorDao.findOneByCode(color);
    }

    @Override
    public String toString() {
        return "SortProduct{" +
                "orderType='" + orderType + '\'' +
                ", category=" + category +
                ", brand=" + brand +
                ", color=" + color +
                '}';
    }
}
