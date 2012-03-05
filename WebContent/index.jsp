<jsp:include page="enforce_login.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="com.naddeo.webstore.UserBean" scope="session"/>




<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="head.jsp"></jsp:include>
		<title>WebStore</title>
	</head>


	<body>
		
		<div id="content">
			<h1>The Webstore</h1>
			
			<div class="item">
				<div class="left">
					<img alt="item" src="http://ecx.images-amazon.com/images/I/41-8JgrtsDL._SL500_AA300_.jpg" height="200" width="200">
					<div class="clear"></div>
					<input type="button" value="add to cart"/>
				</div>
				
				<div class="details">
					<p><span>Title:</span> Biology</p>
					<p><span>Edition:</span> 8</p>
					<p><span>Author:</span> Neil Campbell, Jane Reece</p>
					<p><span>Price:</span> $149.40</p>
					<p>The book's hallmark values–accuracy, currency, and passion for teaching and learning–have 
					made Campbell/Reece the most successful book for readers for seven consecutive 
					editions.</p>
				</div>
			</div>
			<div class="clear"></div>
			
			<div class="item">
				<div class="left">
					<img alt="item" src="http://ecx.images-amazon.com/images/I/41-8JgrtsDL._SL500_AA300_.jpg" height="200" width="200">
					<div class="clear"></div>
					<input type="button" value="add to cart"/>
				</div>
				
				<div class="details">
					<p><span>Title:</span> Biology</p>
					<p><span>Edition:</span> 8</p>
					<p><span>Author:</span> Neil Campbell, Jane Reece</p>
					<p><span>Price:</span> $149.40</p>
					<p>The book's hallmark values–accuracy, currency, and passion for teaching and learning–have 
					made Campbell/Reece the most successful book for readers for seven consecutive 
					editions.</p>
				</div>
			</div>
			<div class="clear"></div>
			
			<div class="item">
				<div class="left">
					<img alt="item" src="http://ecx.images-amazon.com/images/I/41-8JgrtsDL._SL500_AA300_.jpg" height="200" width="200">
					<div class="clear"></div>
					<input type="button" value="add to cart"/>
				</div>
				
				<div class="details">
					<p><span>Title:</span> Biology</p>
					<p><span>Edition:</span> 8</p>
					<p><span>Author:</span> Neil Campbell, Jane Reece</p>
					<p><span>Price:</span> $149.40</p>
					<p>The book's hallmark values–accuracy, currency, and passion for teaching and learning–have 
					made Campbell/Reece the most successful book for readers for seven consecutive 
					editions.</p>
				</div>
			</div>
			<div class="clear"></div>
			
			<div class="item">
				<div class="left">
					<img alt="item" src="http://ecx.images-amazon.com/images/I/41-8JgrtsDL._SL500_AA300_.jpg" height="200" width="200">
					<div class="clear"></div>
					<input type="button" value="add to cart"/>
				</div>
				
				<div class="details">
					<p><span>Title:</span> Biology</p>
					<p><span>Edition:</span> 8</p>
					<p><span>Author:</span> Neil Campbell, Jane Reece</p>
					<p><span>Price:</span> $149.40</p>
					<p>The book's hallmark values–accuracy, currency, and passion for teaching and learning–have 
					made Campbell/Reece the most successful book for readers for seven consecutive 
					editions.</p>
				</div>
			</div>
			<div class="clear"></div>
			
			
			
			
		</div>
		
	</body>
</html>