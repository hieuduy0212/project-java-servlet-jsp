package com.example.dao;

import com.example.entity.Contact;

import java.util.List;

public interface ContactDAO {
    void add(Contact contact);
    Contact getContactById(int id);
    List<Contact> getAllContact();
}
