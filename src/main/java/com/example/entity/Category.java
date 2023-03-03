package com.example.entity;

public class Category {
    private int id;
    private String cname;
    private String cimage;

    public Category() {
    }

    public Category(int id, String cname, String cimage) {
        this.id = id;
        this.cname = cname;
        this.cimage = cimage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }

//    @Override
//    public String toString() {
//        return "Category{" +
//                "id=" + id +
//                ", cname='" + cname + '\'' +
//                ", cimage='" + cimage + '\'' +
//                '}';
//    }
}
