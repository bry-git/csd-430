package beans;

public class DatabaseBean implements java.io.Serializable {
	java.sql.Connection con = null;
	java.sql.Statement stmt = null;
	java.sql.ResultSet resultSet = null;
	public DatabaseBean() {
	}
	
	public java.sql.ResultSet getResults(String SQL) throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = java.sql.DriverManager.getConnection("jdbc:mysql://db:3306/btn?user=root&password=password&useSSL=false");
			stmt = con.createStatement();
		}
		catch(java.sql.SQLException e) {
		}

		try {
			resultSet = stmt.executeQuery(SQL);
		}
		catch(java.sql.SQLException e) {
		}
		return resultSet;
	}
	
	public void closeConnection() {
		try {
			stmt.close();
			con.close();
		}
		catch(java.sql.SQLException e) {
		}
	}
}