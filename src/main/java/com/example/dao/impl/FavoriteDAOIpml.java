package com.example.dao.impl;

import com.example.dao.FavoriteDAO;
import com.example.entity.Favorite;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAOIpml implements FavoriteDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;
    ResultSet rs = null;
    @Override
    public void addProductToFavorite(int user_id, int product_id) {
        String query = "insert into favorite values(?,?)";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, user_id);
            pstm.setInt(2, product_id);
            pstm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Favorite> getAllFavoriteOfUser(int user_id) {
        String query = "select * from favorite where user_id="+user_id;
        List<Favorite> listF = null;
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            listF = new ArrayList<>();
            while(rs.next()){
                listF.add(new Favorite(rs.getInt(1), rs.getInt(2)));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return listF;
    }

    @Override
    public void deleteFavoriteById(int user_id, int product_id) {
        String query = "delete from favorite where user_id=? and product_id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, user_id);
            pstm.setInt(2, product_id);
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
