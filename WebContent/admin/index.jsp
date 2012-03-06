<jsp:include page="enforce_admin.jsp"/>
<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>

<%
if(user.getAdmin()){
%>
<html>
<body>
<h2>Add a book</h2>

<form method="post" action="add_book.jsp">

title*: <input type="text" name="title"/> <br>
edition*: <input type="text" name="edition"/> <br>
price*: <input type="text" name="price"/> <br>
authors*: <input type="text" name="author"/> <br>
image url: <input type="text" name="image"/> <br>
description:<textarea name="description" rows="10" cols="30"></textarea> <br>

<input type="submit" value="Add book"/>
</form>



<br><br><br>
<h2>Add a game</h2>

<form method="post" action="add_game.jsp">
title*: <input type="text" name="title"/> <br>
console*: <input type="text" name="console"/> <br>
price*: <input type="text" name="price"/> <br>
studio*: <input type="text" name="studio"/> <br>
image url: <input type="text" name="image"/> <br>
description:<textarea name="description" rows="10" cols="30"></textarea> <br>

<input type="submit" value="Add game"/>
</form>

</body>
</html>
<%
}
%>