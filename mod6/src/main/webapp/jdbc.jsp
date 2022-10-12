<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import='java.sql.*' %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>JDBC Test</title>
</head>
<body>
<% //connect to database by opening a Connection statement
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = null;
  try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "password");
  } catch (SQLException e) {
    e.printStackTrace();
  }
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("select * from books");
%>

<table border="1">
  <% //step through meta data result set and print columns
    ResultSetMetaData resMetaData = rs.getMetaData();
    int nCols = resMetaData.getColumnCount();

  %>
  <tr>
    <%
      for(int kCol =1; kCol <= nCols; kCol++){
        out.print("<td><b>" + resMetaData.getColumnName(kCol) +
                "</b></td>");
      }
    %>
  </tr>
  <%
    while(rs.next()){
  %>
  <tr>
    <%
      for(int kCol = 1; kCol <= nCols; kCol++){
        out.print("<td>" + rs.getString(kCol) + "</td>");
      }
    %>
  </tr>
  <%
    }
  %>
</table>
<% // close connection object
  conn.close();
%>
</body>
</html>