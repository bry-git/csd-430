<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Module 3.2</title>
</head>
<body>
<%
    String strings[] = { "dog", "cat", "bird", "mouse", "lizard", "spider"};
    for(String s : strings )
    {
        out.print("<br>"+strings);
    }
%>
</body>
</html>
