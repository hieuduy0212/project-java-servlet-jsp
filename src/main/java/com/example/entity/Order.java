package com.example.entity;

import java.util.Date;
import java.util.List;

public class Order {
    private List<Item> listItem;
    private double sumPrice;

    public Order() {
    }

    public Order(List<Item> listItem, double sumPrice) {
        this.listItem = listItem;
        this.sumPrice = sumPrice;
    }

    public List<Item> getListItem() {
        return listItem;
    }

    public void setListItem(List<Item> listItem) {
        this.listItem = listItem;
    }

    public double getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(double sumPrice) {
        this.sumPrice = sumPrice;
    }
}
