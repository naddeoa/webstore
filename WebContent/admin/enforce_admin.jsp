<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>
<%
	/*this page can be included to forward the user to the login page
	if they are not logged in*/
	if(user.getName() == null || user.getAdmin() == false){
%>
	<script type="text/javascript">
		setTimeout("location.href = '../index.jsp';",1000);
	</script>
	You are not allowed to be here
<%	} %>