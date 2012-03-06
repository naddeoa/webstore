package com.naddeo.webstore;

import java.util.ArrayList;

import com.sun.xml.internal.ws.developer.Stateful;

@Stateful
public class UserBean {

	private String name;
	private boolean admin;
	
	public class Cart{
		ArrayList<Integer> games = new ArrayList<Integer>();
		ArrayList<Integer> books = new ArrayList<Integer>();
	}
	
	public void setName(String name){
		this.name = name;
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
	
	
}
