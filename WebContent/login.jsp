<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*" />

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="head.jsp"></jsp:include>
		<title>Store</title>
	</head>


	<body>
		
		<div id="body">
			<div id="login">
				<form method="post" action="verify.jsp">
					Username: <input type="text" name="username"/> <br/>
					Password: <input type="password" name="password" id="pw"/> <br/>
					<input type="submit" value="Login" onclick="hash();">
				</form>
			</div>
		</div>
		
	</body>
</html>