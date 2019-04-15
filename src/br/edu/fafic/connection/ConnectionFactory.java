/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fafic.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionFactory {

	private static ConnectionFactory connectionFactory;
	private static final String DRIVER = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://localhost:5432/academico";
	private static final String USER = "postgres";
	private static final String PASS = "ingrid";

	private ConnectionFactory() {

	}

	public static ConnectionFactory getConnectionFactory() {
		if (connectionFactory == null) {
			connectionFactory = new ConnectionFactory();
		}

		return connectionFactory;
	}

	public Connection getConnection() {
		try {
			Class.forName(DRIVER);
			return DriverManager.getConnection(URL, USER, PASS);
		} catch (ClassNotFoundException | SQLException ex) {
			throw new RuntimeException("Erro na conexao!", ex);

		}
	}

	public static void closeConnection(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection(Connection con, PreparedStatement ps) {
		closeConnection(con);
		try {
			if (ps != null) {
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection(Connection con, PreparedStatement ps, ResultSet rs) {
		closeConnection(con, ps);
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
