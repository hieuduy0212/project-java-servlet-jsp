package com.example.dao;

import com.example.entity.Account;

import java.util.List;

public interface AccountDAO {
    Account login(String email, String pass);
    int getNumberOfAccount(); //lấy tổng số tài khoản
    boolean register(Account account);
    void editProfile(Account account);
    void editPassword(Account account);
    List<Account> getAll();
    Account getAccountById(int id);
    boolean editAccount(Account account);
    void deleteById(int parseInt);
}
