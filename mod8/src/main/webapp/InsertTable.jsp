<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Insert Table</title>
</head>
<body>
<script>
  window.onload = () => {
    var requestOptions = {
      method: 'GET',
    };

    fetch("http://localhost:8080/insert", requestOptions)
            .then(response => response.text())
  }
</script>
<h1>success</h1>
</body>
</html>
