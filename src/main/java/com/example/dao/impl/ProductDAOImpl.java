package com.example.dao.impl;

import com.example.dao.ProductDAO;
import com.example.entity.Product;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;
    ResultSet rs = null;

    @Override
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> getProductByCateID(int cateID) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where cateID = " + cateID;
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> getProductByKeyWord(String keyname) {
        List<Product> list = new ArrayList<>();
        String query = "select p.*\n" +
                "from product as p join category as c\n" +
                "on p.cateID = c.cid\n" +
                "and (p.name like ? or p.description like ? or p.title like ? or c.cname like ?)";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            keyname = "%"+keyname+"%";
            pstm.setString(1, keyname);
            pstm.setString(2, keyname);
            pstm.setString(3, keyname);
            pstm.setString(4, keyname);
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product getProductByID(int ID) {
        Product p = null;
        String query = "select * from Product where id = " + ID;
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            if (rs.next()) {
                p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public Product getLatest() {
        String query = "select * from product order by id desc limit 1";
        Product product = null;
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if(rs.next()){
                product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public boolean addProduct(Product product) {
        String query = "insert into product values(?,?,?,?,?,?,?)";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, product.getId());
            pstm.setString(2, product.getName());
            pstm.setString(3, product.getImage());
            pstm.setDouble(4, product.getPrice());
            pstm.setString(5,  product.getTitle());
            pstm.setString(6, product.getDescription());
            pstm.setInt(7, product.getCateID());
            pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean editProduct(Product product) {
        String query = "update product set name=?, image=?, price=?, title=?, description=?, cateID=?  where id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, product.getName());
            pstm.setString(2, product.getImage());
            pstm.setDouble(3, product.getPrice());
            pstm.setString(4, product.getTitle());
            pstm.setString(5, product.getDescription());
            pstm.setInt(6, product.getCateID());
            pstm.setInt(7, product.getId());
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public void deleteById(int id) {
        String query = "delete from product where id = " + id;
        System.out.println(query);
        try{
            conn=connectDB.getConnection();
            stm = conn.createStatement();
            stm.executeUpdate(query);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        List<Product> list = new ProductDAOImpl().getAllProduct();
//        for(Product  p : list){
//            System.out.println(p);
//        }
//    }
}
