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
	String edition = request.getParameter("edition");
	String price = request.getParameter("price");
	String author = request.getParameter("author");
	String url = request.getParameter("image");
	String description = request.getParameter("description");
	
	if(title == null || edition == null || price == null || author == null){
		out.println("Malformed request. One or more of the required fields were blank");
		return;
	}
	
	String query = String.format("insert into books(title,edition,author,price,image,description) values('%s',%s,'%s','%s','%s','%s');",
			title,edition,author,price,url,description);
	
	int row = db.sqlUpdate(query, Psql.WEBSTORE);
	
	if(row > 0)
		out.println("Successfuly added");
	else
		out.println("An error occured");
%>