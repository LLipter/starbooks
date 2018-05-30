<%@page import="model.*"%>
<%@page import="listener.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
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


<!--以上为导航栏-->

<div class="banner-top">
	<div class="container">
		<h1>Checkout</h1>
		<em></em>
		<h2><a href="/starbooks/jsp/index.jsp">Home</a><label>/</label>Shopping Cart</a></h2>
	</div>
</div>
<!--login-->
	<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
						});	  
					});
			   </script>
<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cart-header1').fadeOut('slow', function(c){
							$('.cart-header1').remove();
						});
						});	  
					});
			   </script>
			   <script>$(document).ready(function(c) {
					$('.close3').on('click', function(c){
						$('.cart-header2').fadeOut('slow', function(c){
							$('.cart-header2').remove();
						});
						});	  
					});
			   </script>
  <div class="container">
	<div class="check-out">
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    	    <table class="table-heading simpleCart_shelfItem">
		  <tr>
			<th class="table-grid">Item</th>
					
			<th>Prices</th>
			<th >Quantity </th>
		  </tr>

		  <tr class="cart-header">

			<td class="ring-in"><a href="single.html" class="at-in"><img src="images/ch.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5><a href="single.html">Sed ut perspiciatis unde</a></h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus ) </p>
			
			</div>
			<div class="clearfix"> </div>
			<div class="close1"> </div></td>
			<td>2</td>
			<td>FREE SHIPPING</td>
			<td class="item_price">$100.00</td>
			
		  </tr>

<%
            Order cart = (Order) session.getAttribute("cart");
            if(cart!=null){
            int i=1;

            for(Item item : cart){
            out.println("<tr class='cart-header"+i+"'>");

            out.println("<td class='ring-in'>");

            out.println("<a href='/starbooks/jsp/single.jsp?book_id=" + item.getBook().getBook_id() + " ' class='at-in'>");
             out.println(	"<img src='/starbooks/resource/book/image/" + item.getBook().getRes_url() + ".jpg'");

             out.println("class='img-responsive' alt=''>"+"</a>");
             out.println("<div class='sed'>");
             out.println("<h5><a href='/starbooks/jsp/single.jsp?book_id=" + item.getBook().getBook_id() +"' >");
            out.println(item.getBook().getBook_name()+"</a></h5>");
             out.println("<p>"+item.getBook().getAuthor()+" </p>");
             out.println("</div>");
             out.println("<div class='clearfix'> </div>");
             out.println("<div class='close2'> </div></td></td>");
             out.println("<td>"+item.getBook().getPrice()+"</td>");
             out.println("<td>"+item.getQuantity()+"</td>");
             out.println("</tr>");


             }
         }
		  %>


	</table>
	</div>
	</div>
	<div class="produced">
	<a href="/starbooks/jsp/pay.jsp" class="hvr-skew-backward">Produced To Buy</a>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="single.html" class="hvr-skew-backward">Clear the Cart</a>
	<!--依旧需要调用函数-->
	 </div>
   </div>
</div>





<p class = "blank_cart"></p>
<p class = "blank_cart"></p>


 

<%@ include file="footer.jsp" %>

</body>

</html>

