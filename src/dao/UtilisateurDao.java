package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Utilisateur;

public class UtilisateurDao
{
	public static int LastId = 0;

	private static final ArrayList<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();

	static
	{
		Connection connection = getConnection();
		if (connection != null)
		{
			try
			{
				Statement stm = connection.createStatement();
				String query = "select * from utilisateurs";
				ResultSet result = stm.executeQuery(query);
				while (result.next())
				{
					Utilisateur user = new Utilisateur(result.getInt("id"), result.getString("nom"),
							result.getString("prenom"), result.getString("login"), result.getString("password"));
					utilisateurs.add(user);
				}

			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
	}

	private static Connection getConnection()
	{
		Connection connection = null;

		String host = "localhost";
		String port = "5432";
		String dbname = "gesusers";
		String username = "postgres";
		String password = "admin";

		try
		{
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://" + host + ":" + port + "/" + dbname + "",
					"" + username + "", "" + password + "");

//			if (connection != null)
//			{
//				System.out.println("OK");
//			}
//			else
//			{
//				System.out.println("fail");
//			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}

	private static boolean closeConnection(Connection connection)
	{
		try
		{
			connection.close();
			return true;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public static boolean ajouter(Utilisateur utilisateur)
	{
		Connection connection = getConnection();
		String query = "insert into utilisateurs (nom, prenom, login, password) values (?, ?, ?, ?)";
		try
		{
			PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, utilisateur.getNom());
			ps.setString(2, utilisateur.getPrenom());
			ps.setString(3, utilisateur.getLogin());
			ps.setString(4, utilisateur.getPassword());
			if (ps.executeUpdate() != 0)
			{
				ResultSet keys = ps.getGeneratedKeys();
				if (keys.next())
				{
					utilisateur.setId(keys.getInt(1));
					utilisateurs.add(utilisateur);
				}
				return true;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeConnection(connection);
		}
		return true;
	}

	public static ArrayList<Utilisateur> lister()
	{
		return utilisateurs;
	}

	public static boolean modifier(Utilisateur utilisateur)
	{
		for (Utilisateur user : utilisateurs)
		{
			if (utilisateur.getId() == user.getId())
			{
				user.setNom(utilisateur.getNom());
				user.setPrenom(utilisateur.getPrenom());
				user.setLogin(utilisateur.getLogin());
				user.setPassword(utilisateur.getPassword());

				Connection connection = getConnection();
				String query = "update utilisateurs set nom=?, prenom=?, login=?, password=? where (id = ?)";
				try
				{
					PreparedStatement ps = connection.prepareStatement(query);
					ps.setString(1, utilisateur.getNom());
					ps.setString(2, utilisateur.getPrenom());
					ps.setString(3, utilisateur.getLogin());
					ps.setString(4, utilisateur.getPassword());

					if (ps.executeUpdate() != 0)
					{ return true; }
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{
					closeConnection(connection);
				}
				return true;
			}
		}

		return false;
	}

	public static boolean supprimer(int id)
	{
		for (Utilisateur utilisateur : utilisateurs)
		{
			if (utilisateur.getId() == id)
			{
				Connection connection = getConnection();
				String query = "delete from utilisateurs where ( id = ? )";
				try
				{
					PreparedStatement ps = connection.prepareStatement(query);
					ps.setInt(1, id);
					if (ps.executeUpdate() != 0)
					{
						utilisateurs.remove(utilisateur);
						return true;
					}
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{
					closeConnection(connection);
				}
			}
		}

		return false;
	}

	public static Utilisateur get(int id)
	{
		for (Utilisateur utilisateur : utilisateurs)
		{
			if (utilisateur.getId() == id)
			{ return utilisateur; }
		}
		return null;

	}

}
