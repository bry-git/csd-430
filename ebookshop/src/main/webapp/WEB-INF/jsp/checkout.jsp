<%@page language="java" contentType="text/html"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page session="true" import="java.util.Vector, com.ebookshop.Book"%>
<%@ page import="com.ebookshop.Book" %>
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
<button onclick="window.location.href='http://localhost:8080/books';">Book Catalogue</button>
</body>
</html>
