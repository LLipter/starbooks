<%@page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Pay</title>
<!--样式css-->
<link type="text/css" rel="stylesheet" href="/starbooks/resource/css/pay.css" />

<%@ include file="include.jsp" %>
</head>

<body>

    <%@ include file="header.jsp" %>

    <div class="banner-top">
        <div class="container">
            <h1>Pay</h1>
            <em></em>
            <h2>
                <a href="/starbooks/jsp/index.jsp">Home</a>
                <label>/</label>Pay</a>
            </h2>
        </div>
    </div>


	
	<p></p>
	
<div class = "container">
<div class="main_pay">
	<div class>
		<h1 class = "title_pay">Pay For Your Books</h1>
		
		<div class="personal_container">
		<div class="personal">
			<form action="#" method="post" class="white-pink">
				<h1>
					Confirm your personal details <span>Please fill all the texts in thefields.</span>
				</h1>
				<label> <span>User Name :</span> <input type="text" name="user_name" /></label> 
				<label> <span>Address :</span> <input type="text" name="address" /></label>
				<label> <span>Email :</span> <input type="text" name="email" /></label> 
				<label> <span>Phone Number :</span> <input type="text" name="phone_number" /></label> 
				<label> <span>Post Code :</span> <input type="text" name="post_code" /></label> 
				<label><p class="message"></p></label> 
			</form>
		</div>
    </div>
		
		<p class="index_hr"></p>
		
		<div>
			<span class="book_title0">Title :</span>
			<span class="book_quantity0">Quantity :</span>
			<span class="book_price0">Price :</span>
		</div>
		<div>
           	<span class="book_title">Gift cards</span>
			<span class="book_quantity">1</span>
			<span class="book_price">$20</span>
		</div>
		<div>
			<span class="book_title">Just Enough Research</span>
			<span class="book_quantity">2</span>
			<span class="book_price">$50</span>
		</div>
		<div>
            <span class="book_title">Content Strategy for Mobile</span>
			<span class="book_quantity">1</span>
			<span class="book_price">$15</span>
		</div>
	</div>
	
	<p class="index_h"></p>
	<p class = "total_price">Total Price: $85</span>
	
	<form class = "button" method="post" action="ShopCartServlet">
	
		<button class = "pay_cart" name="pay" type="submit">Pay</button>
		
	</form>
	<p class = "blank_pay"></p>
	</div>
</div>

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