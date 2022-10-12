<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teams</title>
</head>
<body>
<style>
    table, th, td {
        border: 1px solid;
    }
</style>
<script>
    let books = []

    window.onload = async () => {
        const data = await fetch("http://localhost:8080/teams")
        books = JSON.parse(await data.text())

        console.log(books)

    const table = document.getElementById("teams-table")
    books.forEach((t) => {
        let row = document.createElement("tr")
        let c1 = document.createElement("td")
        let c2 = document.createElement("td")
        let c3 = document.createElement("td")
        let c4 = document.createElement("td")
        let c5 = document.createElement("td")
        let c6 = document.createElement("td")

        c1.innerHTML = t.teamID
        c2.innerHTML = t.team
        c3.innerHTML = t.city
        c4.innerHTML = t.yearT
        c5.innerHTML = t.loserTeam
        c6.innerHTML = t.loserCity

        row.appendChild(c1)
        row.appendChild(c2)
        row.appendChild(c3)
        row.appendChild(c4)
        row.appendChild(c5)
        row.appendChild(c6)
        table.appendChild(row)
    })
    }

</script>
<h1>Baseball team series records</h1>
<table id="teams-table">
    <tr>
        <th>Id</th>
        <th>Winning Team</th>
        <th>City</th>
        <th>Year</th>
        <th>Losing Team</th>
        <th>Losing City</th>
    </tr>
</table>


</body>
</html>
