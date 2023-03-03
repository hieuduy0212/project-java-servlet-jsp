package com.example.dao.impl;

import com.example.dao.StatisticDAO;
import com.example.entity.Category;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

public class StatisticDAOImpl implements StatisticDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;
    ResultSet rs = null;

    @Override
    public HashMap<Category, Integer> getCountByCategory() {
        String query = "select c.*, count(*) from category c, ordered o, product p\n" +
                "where o.product_id = p.id and p.cateID = c.cid group by c.cid";
        HashMap<Category, Integer> hmap = new HashMap<>();
        try {
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                hmap.put(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)), rs.getInt(4));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return hmap;
    }

    @Override
    public double getTotalSales() {
        String query = "select sum(total) from transaction";
        double total = 0.0;
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if(rs.next()){
                total = rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return total;
    }
}
