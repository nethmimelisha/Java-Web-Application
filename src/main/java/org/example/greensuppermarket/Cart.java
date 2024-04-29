package org.example.greensuppermarket;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Cart {
    private List<Product> items;
    private int totalItems;
    private int totalPrice;

    public Cart(Product[] items, int totalItems, int totalPrice) {
        this.items = new ArrayList<>(Arrays.asList(items)); // Convert array to list
        this.totalItems = totalItems;
        this.totalPrice = totalPrice;
    }
    public Cart() {
        this.items = new ArrayList<>();
        this.totalItems = 0;
        this.totalPrice = 0;
    }
    public List<Product> getItems() {
        return items;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setItems(List<Product> items) {
        this.items = items;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    public void addToCart(Product product, int quantity) {
        items.add(product);
        totalItems += quantity;
        totalPrice += product.getPrice() * quantity;
    }

    public void removeFromCart(Product product, int quantity) {
        items.remove(product);
        totalItems -= quantity;
        totalPrice -= product.getPrice() * quantity;
    }

    public Product getProductById(int productId) {
        for (Product product : items) {
            if (product.getId() == productId) {
                return product;
            }
        }
        return null;
    }

}
