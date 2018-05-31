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

<script>
	function removeBook(button){

		var form = document.createElement("form");  
		form.action = '/starbooks/removebook';  
		form.method = "post";  
		form.style.display = "none";  

		var book_id = document.createElement("textarea");  
		book_id.name = 'book_id';  
		book_id.value = button.nextSibling.innerHTML;
		form.appendChild(book_id);  

		document.body.appendChild(form);  
		form.submit();  
		// console.log(button);
		// console.log(button.nextSibling.nextSibling);
		// console.log(button.nextSibling.nextSibling.innerHTML);
		
	}

</script>


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


<%
            
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
             out.print("<div class='close2' onclick='removeBook(this)'></div>");
			 out.println("<div  class='book_id' style='display: none'>" + item.getBook().getBook_id() + "</div></td>");
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
	<%
		if(cart != null && cart.size() > 0)
			out.println("<a href='/starbooks/jsp/pay.jsp' class='hvr-skew-backward'>Pay</a>");
	%>
	
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="/starbooks/clearcart" class="hvr-skew-backward">Clear the Cart</a>
	<!--依旧需要调用函数-->
	 </div>
   </div>
</div>





<p class = "blank_cart"></p>
<p class = "blank_cart"></p>


 

<%@ include file="footer.jsp" %>

</body>

</html>

