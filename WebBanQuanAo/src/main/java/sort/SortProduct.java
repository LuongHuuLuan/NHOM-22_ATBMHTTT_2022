package sort;

public class SortProduct {
    private String orderType = null;
    private String type = null;
    private String brand = null;
    private String color = null;

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        if (!orderType.equalsIgnoreCase("default"))
            this.orderType = orderType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        if (!type.equalsIgnoreCase("all"))
            this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        if (!brand.equalsIgnoreCase("all"))
            this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        if (!color.equalsIgnoreCase("all"))
            this.color = color;
    }

    @Override
    public String toString() {
        return "SortProduct{" +
                "orderType='" + orderType + '\'' +
                ", type='" + type + '\'' +
                ", brand='" + brand + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}
