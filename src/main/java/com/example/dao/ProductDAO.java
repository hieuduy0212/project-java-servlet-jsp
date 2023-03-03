package com.example.dao;

import com.example.entity.Product;

import java.util.List;

public interface ProductDAO {
    public List<Product> getAllProduct();

    public List<Product> getProductByCateID(int cateID);

    public List<Product> getProductByKeyWord(String keyname);

    public Product getProductByID(int ID);

    Product getLatest();

    boolean addProduct(Product product);

    boolean editProduct(Product product);

    void deleteById(int id);
}
