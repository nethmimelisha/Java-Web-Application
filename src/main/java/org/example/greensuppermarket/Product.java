package org.example.greensuppermarket;

public class Product {
    private String name;
    private int price;
    private String description;
    private String image;
    private String category;
    private int Id;
    private int quantity;
    private String total;

    public Product(int Id, String name, String description, int price, String image, String category, int quantity) {
        this.Id = Id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.category = category;
        this.quantity = quantity;
    }

    public Product() {
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public void setId(int id) {
        Id = id;
    }
    public int getId() {
        return Id;
    }
    
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getTotal() {
        return total;
    }
    public void setTotal(String total) {
        this.total = total;
    }
}
