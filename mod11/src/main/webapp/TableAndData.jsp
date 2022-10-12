<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 11 Assignment</title>
    </head>
    <body>
        <%
            java.sql.Connection con = null;
            java.sql.Statement stmt = null;
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = java.sql.DriverManager.getConnection("jdbc:mysql://db:3306/?user=root&password=password&useSSL=false");
                stmt = con.createStatement();
                String dropDB = "DROP DATABASE IF EXISTS btn";
                stmt.executeUpdate(dropDB);
                String createDB = "CREATE DATABASE btn";
                stmt.executeUpdate(createDB);
                out.println("<b>Database 'btn' created sucessfully.</b><br />");
            } 
            catch(Exception e) {
                out.println("<b>Database not created, an error occurred.</b><br />");
            }
            
            try{                
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = java.sql.DriverManager.getConnection("jdbc:mysql://db:3306/btn?user=root&password=password&useSSL=false");
                stmt = con.createStatement();
            }
            catch(Exception e){
                out.println("<h2>Error connection to database.</h2><br />");
            }
            
            try{
                stmt.executeUpdate("DROP TABLE BTN_Stadiums");
                out.println("<b>Table Stadiums Dropped</b><br />");
            }
            catch(java.sql.SQLException e){                
                out.println("<b>Table Stadiums does not exist</b><br />");
            }
            
            try{
                stmt.executeUpdate("CREATE TABLE BTN_Stadiums(Stadium CHAR(100) NOT NULL, School CHAR(100) NOT NULL PRIMARY KEY, City CHAR(40) NOT NULL, State CHAR(40) NOT NULL, Yr_Open CHAR(4) NOT NULL, Capacity CHAR(6) NOT NULL, Lgst_Crowd_Opponent CHAR (100) NOT NULL, Lgst_Crowd_Yr CHAR(4) NOT NULL, Lgst_Crowd CHAR(6) NOT NULL)");
                out.println("<b>Table Stadiums Created</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Table Stadiums Creation failed</b><br />");
            }
            
            try{
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Ryan Field', 'Northwestern University', 'Evanston', 'IL', '1926', '47130', 'Notre Dame', '1962', '55752')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('TCF Bank Stadium', 'University of Minnesota - Twin Cities', 'Minneapolis', 'MN', '2009', '50805', 'Wisconsin', '2013', '53090')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('SHI Stadium', 'Rutgers University', 'Piscataway', 'NJ', '1994', '52454', 'Cincinnati', '2009', '52737')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Memorial Stadium', 'Indiana University - Bloomington', 'Bloomington', 'IN', '1960', '52626', 'Purdue', '1969', '56223')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Capital One Field at Maryland Stadium', 'University of Maryland - College Park', 'College Park', 'MD', '1950', '54000', 'Penn State', '1975', '58973')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Ross-Ade Stadium', 'Purdue University', 'West Lafayette', 'IN', '1924', '57236', 'Indiana', '1980', '71629')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Memorial Stadium', 'University of Illinois - Urbana-Champaign', 'Champaign', 'IL', '1923', '60670', 'Missouri', '1984', '78297')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Kinnick Stadium', 'University of Iowa', 'Iowa City', 'IA', '1929', '69250', 'Purdue', '2012', '70585')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Spartan Stadium', 'Michigan State University', 'East Lansing', 'MI', '1923', '75005', 'Notre Dame', '1990', '80401')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Camp Randall Stadium', 'University of Wisconsin - Madison', 'Madison', 'WI', '1895', '80321', 'Iowa', '2005', '83184')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Memorial Stadium', 'University of Nebraska - Lincoln', 'Lincoln', 'NE', '1923', '85548', 'Miami', '2014', '91585')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Ohio Stadium', 'Ohio State University', 'Columbus', 'OH', '1922', '102780', 'Nebraska', '2012', '106102')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Beaver Stadium', 'Pennsylvania State University', 'University Park', 'PA', '1960', '106572', 'Ohio State', '2018', '110889')");
                stmt.executeUpdate("INSERT INTO BTN_Stadiums(Stadium, School, City, State, Yr_Open, Capacity, Lgst_Crowd_Opponent, Lgst_Crowd_Yr, Lgst_Crowd)VALUES('Michigan Stadium', 'University of Michigan', 'Ann Arbor', 'MI', '1927', '107601', 'Notre Dame', '2013', '115109')");
                
                
                stmt.executeUpdate("COMMIT");
                
                out.println("<b>Data Inserted</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Error inserting data</b><br />");
            }
            try{
                stmt.close();
                con.close();
                out.println("<b>Database connections closed</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Connection close failed</b><br />");
            }
        %>
        <br /><br />
        <a href='index.html'>Back to Main Page</a>
        
    </body>
</html>