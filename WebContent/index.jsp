<%@page import="com.naddeo.webstore.Psql"%>
<jsp:include page="enforce_login.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>




<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="head.jsp"></jsp:include>
		<title>WebStore</title>
	</head>


	<body>
		
		<div id="content">
			<h1>The Webstore</h1>
			<form method="post" action="index.jsp">
				<select name="page">
					<option value="books">books</option>
					<option value="games">games</option>
					<option value="cart">cart</option>
				</select>
				<input type="submit" value="Change Department"/>
			</form>
			
			
			<%
				Psql db = new Psql();
				String p = request.getParameter("page");
				if(p != null && p.equals("games"))
					out.println(db.getGamesHtml("select * from games;"));
				else if(p != null && p.equals("cart")){
					String books = user.getBooksQuerry();
					String games = user.getGamesQuerry();
					if(books == null && games == null)
						out.println("nothing in cart");
					if(books != null)
						out.println(db.getBooksHtml(books));
					if(games != null)
						out.println(db.getGamesHtml(games));
				}else
					out.println(db.getBooksHtml("select * from books;"));
			%>
			
			
			
			
			
			
			
			
		</div>
		
	</body>
</html>