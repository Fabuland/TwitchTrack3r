package com.twitchtrack3r.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.twitchtrack3r.model.Streamer;

public class StreamerDao {

	private String jdbcURL = "jdbc:mysql://localhost:3306/twitchtrack3r?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	private static final String insertStreamerSQL = "INSERT INTO streamer"
			+ "  (name, online, subscribers, followers, category_id) VALUES " + " (?, ?, ?, ?, ?);";

	private static final String selectStreamerByID = "select id,name,online,subscribers,followers,category_id from streamer where id = ?";
	private static final String selectAllStreamers = "select * from streamer";
	private static final String deleteStreamerSQL = "delete from streamer where id = ?;";
	private static final String updateStreamerSQL = "update streamer set name = ?, online = ?, subscribers = ?, followers = ?, category_id = ? where id = ?;";

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertStreamer(Streamer streamer) throws SQLException {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(insertStreamerSQL)) {
			preparedStatement.setString(1, streamer.getName());
			preparedStatement.setString(2, streamer.getOnline());
			preparedStatement.setInt(3, streamer.getSubscribers());
			preparedStatement.setInt(4, streamer.getFollowers());
			preparedStatement.setInt(5, streamer.getCategory_id());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public boolean updateStreamer(Streamer streamer) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(updateStreamerSQL);) {
			statement.setString(1, streamer.getName());
			statement.setString(2, streamer.getOnline());
			statement.setInt(3, streamer.getSubscribers());
			statement.setInt(4, streamer.getFollowers());
			statement.setInt(5, streamer.getCategory_id());
			statement.setInt(6, streamer.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public Streamer selectStreamer(int id) {
		Streamer streamer = null;

		try (Connection connection = getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(selectStreamerByID);) {
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String online = rs.getString("online");
				int subscribers = rs.getInt("subscribers");
				int followers = rs.getInt("followers");
				int category_id = rs.getInt("category_id");
				streamer = new Streamer(id, name, online, subscribers, followers, category_id);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return streamer;
	}
	
	public List<Streamer> selectAllStreamers() {

		List<Streamer> streamers = new ArrayList<>();
		try (Connection connection = getConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(selectAllStreamers);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String online = rs.getString("online");
				int subscribers = rs.getInt("subscribers");
				int followers = rs.getInt("followers");
				int category_id = rs.getInt("category_id");
				streamers.add(new Streamer(id, name, online, subscribers, followers, category_id));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return streamers;
	}
	
	public boolean deleteStreamer(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(deleteStreamerSQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
