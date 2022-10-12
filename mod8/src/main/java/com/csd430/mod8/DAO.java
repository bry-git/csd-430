package com.csd430.mod8;

import javax.naming.CommunicationException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    private String URL;

    public DAO() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/baseball?user=root&password=password&useSSL=false");
            this.URL = "jdbc:mysql://db:3306/baseball?user=root&password=password&useSSL=false";
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("looks like environment is not containerized, trying local");
            this.URL = "jdbc:mysql://localhost:3306/baseball?user=root&password=password&useSSL=false";
        }
    }

    public void createBaseballTeamTable() {
        try {
            Connection con = DriverManager.getConnection(this.URL);
            Statement st = con.createStatement();
            String sql = "CREATE TABLE IF NOT EXISTS teams " +
                    "(" +
                    "team_id BIGINT NOT NULL AUTO_INCREMENT, " +
                    "team VARCHAR(64) NOT NULL, " +
                    "city VARCHAR(64) NOT NULL, " +
                    "year_t VARCHAR(32) NOT NULL UNIQUE , " +
                    "loser_team VARCHAR(64) NOT NULL, " +
                    "loser_city VARCHAR(32) NOT NULL, " +
                    "PRIMARY KEY (team_id)" +
                    ");";
            st.execute(sql);
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean addTeams() {
        try {
            Connection con = DriverManager.getConnection(this.URL);
            String sql = "INSERT INTO teams (team, city, year_t, loser_team, loser_city) " +
                    "VALUES " +
                    "('Red Sox', 'Boston', 1903, 'Pirates', 'Pittsburgh'), " +
                    "('Red Sox', 'Boston', 1904, 'Pirates', 'Pittsburgh'), " +
                    "('Giants', 'New York', 1905, 'Athletics', 'Philadelphia'), " +
                    "('White Sox', 'Chicago', 1906, 'Cubs', 'Chicago'), " +
                    "('Cubs', 'Chicago', 1907, 'Tigers', 'Detroit'), " +
                    "('Cubs', 'Chicago', 1908, 'Tigers', 'Detroit'), " +
                    "('Pirates', 'Pittsburgh', 1909, 'Tigers', 'Detroit'), " +
                    "('Athletics', 'Philadelphia', 1910, 'Cubs', 'Chicago'), " +
                    "('Athletics', 'Philadelphia', 1911, 'Giants', 'New York'), " +
                    "('Red Sox', 'Boston', 1912, 'Giants', 'New York'), " +
                    "('Athletics', 'Philadelphia', 1913, 'Giants', 'New York'), " +
                    "('Braves', 'Boston', 1914, 'Athletics', 'Philadelphia'), " +
                    "('Red Sox', 'Boston', 1915, 'Phillies', 'Philadelphia'), " +
                    "('Red Sox', 'Boston', 1916, 'Robins', 'Brooklyn'), " +
                    "('White Sox', 'Chicago', 1917, 'Giants', 'New York'), " +
                    "('Red Sox', 'Boston', 1918, 'Cubs', 'Chicago'), " +
                    "('Reds', 'Cincinnati', 1919, 'White Sox', 'Chicago'), " +
                    "('Indians', 'Cleveland', 1920, 'Robins', 'Brooklyn'), " +
                    "('Giants', 'New York', 1921, 'Yankees', 'New York'), " +
                    "('Giants', 'New York', 1922, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1923, 'Giants', 'New York'), " +
                    "('Senators', 'Washington', 1924, 'Giants', 'New York'), " +
                    "('Pirates', 'Pittsburgh', 1925, 'Nationals', 'Wasnington'), " +
                    "('Cardinals', 'St. Louis', 1926, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1927, 'Pirates', 'Pittsburgh'), " +
                    "('Yankees', 'New York', 1928, 'Cardinals', 'St. Louis'), " +
                    "('Athletics', 'Philadelphia', 1929, 'Cubs', 'Chicago'), " +
                    "('Athletics', 'Philadelphia', 1930, 'Cardinals', 'St. Louis'), " +
                    "('Cardinals', 'St. Louis', 1931, 'Athletics', 'Philadelphia'), " +
                    "('Yankees', 'New York', 1932, 'Cubs', 'Chicago'), " +
                    "('Giants', 'New York', 1933, 'Nationals', 'Wasnington'), " +
                    "('Cardinals', 'St. Louis', 1934, 'Tigers', 'Detroit'), " +
                    "('Tigers', 'Detroit', 1935, 'Cubs', 'Chicago'), " +
                    "('Yankees', 'New York', 1936, 'Giants', 'New York'), " +
                    "('Yankees', 'New York', 1937, 'Giants', 'New York'), " +
                    "('Yankees', 'New York', 1938, 'Cubs', 'Chicago'), " +
                    "('Yankees', 'New York', 1939, 'Reds', 'Cincinnati'), " +
                    "('Reds', 'Cincinnati', 1940, 'Tigers', 'Detroit'), " +
                    "('Yankees', 'New York', 1941, 'Dodgers', 'Brooklyn'), " +
                    "('Cardinals', 'St. Louis', 1942, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1943, 'Cardinals', 'St. Louis'), " +
                    "('Cardinals', 'St. Louis', 1944, 'Browns', 'St. Louis'), " +
                    "('Tigers', 'Detroit', 1945, 'Cubs', 'Chicago'), " +
                    "('Cardinals', 'St. Louis', 1946, 'Red Sox', 'Boston'), " +
                    "('Yankees', 'New York', 1947, 'Dodgers', 'Brooklyn'), " +
                    "('Indians', 'Cleveland', 1948, 'Braves', 'Boston'), " +
                    "('Yankees', 'New York', 1949, 'Dodgers', 'Brooklyn'), " +
                    "('Yankees', 'New York', 1950, 'Phillies', 'Philadelphia'), " +
                    "('Yankees', 'New York', 1951, 'Giants', 'New York'), " +
                    "('Yankees', 'New York', 1952, 'Dodgers', 'Brooklyn'), " +
                    "('Yankees', 'New York', 1953, 'Dodgers', 'Brooklyn'), " +
                    "('Giants', 'New York', 1954, 'Indians', 'Cleveland'), " +
                    "('Dodgers', 'Brooklyn', 1955, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1956, 'Dodgers', 'Brooklyn'), " +
                    "('Braves', 'Milwaukee', 1957, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1958, 'Braves', 'Milwaukee'), " +
                    "('Dodgers', 'Los Angeles', 1959, 'White Sox', 'Chicago'), " +
                    "('Pirates', 'Pittsburgh', 1960, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1961, 'Reds', 'Cincinnati'), " +
                    "('Yankees', 'New York', 1962, 'Giants', 'San Francisco'), " +
                    "('Dodgers', 'Los Angeles', 1963, 'Yankees', 'New York'), " +
                    "('Cardinals', 'St. Louis', 1964, 'Yankees', 'New York'), " +
                    "('Dodgers', 'Los Angeles', 1965, 'Twins', 'Minnesota'), " +
                    "('Orioles', 'Baltimore', 1966, 'Dodgers', 'Los Angeles'), " +
                    "('Cardinals', 'St. Louis', 1967, 'Red Sox', 'Boston'), " +
                    "('Tigers', 'Detroit', 1968, 'Cardinals', 'St. Louis'), " +
                    "('Mets', 'New York', 1969, 'Orioles', 'Baltimore'), " +
                    "('Orioles', 'Baltimore', 1970, 'Reds', 'Cincinnati'), " +
                    "('Pirates', 'Pittsburgh', 1971, 'Orioles', 'Baltimore'), " +
                    "('Athletics', 'Oakland', 1972, 'Reds', 'Cincinnati'), " +
                    "('Athletics', 'Oakland', 1973, 'Mets', 'New York'), " +
                    "('Athletics', 'Oakland', 1974, 'Dodgers', 'Los Angeles'), " +
                    "('Reds', 'Cincinnati', 1975, 'Red Sox', 'Boston'), " +
                    "('Reds', 'Cincinnati', 1976, 'Yankees', 'New York'), " +
                    "('Yankees', 'New York', 1977, 'Dodgers', 'Los Angeles'), " +
                    "('Yankees', 'New York', 1978, 'Dodgers', 'Los Angeles'), " +
                    "('Pirates', 'Pittsburgh', 1979, 'Orioles', 'Baltimore'), " +
                    "('Phillies', 'Philadelphia', 1980, 'Royals', 'Kansas City'), " +
                    "('Dodgers', 'Los Angeles', 1981, 'Yankees', 'New York'), " +
                    "('Cardinals', 'St. Louis', 1982, 'Brewers', 'Milwaukee'), " +
                    "('Orioles', 'Baltimore', 1983, 'Phillies', 'Philadelphia'), " +
                    "('Tigers', 'Detroit', 1984, 'Padres', 'San Diego'), " +
                    "('Royals', 'Kansas City', 1985, 'Cardinals', 'St. Louis'), " +
                    "('Mets', 'New York', 1986, 'Red Sox', 'Boston'), " +
                    "('Twins', 'Minnesota', 1987, 'Cardinals', 'St. Louis'), " +
                    "('Dodgers', 'Los Angeles', 1988, 'Athletics', 'Oakland'), " +
                    "('Athletics', 'Oakland', 1989, 'Giants', 'San Francisco'), " +
                    "('Reds', 'Cincinnati', 1990, 'Athletics', 'Oakland'), " +
                    "('Twins', 'Minnesota', 1991, 'Braves', 'Atlanta'), " +
                    "('Blue Jays', 'Toronto', 1992, 'Braves', 'Atlanta'), " +
                    "('Blue Jays', 'Toronto', 1993, 'Phillies', 'Philadelphia'), " +
                    "('Braves', 'Atlanta', 1995, 'Indians', 'Cleveland'), " +
                    "('Yankees', 'New York', 1996, 'Braves', 'Atlanta'), " +
                    "('Marlins', 'Florida', 1997, 'Indians', 'Cleveland'), " +
                    "('Yankees', 'New York', 1998, 'Padres', 'San Diego'), " +
                    "('Yankees', 'New York', 1999, 'Braves', 'Atlanta'), " +
                    "('Yankees', 'New York', 2000, 'Mets', 'New York'), " +
                    "('Diamondbacks', 'Arizona', 2001, 'Yankees', 'New York'), " +
                    "('Angels', 'Anaheim', 2002, 'Giants', 'San Francisco'), " +
                    "('Marlins', 'Florida', 2003, 'Yankees', 'New York'), " +
                    "('Red Sox', 'Boston', 2004, 'Cardinals', 'St. Louis'), " +
                    "('White Sox', 'Chicago', 2005, 'Astros', 'Houston'), " +
                    "('Cardinals', 'St. Louis', 2006, 'Tigers', 'Detroit'), " +
                    "('Red Sox', 'Boston', 2007, 'Rockies', 'Colorado'), " +
                    "('Phillies', 'Philadelphia', 2008, 'Rays', 'Tampa Bay'), " +
                    "('Yankees', 'New York', 2009, 'Phillies', 'Philadelphia'), " +
                    "('Giants', 'San Francisco', 2010, 'Rangers', 'Texas'), " +
                    "('Cardinals', 'St. Louis', 2011, 'Rangers', 'Texas'), " +
                    "('Giants', 'San Francisco', 2012, 'Tigers', 'Detroit'), " +
                    "('Red Sox', 'Boston', 2013, 'Cardinals', 'St. Louis'), " +
                    "('Giants', 'San Francisco', 2014, 'Royals', 'Kansas City'), " +
                    "('Royals', 'Kansas City', 2015, 'Mets', 'New York'), " +
                    "('Cubs', 'Chicago', 2016, 'Indians', 'Cleveland'), " +
                    "('Astros', 'Houston', 2017, 'Dodgers', 'Los Angeles'), " +
                    "('Red Sox', 'Boston', 2018, 'Dodgers', 'Los Angeles'), " +
                    "('Nationals', 'Washington', 2019, 'Astros', 'Houston'), " +
                    "('Dodgers', 'Los Angeles', 2020, 'Rays', 'Tampa Bay');";
            Statement st = con.createStatement();
            st.execute(sql);
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<BaseballTeam> getAllTeams() {
        List<BaseballTeam> teams = new ArrayList<>();
        try {
            Connection con = DriverManager.getConnection(this.URL);
            String sql = "SELECT * FROM teams;";
            Statement st = con.createStatement();
            st.execute(sql);
            ResultSet rs = st.getResultSet();
            while(rs.next()) {
                teams.add(
                        new BaseballTeam(
                                rs.getLong("team_id"),
                                rs.getString("team"),
                                rs.getString("city"),
                                rs.getString("year_t"),
                                rs.getString("loser_team"),
                                rs.getString("loser_city")
                        )
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return teams;
    }

    public boolean addTeam(List<BaseballTeam> teams) {
        boolean success = false;
        BaseballTeam team = teams.get(0);
        try {
            Connection con = DriverManager.getConnection(this.URL);
            Statement st = con.createStatement();
            String sql = "INSERT INTO teams (team, city, year_t, loser_team, loser_city) " +
                    "VALUES ('"+team.getTeam()+"', '"+team.getCity()+"', '"+team.getYearT()+"', '"+team.getLoserTeam()+"', '"+team.getLoserCity()+"';)";
            st.execute(sql);
            con.close();
            success = true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return success;
    }
}
