<%@ page import="com.naddeo.webstore.Psql" %>
<%@ page import="java.sql.ResultSet;" %>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>

<%
	Psql db = new Psql();

	String querry = "SELECT * FROM users WHERE username='"+request.getParameter("username")+
			"' and password='"+request.getParameter("password") + "';";
	System.out.println("Using querry: " + querry);
	ResultSet rs = db.sql(querry);
	
	rs.next();
	int rowCount = rs.getRow();
	if( rowCount == 1 ){
		user.setName(request.getParameter("username").toString());
		out.println("Successfully logged in!");
	}else{
		out.println("Failed to match username and password.");
	}
%>


