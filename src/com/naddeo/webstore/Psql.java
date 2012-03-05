package com.naddeo.webstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Psql {

	Connection admin;
	Connection store;
	
	
	protected String genBookHtml(String title, String author, String ed, String price, String desc, String url){
		String book = "<div class='item'>"
				+"			<div class='left'>"
				+"				<img alt='item' src='" + url + "' height='200' width='200'>"
				+"				<div class='clear'></div>"
				+"				<input type='button' value='add to cart'/>"
				+"			</div>"
				+"			<div class='details'>"
				+"				<p><span>Title:</span> " + title  + "</p>"
				+"				<p><span>Edition:</span> " + ed  + "</p>"
				+"				<p><span>Author:</span> " + author  + "</p>"
				+"				<p><span>Price:</span> " + price  + "</p>"
				+"				<p>" + desc  + "</p>"
				+"			</div>"
				+"		</div>"
				+"		<div class='clear'></div>";
		return book;
	}
	
	public Psql(){
		
		try{
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost/store";
			admin = DriverManager.getConnection(url,"webadmin", "iAmTheAdmin");
			store = DriverManager.getConnection(url,"webstore", "store4you");
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
		}
		catch(ClassNotFoundException e){
			System.out.println(e.getStackTrace());
			System.exit(1);
		}
		
	}
	
	public ResultSet sql(String querry, String user){
		Connection conn = user == "admin" ? admin : store;
		
		try{
			Statement s = conn.createStatement();
			return s.executeQuery(querry);
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
			return null;
		}
		
	}
	
	public String getBooksHtml(String querry){
		
		ResultSet rs = sql(querry, "store");
		String books = new String();
		
		try{
			while(rs.next()){
				String s = genBookHtml(rs.getString("title"), 
						rs.getString("author"), 
						String.valueOf(rs.getString("edition")), 
						rs.getString("price"), 
						rs.getString("description"), 
						rs.getString("image"));
				System.out.println(s);
				books += s;
			}
			return books;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
		}
		
		return null;
	}
	
}
