package com.example.dao;

import com.example.entity.Transaction;

import java.util.List;

public interface TransactionDAO {
    List<Transaction> getAll();
    Transaction getLatest();

    boolean insert(Transaction transaction);
}
