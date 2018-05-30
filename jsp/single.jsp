<%@page import="model.*"%>
<%@page import="listener.*" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%  int bookid=Integer.parseInt(request.getParameter("book_id"));
    Book book=DatabaseUtility.getBook(bookid);
                               %>
	<!DOCTYPE html>
	<html>

	<head>
		<title>Single</title>
		<link href="/starbooks/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<%@ include file="include.jsp" %>
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script src="js/jquery.min.js"></script>
    <script src="js/jstarbox.js"></script>
	<link rel="stylesheet" href="/starbooks/resource/css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
		<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
		</script>

		<script>
			function addBook(){

				var form = document.createElement("form");  
				form.action = '/starbooks/addbook';  
				form.method = "get";  
				form.style.display = "none";  

				var book_id = document.createElement("textarea");  
				book_id.name = 'book_id';  
				book_id.value = document.getElementById('book_id').innerHTML;  
				form.appendChild(book_id);  

				var quentity = document.createElement("textarea");  
				quentity.name = 'quentity';  
				quentity.value = document.getElementById('quentity').innerHTML;  
				form.appendChild(quentity);  

				document.body.appendChild(form);  
				form.submit();  
			}
  
		</script>
		
	</head>

	<body>
		<div style='display:none' id='book_id'><%= request.getParameter("book_id") %></div>
		<%@ include file="header.jsp" %>
			<div class="banner-top">
				<div class="container">
					<h1>Single</h1>
					<em></em>
					<h2>
						<a href="/starbooks/jsp/index.jsp">Home</a>
						<label>/</label>Single</a>
					</h2>
				</div>
			</div>
			<div class="single">
				<div class="container">

					<!--picture under the main picture-->

					<div class="col-md-9">
						<div class="col-md-5 grid">
							<div class="flexslider">
								<ul class="slides">
								
<% 
									out.println("<li data-thumb='/starbooks/resource/book/image/"+book.getRes_url()+".jpg'>");
                                    out.println("<div class='thumb-image'>");
                                    out.println("<img src='/starbooks/resource/book/image/"+book.getRes_url()+".jpg' ");
                                    out.println("data-imagezoom='true' class='img-responsive'>");
                                    out.println("</div>");
                                    out.println("</li>");
									%>	

								</ul>
							</div>
						</div>

						<div class="col-md-7 single-top-in">
							<div class="span_2_of_a1 simpleCart_shelfItem">


<% 
           
                             
                               out.println("<h3>"+book.getBook_name()+"</h3>");
                               out.println("<p class='in-para'>");
                               out.println("Designed by   "+book.getAuthor()+"</p>");
                               out.println("<div class='price_single'>");
                               out.println("<span class='reducedfrom item_price'>"+book.getPrice()+" RMB"+"</span>");
                               
%>
									<a href="resource/#">click for offer</a>
									<div class="clearfix"></div>
								</div>

								<h4 class="quick">Quick Overview:</h4>
							<% 	out.println("<p class='quick_desc'>"+book.getPublisher()+" </p>");
							%>

								<div class="quantity">
									<div class="quantity-select">
										<div class="entry value-minus">&nbsp;</div>
										<div class="entry value">
											<span id='quentity'>1</span>
										</div>
										<div class="entry value-plus active">&nbsp;</div>
									</div>
								</div>

								<!--this two script method change the total price with no fresh F5-->
								<script>
									$('.value-plus').on('click', function () {
										var divUpd = $(this).parent().find('#quentity'), newVal = parseInt(divUpd.text(), 10) + 1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function () {
										var divUpd = $(this).parent().find('#quentity'), newVal = parseInt(divUpd.text(), 10) - 1;
										if (newVal >= 1) divUpd.text(newVal);
									});
								</script>
								
							<button onclick=addBook() class='add-to item_add hvr-skew-backward'>Add to cart</button>

								<div class="clearfix"> </div>
							</div>

						</div>
						<div class="clearfix"> </div>
						<div class="tab-head">
							<nav class="nav-sidebar">
								<ul class="nav tabs">
									<li class="active">
										<a href="#tab1" data-toggle="tab">Product Description</a>
									</li>
									<li class="">
										<a href="#tab2" data-toggle="tab">Additional Information</a>
									</li>
									<li class="">
										<a href="#tab3" data-toggle="tab">Reviews</a>
									</li>
								</ul>
							</nav>
							<div class="tab-content one">
								<div class="tab-pane active text-style" id="tab1">
									<div class="facts">
										<% 
										out.println("<p>"+book.getDescription()+"</p>");

											%>
										<ul>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
										</ul>
									</div>

								</div>
								<div class="tab-pane text-style" id="tab2">

									<div class="facts">
						<%				
						out.println("<p>"+book.getInformation()+"</p>");
						%>
										
										<ul>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Multimedia Systems</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Digital media adapters</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Set top boxes for HDTV and IPTV Player </li>
										</ul>
									</div>

								</div>
								<div class="tab-pane text-style" id="tab3">

									<div class="facts">

										<%	
										out.println("<p>"+book.getReviews()+"</p>");%>
										

										<ul>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
											<li>
												<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
										</ul>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<%@ include file="footer.jsp" %>
	</body>
	</html>