package com.example.entity;

public class Transaction {
    private int id; //id transaction
    private int user_id; // nguoi thuc hien transaction
    private String name; //nguoi nhan hang
    private String email;
    private String phone_number;
    private String address1;
    private String country;
    private String city;
    private String zipcode;
    private String payment;
    private double total;
    public Transaction() {
    }

    public Transaction(int id, int user_id, String name, String email, String phone_number, String address1, String country, String city, String zipcode, String payment, double total) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.phone_number = phone_number;
        this.address1 = address1;
        this.country = country;
        this.city = city;
        this.zipcode = zipcode;
        this.payment = payment;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
