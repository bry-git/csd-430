package com.ebookshop;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DataAccessObject {
    String dbUrl;

    public DataAccessObject() {
        this.dbUrl = "jdbc:mysql://localhost:3306/shop?user=root&password=password";
    }

    public List<Book> getBooks() {
        List<Book> books = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(this.dbUrl);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM books");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                books.add(
                    new Book(
                           rs.getString("title"),
                           rs.getString("author"),
                           rs.getFloat("price"),
                           rs.getInt("quantity")
                    )
                );
            };
        } catch (Exception e) {
            System.out.println(e);
        }
        return books;
    }

}
