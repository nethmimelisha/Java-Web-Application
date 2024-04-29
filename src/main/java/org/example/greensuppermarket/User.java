package org.example.greensuppermarket;

public class User {
    private int Id;
    private String fullName;
    private String email;
    private int phoneNumber;
    private String userName;
    private String password;
    private Cart cart;
    public User(int Id, String fullName, String email, int phoneNumber, String userName, String password) {
        this.Id = Id;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userName = userName;
        this.password = password;
    }
    public User() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
