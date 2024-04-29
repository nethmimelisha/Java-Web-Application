package org.example.greensuppermarket;

public class Order {
    private User user;
    private Cart cart;
    private String address;
    private String date;
    private int subtotal;
    private int tax;
    private int total;

    public Order(User user, Cart cart, String address, String date, int total, int subtotal, int tax) {
        this.user = user;
        this.cart = cart;
        this.address = address;
        this.date = date;
        this.subtotal = subtotal;
        this.tax = tax;
        this.total = total;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }
}
