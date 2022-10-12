<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="tt" uri="WEB-INF/taglib.tld" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Module 11</title>
</head>
<body>
<h1>Football Stadiums Database Search</h1>
<div>
    <%
        if (request.getMethod().equals("POST")) {
    %>
    <tt:TableHeaders/>
    <jsp:useBean id='myDB' class='beans.DatabaseBean'/>

    <%
        out.println("<h2>Your Selection</h2>");

        java.sql.ResultSet resultSet;

        String stadium = request.getParameter("Stadium");

        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Stadium = '" + stadium + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)));
                    out.println("</td>");
                }

                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();

        String school = request.getParameter("School");

        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE School = '" + school + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)));
                    out.println("</td>");
                }

                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String city = request.getParameter("City");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE City = '" + city + "'");

        try {
            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }
                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String state = request.getParameter("State");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE State = '" + state + "'");

        try {
            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }
                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }
        myDB.closeConnection();
        String yearOpened = request.getParameter("Yr_Open");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Yr_Open = '" + yearOpened + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }

                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String capacity = request.getParameter("Capacity");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Capacity = '" + capacity + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");
                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }
                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String lgstCrowdOpponent = request.getParameter("Lgst_Crowd_Opponent");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Lgst_Crowd_Opponent = '" + lgstCrowdOpponent + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }

                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String lgstCrowdYear = request.getParameter("Lgst_Crowd_Yr");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Lgst_Crowd_Yr = '" + lgstCrowdYear + "'");

        try {

            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }

                out.println("</tr>");
            }
        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }

        myDB.closeConnection();
        String lgstCrowd = request.getParameter("Lgst_Crowd");
        resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums WHERE Lgst_Crowd = '" + lgstCrowd + "'");

        try {
            while (resultSet.next()) {
                out.println("<tr>");

                for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                    out.println("<td>");
                    out.print((resultSet.getString(i)).trim());
                    out.println("</td>");
                }

                out.println("</tr>");
            }


        } catch (Exception e) {
            out.println("<b>No results.</b><br />");
        }
        out.println("</table><br /><br />");
        myDB.closeConnection();

    %>
    <tt:TableHeaders/>
    <%
            out.println("<h2>Complete Results</h2>");
            resultSet = myDB.getResults("SELECT * FROM BTN_Stadiums");
            try {
                while (resultSet.next()) {
                    out.println("<tr>");
                    for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                        out.println("<td>");
                        out.print((resultSet.getString(i)).trim());
                        out.println("</td>");
                    }
                    out.println("</tr>");
                }
            } catch (Exception e) {
                out.println("<b>No results.</b><br />");
            }
            out.println("</table>");
            myDB.closeConnection();
        }
    %>

    <%
        if (request.getMethod().equals("GET")) {
    %>

    <form method='post' action='Form.jsp'>
        <input type='text' id='stadium' name='Stadium' size='40' maxlength='40'/>
        <input type='submit' value='Search Results by Stadium'/>&nbsp;&nbsp;&nbsp;
        <label for='stadium'>Search for a Big 10 Conference Stadium by Name</label><br/>
        <input type='text' id='school' name='School' size='40' maxlength='40'/>
        <input type='submit' value='Search Results by School'/>&nbsp;&nbsp;&nbsp;
        <label for='school'>Search for a Big 10 Conference Stadium by School</label><br/>
        <input type='text' id='city' name='City' size='40' maxlength='40'/>
        <input type='submit' value='Search Results by City'/>&nbsp;&nbsp;&nbsp;
        <label for='city'>Search for a Big 10 Conference Stadium by City</label><br/>
        <input type='text' id='state' name='State' size='40' maxlength='3'/>
        <input type='submit' value='Search Results by State'/>
        <label for='state'>Search for a Big 10 Conference Stadium by State (2 Letter Abbreviation)</label><br/>
        <input type='text' id='yearOpened' name='Yr_Open' size='40' maxlength='5'/>
        <input type='submit' value='Search Results by Year Opened'/>&nbsp;&nbsp;&nbsp;
        <label for='yearOpened'>Search for a Big 10 Conference Stadium by the year it opened</label><br/>
        <input type='text' id='capacity' name='Capacity' size='40' maxlength='7'/>
        <input type='submit' value='Search Results by Capacity'/>&nbsp;&nbsp;&nbsp;
        <label for='capacity'>Search for a Big 10 Conference Stadium by Capacity</label><br/>
        <input type='text' id='lgstCrowdOpponent' name='Lgst_Crowd_Opponent' size='40' maxlength='40'/>
        <input type='submit' value='Search Results by Largest Crowd Opponent'/>&nbsp;&nbsp;&nbsp;
        <label for='lgstCrowdOpponent'>Search for a Big 10 Conference Stadium by the Opponent they played in their
            largest crowd ever</label><br/>
        <input type='text' id='lgstCrowdYear' name='Lgst_Crowd_Yr' size='40' maxlength='5'/>
        <input type='submit' value='Search Results by Largest Crowd Year'/>&nbsp;&nbsp;&nbsp;
        <label for='lgstCrowdYear'>Search for a Big 10 Conference Stadium by the Year they played in front of their
            largest crowd</label><br/>
        <input type='text' id='lgstCrowd' name='Lgst_Crowd' size='40' maxlength='40'/>
        <input type='submit' value='Search Results by Largest Crowd Size'/>&nbsp;&nbsp;&nbsp;
        <label for='lgstCrowd'>Search for a Big 10 Conference Stadium by Largest crowd size</label>
    </form>
    <%
        }
    %>
</div>

</body>
</html>