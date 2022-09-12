package com.ebookshop;

public class Book {
    String title;
    float price;
    int quantity;

    public Book(String t, float p, int q) {
        title = t;
        price = p;
        quantity = q;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}