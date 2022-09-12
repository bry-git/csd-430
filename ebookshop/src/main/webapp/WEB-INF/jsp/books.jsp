<%@page language="java" contentType="text/html"%>
<%@page trimDirectiveWhitespaces="true"%>
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
<H1>Books list</H1>
<table border="1" cellpadding="2">
    <tr>
        <td>TITLE</td>
        <td>PRICE</td>
        <td>QUANTITY</td>
        <td></td>
    </tr>
        <%if(request.getAttribute("books") != null ){
            List<Book> books = (List<Book>) request.getAttribute("books");
            for(Book b : books) {
                out.println(
                        "<tr>" +
                                "<td>"+b.getTitle()+"</td>" +
                                "<td>"+b.getPrice()+"</td>" +
                                "<td>"+b.getQuantity()+"</td>" +
                                "<td><button>Add to Cart</button></td>" +
                        "</tr>");
            }}%>
</table>
</body>
</html>
