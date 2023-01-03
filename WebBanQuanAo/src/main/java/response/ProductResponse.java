package response;

import java.util.List;

public class ProductResponse {
    private long id;
    private String code;
    private String name;
    private String brand;
    private String category;
    private double price;
    private int discount;
    private String description;
    private String thumbnail;
    private List<String> images;

    public ProductResponse() {

    }

    public ProductResponse(long id, String code, String name, String brand, String category, double price, int discount, String description, String thumbnail, List<String> images) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.brand = brand;
        this.category = category;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.thumbnail = thumbnail;
        this.images = images;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }
}
