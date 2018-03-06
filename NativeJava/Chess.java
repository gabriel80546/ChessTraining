import java.sql.*;

public class Chess
{
	Connection connection;
	private void displaySQLErrors(SQLException e)
	{
		System.out.println("SQLException: " + e.getMessage());
		System.out.println("SQLState: " + e.getSQLState());
		System.out.println("VendorError: " + e.getErrorCode());
	}
	public Chess()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}
		catch (ClassNotFoundException | InstantiationException | IllegalAccessException e)
		{
			System.err.println("Unable to find and load driver");
			System.exit(1);
		}
	}
	public void connectToDB()
	{
		try
		{
			connection = DriverManager.getConnection("jdbc:mysql://localhost/chess?user=root&password=123456&useSSL=false");

		}
		catch(SQLException e)
		{
			displaySQLErrors(e);
		}
	}
	public void executeSQL() {
		try
		{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM usuario");

			System.out.println("");
			System.out.println("\t\tUSUARIOS");
			System.out.println("\tLogin\t|\tElo ;");
			System.out.println("");
			while (rs.next())
			{
				System.out.print("\t");
				System.out.print(rs.getString("login"));
				System.out.print("\t|\t");
				System.out.print(rs.getString("elo"));
				System.out.println(" ;");
			}
			System.out.println("");
			rs.close();
			statement.close();
			connection.close();
		}
		catch(SQLException e)
		{
			displaySQLErrors(e);
		}
	}
	public static void main(String[] args)
	{
		Chess Hello = new Chess();
		Hello.connectToDB();
		Hello.executeSQL();
	}
}
