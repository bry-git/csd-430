<%@ page import="java.util.ArrayList" language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Module 4.2</title>
</head>
<body>
<h1>JSP user input sample</h1>
<hr/>
<br/>
<%if (request.getMethod().equals("GET")) {%>
<form method="post" action="crandall-jsp-41.jsp">
    Username <input type="text" name="username" maxlength="64"><br/>
    Email <input type="text" name="email" maxlength="64"><br/>
    Password <input type="text" name="password" maxlength="64"><br/>
    <input type="submit" value="Submit">
</form>

<%
    }
    if (request.getMethod().equals("POST")) {
%>
<%--wanted to try this out i know this op should happen on the client request side i just dont know how to make it work there yet--%>
<%
    String password = request.getParameter("password");

    SecureRandom random = new SecureRandom();
    byte[] salt = new byte[16];
    random.nextBytes(salt);

    MessageDigest md = null;
    try {
        md = MessageDigest.getInstance("SHA-512");
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    assert md != null;
    md.update(salt);

    byte[] hashedPassword = md.digest(password.getBytes(StandardCharsets.UTF_8));
%>

<h3>New user created</h3>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Password Hash</th>
    </tr>
    <tr>
        <th><%=request.getParameter("username")%>
        </th>
        <th><%=request.getParameter("email")%>
        </th>
        <th><%=hashedPassword%>
        </th>
    </tr>
</table>
<%} %>

</body>
</html>