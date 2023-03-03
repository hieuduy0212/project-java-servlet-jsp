package com.example.entity;

public class Ordered {
    private int id;
    private int product_id;
    private int qty;
    private int transaction_id;

    public Ordered() {
    }

    public Ordered(int id, int product_id, int qty, int transaction_id) {
        this.id = id;
        this.product_id = product_id;
        this.qty = qty;
        this.transaction_id = transaction_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(int transaction_id) {
        this.transaction_id = transaction_id;
    }
}
