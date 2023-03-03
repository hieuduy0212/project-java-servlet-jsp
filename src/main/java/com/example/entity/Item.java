package com.example.entity;

public class Item {
    private Product product;
    private int qty;
    private double price;

    public Item() {
    }

    public Item(Product product, int qty, double price) {
        this.product = product;
        this.qty = qty;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
