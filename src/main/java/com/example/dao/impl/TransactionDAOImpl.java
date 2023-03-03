package com.example.dao.impl;

import com.example.dao.TransactionDAO;
import com.example.entity.Transaction;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAOImpl implements TransactionDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;
    ResultSet rs = null;

    @Override
    public List<Transaction> getAll() {
        String query = "select * from transaction";
        List<Transaction> listTrans = new ArrayList<>();
        try {
            conn = connectDB.getConnection();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                listTrans.add(new Transaction(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3), //name
                        rs.getString(4), //mail
                        rs.getString(5), // phone
                        rs.getString(6), //add
                        rs.getString(7), // countrey
                        rs.getString(8), //city
                        rs.getString(9), // ziupi
                        rs.getString(10), //pay
                        rs.getDouble(11)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listTrans;
    }

    @Override
    public Transaction getLatest() {
        String query = "select * from transaction order by id desc limit 1";
        Transaction transaction = null;
        try {
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if (rs.next()) {
                transaction = new Transaction(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3), //name
                        rs.getString(4), //mail
                        rs.getString(5), // phone
                        rs.getString(6), //add
                        rs.getString(7), // countrey
                        rs.getString(8), //city
                        rs.getString(9), // ziupi
                        rs.getString(10), //pay
                        rs.getDouble(11)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transaction;
    }

    @Override
    public boolean insert(Transaction transaction) {
        String query = "insert into transaction values(?,?,?,?,?,?,?,?,?,?,?)";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, transaction.getId());
            pstm.setInt(2, transaction.getUser_id());
            pstm.setString(3, transaction.getName());
            pstm.setString(4, transaction.getEmail());
            pstm.setString(5, transaction.getPhone_number());
            pstm.setString(6, transaction.getAddress1());
            pstm.setString(7, transaction.getCountry());
            pstm.setString(8, transaction.getCity());
            pstm.setString(9, transaction.getZipcode());
            pstm.setString(10, transaction.getPayment());
            pstm.setDouble(11, transaction.getTotal());
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
