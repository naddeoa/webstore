<%@ page import="com.naddeo.webstore.Psql" %>
<%@ page import="java.sql.ResultSet;" %>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>

<%
	Psql db = new Psql();

	String querry = "SELECT * FROM users WHERE username='"+request.getParameter("username")+
			"' and password='"+request.getParameter("password") + "';";
	ResultSet rs = db.sql(querry);
	
	rs.next();
	int rowCount = rs.getRow();
	if( rowCount == 1 ){
		user.setName(request.getParameter("username").toString());
%>


<script type="text/JavaScript">
setTimeout("location.href = 'index.jsp';",3000);
</script>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="head.jsp"></jsp:include>
		<title>Store</title>
	</head>

	<body>
		<div id="body">
			<div id="login">
				<p class="center">Welcome <%=user.getName() %>!</p>
				<p class="center">If you are not automatically redirected, click <a href="index.jsp">here</a></p>
			</div>
		</div>		
	</body>
</html>


<%
	}else{
		out.println("Failed to match username and password.");
	}
%>


