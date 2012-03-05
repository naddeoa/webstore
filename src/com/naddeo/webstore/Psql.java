package com.naddeo.webstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Psql {

	Connection conn;
	
	public Psql(){
		
		try{
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost/store";
			conn = DriverManager.getConnection(url,"webadmin", "iAmTheAdmin");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
		}
		catch(ClassNotFoundException e){
			System.out.println(e.getStackTrace());
			System.exit(1);
		}
		
	}
	
	public ResultSet sql(String statement){
		try{
			Statement s = conn.createStatement();
			return s.executeQuery(statement);
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
			return null;
		}
		
	}
	
}
