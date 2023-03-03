package com.example.dao.impl;

import com.example.dao.OrderedDAO;
import com.example.entity.Ordered;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class OrderedDAOImpl implements OrderedDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;

    @Override
    public void insert(Ordered ordered) {
        String query = "insert into ordered(product_id, qty, transaction_id) values(?,?,?)";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, ordered.getProduct_id());
            pstm.setInt(2, ordered.getQty());
            pstm.setInt(3,ordered.getTransaction_id());
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
