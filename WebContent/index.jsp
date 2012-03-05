<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.naddeo.webstore.Psql" %>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>
<%
	if(user.getName() == null){
%>
	<jsp:forward page="login.jsp"/>
<%	} %>





<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="head.jsp"></jsp:include>
		<title>Store</title>
	</head>


	<body>
		
		Congratulations, you are logged in as <%=user.getName() %>!
		
	</body>
</html>