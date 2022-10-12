<%@page language="java" contentType="text/html" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@ page import="com.ebookshop.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <title>E-bookshop</title>
    <style type="text/css">
        body {font-size: 10pt;}
        H1 {font-size: 20pt;}
        table {background-color: white;}
    </style>
</head>
<body>
<H1>Books list</H1>

<form name="checkout" action="/books" method="POST">
    <table border="1" cellpadding="2">
        <tr>
            <td>TITLE</td>
            <td>PRICE</td>
            <td>QUANTITY</td>
            <td></td>
        </tr>
            <% HttpSession sesssion = request.getSession();
            if(request.getAttribute("books") != null) {
                List<Book> books = (List<Book>) request.getAttribute("books");
                for(int i = 0; i < books.size(); i++) {
                    out.println("" +
"            <tr>\n" +
"                <td>\n" +
"                    "+ books.get(i).getTitle() +
"                </td>\n" +
"                <td>\n" +
"                    "+ books.get(i).getPrice() +
"                </td>\n" +
"                <td>\n" +
"                    "+ books.get(i).getQuantity() +
"                </td>\n" +
"                <td>\n" +
"                    <input type=\"hidden\" name=\"book\" value=\""+books.get(i).getTitle()+"\">\n" +
"                </td>\n" +
"                <td>\n" +
"                    <input onclick=\"window.location.href='http://localhost:8080/books';\" type=\"submit\" value=\"Submit\">\n" +
"                </td>\n" +
"            </tr>");
                }
            } sesssion.invalidate();
        %>
    </table>
</form>
<button onclick="window.location.href='http://localhost:8080/cart';">My Shopping Cart</button>
</body>
</html>
