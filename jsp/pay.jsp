<%@page import="model.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
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
			<form action="/starbooks/pay" method="post" class="white-pink" name='pay'>
				<h1>
					Confirm your personal details <span>Please fill all the texts in thefields.</span>
				</h1>
				<label> <span>Receiver Name :</span> <input type="text" name="receiver_name" /></label> 
				<label> <span>Address :</span> <input type="text" name="address" /></label>
				<label> <span>Email :</span> <input type="text" name="email" /></label> 
				<label> <span>Phone Number :</span> <input type="text" name="phone_number" /></label> 
				<label> <span>Post Code :</span> <input type="text" name="post_code" /></label> 
				<label><p class="message">
					<% 
						String res = (String) request.getAttribute("payResult");
						if(res != null){
							out.println(res);
						}
					%>



				</p></label> 
			
		</div>
    </div>
		
		<p class="index_hr"></p>
		
		<div>
			<span class="book_title0">Title :</span>
			<span class="book_quantity0">Quantity :</span>
			<span class="book_price0">Price :</span>
		</div>

		<%
			for(Item item : cart){
				out.println("<div>");

				out.println("<span class='book_title'>");
				out.println(item.getBook().getBook_name());
				out.println("</span>");

				out.println("<span class='book_quantity'>");
				out.println(item.getQuantity());
				out.println("</span>");

				out.println("<span class='book_price'>");
				out.println(item.getBook().getPrice());
				out.println("</span>");

				out.println("</div>");
			}
		
		%>
	</div>
	
	<p class="index_h"></p>
	<span><p class = "total_price">Total Price: <%= cart.getTotalPrice() %></span>
	
	
	<button class = "pay_cart" name="pay" type="submit">Pay</button></form>
	<p class = "blank_pay"></p>
	</div>
</div>
<p></p>

<%@ include file="footer.jsp" %>

</body>

</html>