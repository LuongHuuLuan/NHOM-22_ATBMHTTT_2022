package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Order extends ModelParent implements Serializable {
    private Account account;
    private Status status;
    private List<OrderItem> items;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
