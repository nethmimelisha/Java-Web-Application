package org.example.greensuppermarket;

import java.util.ArrayList;
import java.util.List;

public class Main {
    private static boolean isDataLoaded = false; // Flag to check if data is loaded
    public static List<User> users = new ArrayList<>();
    public static List<Order> orders = new ArrayList<>();
    public static List<Product> products = new ArrayList<>();
    public static List<Review> reviews = new ArrayList<>();

    public void loadUserDataFromDatabase(){

    }
    public synchronized void loadProductDataFromDatabase() {
        if (!isDataLoaded) { // Check if data is not already loaded
            DatabaseManager db = new DatabaseManager();
            products.clear();

            for (Product product : db.getProducts()) {
                products.add(product);
                System.out.println(product.getName());
                System.out.println(product.getImage());
                System.out.println(products.size());
            }

            isDataLoaded = true; // Set the flag to true after data is loaded
        }
    }
    public static void main(String[] args) {
        Main main = new Main();
//        main.loadUserDataFromDatabase();
//        main.loadProductDataFromDatabase();
    }
}
