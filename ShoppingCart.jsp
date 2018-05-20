<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Shopping Cart</title>
<!--底层布局的css-->
<link type="text/css" rel="stylesheet" href="resource/css/reset.css" />
<!--样式css-->
<link type="text/css" rel="stylesheet" href="resource/css/cart.css" />
</head>

<body>

<div class="w_100_l">
<div class="main">
	<div class="top_banner">
	<!--登陆、主页面、用户中心、购物车按钮-->
		<div class="top_menu">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="jsp/login.jsp">Login</a></li>
				<li class = "sel"><a href="#">Cart</a></li>
				<li><a href="#">User</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</div>
		
		<!--显示用户登录状态-->
		<% 
			User user = (User)session.getAttribute("user");
			if(user != null){
				out.println("<div class=\"top_status\">");
				out.print("<p>");
				out.print(user.getUser_name());
				out.println(" <a href=\"logout\">log out</a></p>");
				out.println("</div>");
			}
		%>
	</div>
	
	<p></p>

	
	<div class = "content">
		<h1 class = "title_shoppingcart">The ShoppingCart of StarBooks</h1>
		
		<p class="index_hr"></p>
		
		<ul>
			<li><a href="#"><img src="resource/book/book_01.jpg" alt="book" /></a></li>
			<li class="book_title">Title :</li>
			<li class="book_quantity">Quantity :</li>
			<li class="book_price">Price :</li>
           	<li class="book_title"><a href="#" target="_blank">Gift cards</a></li>
			<li class="book_quantity">1</li>
			<li class="book_price">$20</li>
			<form method="post" action="ShopCartServlet">
				<button class = "remove_book" name="removeBook" type="submit">Delete</button>
			</form>
		</ul>
		<p class="index_n"></p>
		<ul>
			<li><a href="#"><img src="resource/book/book_02.jpg" alt="book" /></a></li>
			<li class="book_title">Title :</li>
			<li class="book_quantity">Quantity :</li>
			<li class="book_price">Price :</li>
			<li class="book_title"><a href="#" target="_blank">Just Enough Research</a></li>
			<li class="book_quantity">2</li>
			<li class="book_price">$50</li>
			<form method="post" action="ShopCartServlet">
				<button class = "remove_book" name="removeBook" type="submit">Delete</button>
			</form>
		</ul>
		<p class="index_n"></p>
		<ul>
			<li><a href="#"><img src="resource/book/book_03.jpg" alt="book" /></a></li>
			<li class="book_title">Title :</li>
			<li class="book_quantity">Quantity :</li>
			<li class="book_price">Price :</li>
            <li class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></li>
			<li class="book_quantity">1</li>
			<li class="book_price">$15</li>
			<form method="post" action="ShopCartServlet">
				<button class = "remove_book" name="removeBook" type="submit">Delete</button>
			</form>
	</div>
	
	<p class="index_hr"></p>
	<p class = "total_price">Total Price: $85</p>
	
	<form class = "button" method="post" action="ShopCartServlet">

		<button class = "clear_cart" name="clearCart" type="submit">Clear The Cart</button>
		
		<button class = "pay_cart" name="pay" type="submit">Pay</button>

	</form>
	
	<div class="footer">
           <span class="span_1">@ For Web Exercise: StarBook</span>
		   <!--管理员登陆按钮-->
            <a href="#">For Administrator</a>

            <span class="span_2"><b>Published by 1-3 Class 13 Group</b></span>
    </div>
</div>
</div>
</body>

</html>

