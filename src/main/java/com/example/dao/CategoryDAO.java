package com.example.dao;


import com.example.entity.Category;

import java.util.HashMap;
import java.util.List;

public interface CategoryDAO {
    List<Category> getAllCategory();
    HashMap<Integer, Integer> getQuantityOfEachCategory();
    Category getLatestCategory();
    boolean addCategory(Category category);
    boolean editCategory(Category category);
    void deleteById(int id);
    Category getCategoryById(int id);
}
