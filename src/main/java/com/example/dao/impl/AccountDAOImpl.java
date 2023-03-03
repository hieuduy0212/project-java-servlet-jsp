package com.example.dao.impl;

import com.example.dao.AccountDAO;
import com.example.entity.Account;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AccountDAOImpl implements AccountDAO {
    Connection conn = null;
    Statement stm = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    @Override
    public Account login(String email, String pass) {
        String query = "select * from Account where email=? and password=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, pass);
            rs = pstm.executeQuery();
            if(rs.next()){
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getNumberOfAccount() {
        String query = "select count(*) from Account";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            if (rs.next()){
                return rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean register(Account account) {
        String query = "insert into Account values(?, ?, ?, ?, ?, ?)";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, account.getId());
            pstm.setString(2, account.getName());
            pstm.setString(3, account.getEmail());
            pstm.setString(4, account.getPassword());
            pstm.setString(5, account.getAvatar());
            pstm.setInt(6, account.getIsAdmin());
            int row = pstm.executeUpdate();
            if(row != 0) return true;
        }catch (Exception e){
            return false;
        }
        return false;
    }

    @Override
    public void editProfile(Account account) {
        String query = "update Account set name=?, email=?,image=? where id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, account.getName());
            pstm.setString(2, account.getEmail());
            pstm.setString(3, account.getAvatar());
            pstm.setInt(4, account.getId());
            pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void editPassword(Account account) {
        String query = "update Account set password=? where id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, account.getPassword());
            pstm.setInt(2, account.getId());
            pstm.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Account> getAll() {
        String query = "select * from account";
        List<Account> listAcc = new ArrayList<>();
        try{
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            while(rs.next()){
                listAcc.add(new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6)
                ));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listAcc;
    }

    @Override
    public Account getAccountById(int id) {
        String query = "select * from account where id = ?";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            if(rs.next()){
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean editAccount(Account account) {
        String query = "update account set name=?,email=?,image=? where id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, account.getName());
            pstm.setString(2, account.getEmail());
            pstm.setString(3, account.getAvatar());
            pstm.setInt(4, account.getId());
            pstm.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            return  false;
        }
        return true;
    }

    @Override
    public void deleteById(int id) {
        String query = "delete from account where id=?";
        try{
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setInt(1, id);
            pstm.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
