package com.example.dao.impl;


import com.example.dao.CategoryDAO;
import com.example.entity.Category;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    Connection conn = null;
    Statement stm = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;

    @Override
    public List<Category> getAllCategory() {
        String query = "select * from Category order by cid";
        List<Category> list = new ArrayList<>();
        try {
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public HashMap<Integer, Integer> getQuantityOfEachCategory() {
        HashMap<Integer, Integer> m = new HashMap<>();
        String query = "select c.cid, count(*) from category as c, product as p where c.cid = p.cateID group by c.cid order by c.cid";
        try {
            conn = connectDB.getConnection();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                m.put(rs.getInt(1), rs.getInt(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    @Override
    public Category getLatestCategory() {
        String query = "select * from category order by cid desc limit 1";
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addCategory(Category category) {
        String query = "insert into category values(?,?,?)";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, category.getId());
            pstm.setString(2, category.getCname());
            pstm.setString(3, category.getCimage());
            pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean editCategory(Category category) {
        String query = "update category set cname=?, cimage=? where cid=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, category.getCname());
            pstm.setString(2, category.getCimage());
            pstm.setInt(3, category.getId());
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public void deleteById(int id) {
        String query ="delete from category where cid=" + id;
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            stm.executeUpdate(query);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Category getCategoryById(int id) {
        String query = "select * from category where cid="+id;
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
