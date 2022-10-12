<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Module 3.1</title>
</head>
<body>
<%
    int nums[] = {21, 77, 232, 68, 22, 23, 24, 19, 1234,};

    for (int i = 0; i < nums.length; i++) {
        if (nums[i] % 2 == 0)
            out.print("<br>Even: " + nums[i]);
        else
            out.print("<br>Odd: " + nums[i]);
    }
%>
</body>
</html>