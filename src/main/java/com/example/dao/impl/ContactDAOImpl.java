package com.example.dao.impl;

import com.example.dao.ContactDAO;
import com.example.entity.Contact;
import com.example.jdbc.connectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ContactDAOImpl implements ContactDAO {
    Connection conn = null;
    PreparedStatement pstm = null;
    Statement stm = null;
    ResultSet rs = null;

    @Override
    public void add(Contact contact) {
        String query = "insert into contact(name, email, subject, message) values(?,?,?,?)";
        try {
            conn = connectDB.getConnection();
            pstm = conn.prepareStatement(query);
            pstm.setString(1, contact.getName());
            pstm.setString(2, contact.getEmail());
            pstm.setString(3, contact.getSubject());
            pstm.setString(4, contact.getMessage());
            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Contact getContactById(int id) {
        String query = "select * from contact where id=" + id;
        Contact contact = null;
        try {
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            if (rs.next()) {
                contact = new Contact(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contact;
    }

    @Override
    public List<Contact> getAllContact() {
        String query = "select * from contact order by id asc";
        List<Contact> lst = new ArrayList<>();
        try {
            conn = connectDB.getConnection();
            stm = conn.createStatement();
            rs = stm.executeQuery(query);
            while (rs.next()) {
                lst.add(new Contact(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }
}
