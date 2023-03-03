package com.example.jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
public class connectDB {
    private static String dbPrefix = "jdbc:mysql://localhost";
    private static String dbuser = "root";
    private static String dbpass = "123Hieu123@";
    private static String dbPort = "3306";
    private static String dbName = "qlbh";
    public static Connection getConnection() {
        Connection conn = null;
        String dbURL = dbPrefix + ":" + dbPort + "/" + dbName;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbuser, dbpass);
            System.out.println("Connect DB successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

//    public static void main(String[] args) {
//        new connectDB().getConnection();
//    }
}
