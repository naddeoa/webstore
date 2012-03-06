<jsp:include page="enforce_login.jsp"></jsp:include>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>

<%

String game = request.getParameter("game");
String book = request.getParameter("book");

if(book == null && game == null){
	out.println("Error");
	return;
}

if(request.getParameter("game") != null){
	
	
}else if(request.getParameter("book") != null){
	
	
}

%>