<%@page language="java" contentType="text/html"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page session="true" import="java.util.Vector, com.ebookshop.Book"%>
<%@ page import="com.ebookshop.Book" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>E-bookshop</title>
    <style type="text/css">
        body {font-size:10pt;}
        H1 {font-size:20pt;}
        table {background-color:white;}
    </style>
</head>
<body>
<H1>Checkout</H1>
<H1>My Shopping Cart</H1>
<table border="1" cellpadding="2">
    <tr>
        <td>TITLE</td>
        <td>PRICE</td>
        <td>QUANTITY</td>
        <td></td>
    </tr>
    <%if(request.getAttribute("cart") != null ){
        List<Book> cart = (List<Book>) request.getAttribute("cart");
        for(Book b : cart) {
            out.println(b.toString());
        }}%>
</table>
<button onclick="window.location.href='http://localhost:8080/books';">Book Catalogue</button>
</body>
</html>
