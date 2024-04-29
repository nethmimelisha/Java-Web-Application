package org.example.greensuppermarket;

public class Review {
    private int Id;
    private String Name;
    private String Email;
    private String Message;

    public Review(int id, String name, String email, String message) {
        this.Id = id;
        this.Name = name;
        this.Email = email;
        this.Message = message;
    }

    public Review() {
    }

    public int getId() {
        return Id;
    }
    public String getName() {
        return Name;
    }

    public String getReview() {
        return Email;
    }

    public String getRating() {
        return Message;
    }

    public void setId(int id) {
        Id = id;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setMessage(String message) {
        Message = message;
    }
}
