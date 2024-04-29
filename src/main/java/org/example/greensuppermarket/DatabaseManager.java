package org.example.greensuppermarket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class DatabaseManager {
    private static final String URL = "jdbc:mysql://localhost:3306/GreenSuperMarket";
    private static final String USERNAME = "User";
    private static final String PASSWORD = "user";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public List<User> getUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM User";
        try (Connection conn = getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int Id = rs.getInt("Id");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                int phoneNumber = rs.getInt("phoneNumber");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                User user = new User(Id, fullName, email, phoneNumber, userName, password);
                userList.add(user);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            out.print(ex);
        }
        return userList;
    }

    public List<Product> getProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int Id = rs.getInt("Id");
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                String image = rs.getString("ImagePath");
                String category = rs.getString("Category");
                int quantity = rs.getInt("Quantity");
                Product product = new Product(Id, name, description, price, image, category, quantity);
                productList.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.print(ex);
        }
        return productList;
    }
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                out.print(e);
            }
        }
    }
}
