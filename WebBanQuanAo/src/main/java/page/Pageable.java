package page;

import sort.SortProduct;

public class Pageable {
    private int page;
    private int maxItem;
    private SortProduct sortProduct;


    public int getOffset() {
        return (page - 1) * maxItem + maxItem;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getMaxItem() {
        return maxItem;
    }

    public void setMaxItem(int maxItem) {
        this.maxItem = maxItem;
    }

    public SortProduct getSortProduct() {
        return sortProduct;
    }

    public void setSortProduct(SortProduct sortProduct) {
        this.sortProduct = sortProduct;
    }

    @Override
    public String toString() {
        return "Pageable{" +
                "page=" + page +
                ", maxItem=" + maxItem +
                ", sortProduct=" + sortProduct +
                '}';
    }
}
