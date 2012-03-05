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
			
			<%
				Psql db = new Psql();
				out.println(db.getBooksHtml("select * from books;"));
			%>
			
			
			
			
			
			
			
			
		</div>
		
	</body>
</html>