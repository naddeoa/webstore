package com.naddeo.webstore;

import java.util.ArrayList;

import com.sun.xml.internal.ws.developer.Stateful;

@Stateful
public class UserBean {

	private String name;
	private boolean admin;
	public Cart cart;
	
	public class Cart{
		public ArrayList<Integer> games = new ArrayList<Integer>();
		public ArrayList<Integer> books = new ArrayList<Integer>();
	}
	
	public void setName(String name){
		this.name = name;
		cart = new Cart();
	}
	
	public String getName(){
		return name;
	}
	
	public void setAdmin(boolean status){
		admin = status;
	}
	
	public boolean getAdmin(){
		return admin;
	}
	
	public String getBooksQuerry(){
		
		if(cart.books.size() == 0)
			return null;
		
		String query = "select * from books where ";
		for(Integer i : cart.books){
			query += " id='" + i.toString() + "' or ";
		}
		query += " id=0;";
		System.out.println(query);
		return query;
	}

	public String getGamesQuerry(){
		
		if(cart.games.size() == 0)
			return null;
		
		String query = "select * from games where ";
		for(Integer i : cart.games){
			query += " id='" + i.toString() + "' or ";
		}
		query += " id=0;";
		System.out.println(query);
		return query;
}
	
}
