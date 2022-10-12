<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <script>
        window.onload = () => {
            var requestOptions = {
                method: 'GET',
            };

            fetch("http://localhost:8080/books", requestOptions)
                .then(response => response.text())
        }
    </script>
    <style type="text/css">
        body {font-size: 10pt;}
        H1 {font-size: 20pt;}
        table {background-color: white;}
    </style>
    <h1>test</h1>
</body>
</html>