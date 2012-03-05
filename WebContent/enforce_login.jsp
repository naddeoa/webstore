<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>
<%
	/*this page can be included to forward the user to the login page
	if they are not logged in*/
	if(user.getName() == null){
%>
	<jsp:forward page="login.jsp"/>
<%	} %>