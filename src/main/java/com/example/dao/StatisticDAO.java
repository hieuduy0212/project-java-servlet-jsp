package com.example.dao;

import com.example.entity.Category;

import java.util.HashMap;

public interface StatisticDAO {
    HashMap<Category, Integer> getCountByCategory();
    double getTotalSales();
}
