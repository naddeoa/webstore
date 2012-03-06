<jsp:include page="enforce_admin.jsp"/>

<%@ page import="com.naddeo.webstore.Psql" %>
<%@ page import="java.sql.ResultSet;" %>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>

<%

	if(user.getAdmin() == false){
		System.out.println("Unauthorized user attempted to add a game");
		return;
	}

	Psql db = new Psql();
	
	String title = request.getParameter("title");
	String console = request.getParameter("console");
	String price = request.getParameter("price");
	String studio = request.getParameter("studio");
	String url = request.getParameter("image");
	String description = request.getParameter("description");
	
	if(title == null || console == null || price == null || studio == null){
		out.println("Malformed request. One or more of the required fields were blank");
		return;
	}
	
	String query = String.format("insert into games(title,console,studio,price,image,description) values('%s','%s','%s','%s','%s','%s');",
			title,console,studio,price,url,description);
	
	int row = db.sqlUpdate(query, Psql.WEBSTORE);
	
	if(row > 0)
		out.println("Successfuly added");
	else
		out.println("An error occured");
%>