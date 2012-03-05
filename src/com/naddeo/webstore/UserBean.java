package com.naddeo.webstore;

import com.sun.xml.internal.ws.developer.Stateful;

@Stateful
public class UserBean {

	private String name;
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
	
}
