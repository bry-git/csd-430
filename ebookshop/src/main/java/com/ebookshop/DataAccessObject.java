package com.ebookshop;

import java.util.ArrayList;
import java.util.List;

public class DataAccessObject {

    public DataAccessObject() {}

    public List<Book> mockGetBooks() {
        List<Book> books = new ArrayList<>();
        books.add(new Book("harry potter and the sorcerors stone", 12.99F, 2));
        books.add(new Book("harry potter and the chamber of secrets", 13.99F, 3));
        books.add(new Book("harry potter and the prizoner of azkaban", 14.50F, 1));
        return books;
    }
}
