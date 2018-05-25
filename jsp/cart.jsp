<%@page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Shopping Cart</title>
<!--底层布局的css-->
<link type="text/css" rel="stylesheet" href="/starbooks/resource/css/reset.css" />
<!--样式css-->
<link type="text/css" rel="stylesheet" href="/starbooks/resource/css/cart.css" />

<%@ include file="include.jsp" %>
</head>

<body>
    <%@ include file="header.jsp" %>
	
	<div class="banner-top">
    <div class="container">
        <h1>Starbooks</h1>
        <em></em>
        <h2><a href="/starbooks/jsp/index.jsp">Shopping Cart</a></h2>
    </div>
</div>

<!--以上为导航栏-->

<div class = "container">
<div class="w_100_l">
<div class="main">


	
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
	
</div>
</div>
</div>

<p class = "blank_cart"></p>

<div class="footer">
	<div class="footer-bottom">
		<div class="container">
            <ul class="footer-bottom-top">
                <li><a href="resource/#"><img src="resource/images/f1.png" class="img-responsive" alt=""></a></li>
                <li><a href="resource/#"><img src="resource/images/f2.png" class="img-responsive" alt=""></a></li>
                <li><a href="resource/#"><img src="resource/images/f3.png" class="img-responsive" alt=""></a></li>
            </ul>
            <p class="footer-class">Copyright &copy; 2018.Company name All rights reserved &nbsp;<a href="index.html" target="_blank" title="StarBook">StarBook</a> &emsp;Published by Group </p>
        <div class="clearfix"> </div>
        </div>
    </div>
</div>
 
<p></p>

<%@ include file="footer.jsp" %>

</body>

</html>

