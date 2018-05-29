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
			<th>Subtotal</th>
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



		  <tr class="cart-header1">
		  <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ch2.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5><a href="single.html">Sed ut perspiciatis unde</a></h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus ) </p>
			</div>
			<div class="clearfix"> </div>
			<div class="close2"> </div></td></td>
			<td>2</td>
			<td>FREE SHIPPING</td>
			<td class="item_price">$100.00</td>
			
		  </tr>



		  <tr class="cart-header2">
		  <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ch1.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5><a href="single.html">Sed ut perspiciatis unde</a></h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus ) </p>
			</div>
			<div class="clearfix"> </div>
			<div class="close3" name="removeBook" type="submit"> </div></td></td>
			<td>$100.00</td>
			<td>2</td>
			<td class="item_price">$100.00</td>
			
		  </tr>
		  
	</table>
	</div>
	</div>
	<div class="produced">
	<a href="single.html" class="hvr-skew-backward">Produced To Buy</a>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="single.html" class="hvr-skew-backward">Clear the Cart</a>
	 </div>
   </div>
</div>





<p class = "blank_cart"></p>


 


<%@ include file="footer.jsp" %>

</body>

</html>

