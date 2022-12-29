package model;

public class Image {
    private long productId;
    private String url;

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Image{" +
                "productId=" + productId +
                ", url='" + url + '\'' +
                '}';
    }
}
