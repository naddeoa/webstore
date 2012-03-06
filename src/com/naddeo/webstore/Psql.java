package com.naddeo.webstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Psql {

	Connection admin;
	Connection store;
	
	public static final int WEBADMIN = 1;
	public static final int WEBSTORE = 2;
	
	/* Small enumeration class to allow departments
	 * to be accessed as Psql.DEPARTMENT.GAMES and
	 * used when building strings for queries. 
	 */
	public static class DEPARTMENTS{
		public static final String BOOKS = "books";
		public static final String GAMES = "games";
	}
	
	/*
	 * Create a Psql object. This constructor will attempt to establish
	 * database connections for the webadmin and webstore users, exiting
	 * upon failure.
	 */
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
	
	/*
	 * Executes a SQL query on the store's database.
	 * @param query A SQL query
	 * @param user The user to execute the query as. Currently there
	 * are two users: Psql.WEBADMIN is in charge of the user (login) table
	 * and Psql.WEBSTORE is in charge of the inventory tables.
	 */
	public ResultSet sql(String query, int user){
		Connection conn = user == WEBADMIN ? admin : store;
		
		try{
			Statement s = conn.createStatement();
			return s.executeQuery(query);
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
			return null;
		}
		
	}
	
	public int sqlUpdate(String query, int user){
		Connection conn = user == WEBADMIN ? admin : store;
		
		try{
			Statement s = conn.createStatement();
			return s.executeUpdate(query);
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
			return 0;
		}
		
	}
	
	/*
	 * Generates the html that shows one book in the webstore. This should not have
	 * to be called directly; instead, getBooksHtml calls this method.
	 * @param title The title of the book.
	 * @param author The author(s) of the book. Multiple authors
	 * should be separated by commas.
	 * @param ed The edition of the book.
	 * @param price The price of the book.
	 * @param desc The description of the book.
	 * @param url A url to a picture of the book.
	 */
	protected String genBookHtml(String id, String title, String author, String ed, String price, String desc, String url){
		String book = "<div class='item'>"
				+"			<div class='left'>"
				+"				<img alt='item' src='" + url + "' height='200' width='200'>"
				+"				<div class='clear'></div>"
				+"				<form method='post' action='cart.jsp'>"
				+"				<input type='text' name='book' value='"+id+"' style='display:none' />"
				+"				<input type='button' value='add to cart'/>"
				+"				</form>"
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
	
	/*
	 * Generates html for the books department of the webstore. This
	 * html is suitable to be included in the main content div.
	 * @param query The SQL query that should be used to get items
	 * from the database. This should be of the form: 
	 * SELECT * FROM books, with optional restrictions on any of
	 * the columns. The columns are title, edition, price, author,
	 * description, and image.
	 * @return The html as a java String. Can be used within jsp pages
	 * with out.println() (or any other way you see fit).
	 */
	public String getBooksHtml(String query){
		
		ResultSet rs = sql(query, WEBSTORE);
		String books = new String();
		
		try{
			while(rs.next()){
				String s = genBookHtml(rs.getString("id"),
						rs.getString("title"), 
						rs.getString("author"), 
						String.valueOf(rs.getString("edition")), 
						rs.getString("price"), 
						rs.getString("description"), 
						rs.getString("image"));
				books += s;
			}
			return books;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			System.exit(1);
		}
		
		return null;
	}
	
	/*
	 * Generates the html that shows one game in the webstore. This should not have
	 * to be called directly; instead, getGamesHtml calls this method.
	 * @param title The title of the game.
	 * @param studio The studio (or author) that made the game.
	 * @param console The platform the game is available on.
	 * @param price The price of the game.
	 * @param desc The description of the game.
	 * @param url A url to a picture of the game.
	 */
	protected String genGameHtml(String id, String title, String studio, String console, String price, String desc, String url){
		String book = "<div class='item'>"
				+"			<div class='left'>"
				+"				<img alt='item' src='" + url + "' height='200' width='200'>"
				+"				<div class='clear'></div>"
				+"				<form method='post' action='cart.jsp'>"
				+"				<input type='text' name='game' value='"+id+"' style='display:none' />"
				+"				<input type='button' value='add to cart'/>"
				+"				</form>"
				+"			</div>"
				+"			<div class='details'>"
				+"				<p><span>Title:</span> " + title  + "</p>"
				+"				<p><span>Console:</span> " + console  + "</p>"
				+"				<p><span>Studio:</span> " + studio  + "</p>"
				+"				<p><span>Price:</span> " + price  + "</p>"
				+"				<p>" + desc  + "</p>"
				+"			</div>"
				+"		</div>"
				+"		<div class='clear'></div>";
		return book;
	}
	
	/*
	 * Generates html for the books department of the webstore. This
	 * html is suitable to be included in the main content div.
	 * @param query The SQL query that should be used to get items
	 * from the database. This should be of the form: 
	 * SELECT * FROM games, with optional restrictions on any of
	 * the columns. The columns are title, console, price, studio,
	 * description, and image.
	 * @return The html as a java String. Can be used within jsp pages
	 * with out.println() (or any other way you see fit).
	 */
	public String getGamesHtml(String query){
		
		ResultSet rs = sql(query, WEBSTORE);
		String books = new String();
		
		try{
			while(rs.next()){
				String s = genBookHtml(rs.getString("id"),
						rs.getString("title"), 
						rs.getString("studio"), 
						rs.getString("console"), 
						rs.getString("price"), 
						rs.getString("description"), 
						rs.getString("image"));
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
