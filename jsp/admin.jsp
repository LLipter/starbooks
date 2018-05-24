<%@page import="model.*"%>
<?DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>UI for Admin</title>
		<link href = "/starbooks/resource/css/reset.css" rel = "stylesheet" type = "text/css"/>
		<!--finished CSS-->
		<link href = "/starbooks/resource/css/admin.css" rel = "stylesheet" type="text/css"/>
		<!--默认查看上架书籍 点击文本替换为下架书籍-->


<!--改动-->

<link href="/starbooks/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- 需要用到bootstrap 由于bootstrap的css效果要依赖于jquery 所以 最后也引入了jquery的几个文件  -->
<link href="/starbooks/resource/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/starbooks/resource/css/style4.css" rel="stylesheet" type="text/css" media="all" />  
<link href="/starbooks/resource/css/form.css" rel="stylesheet" type="text/css" media="all" />
<script src="/starbooks/resource/js/jquery.min.js"></script>
<script src="/starbooks/resource/js/jstarbox.js"></script>
    <link rel="stylesheet" href="/starbooks/css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
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




	</head>
	<body>
		<div class = "main">


			
	 <!--头部-->
<div class="header">
	<div class="container">
			<div class="head">
				<div class=" logo">
					<a href="resource/index.html"><img src="/starbooks/resource/images/logo.png" alt=""></a>   
				</div>
			</div>
		</div>
	
		<div class="header-top">
			<div class="container">
			<div class="col-sm-5 col-md-offset-2  header-login">
						<ul >
								<%
								User user = (User) session.getAttribute("user");
								if(user != null){
									out.println("<li><a href=#>");
									out.println("Hello, " + user.getUser_name());
									out.println("</a></li>");
									out.println("<li><a href='/starbooks/logout'>Logout</a></li>");
								}else{
									out.println("<li><a href='/starbooks/jsp/login.jsp'>Login</a></li>");
									out.println("<li><a href='/starbooks/jsp/register.jsp'>Register</a></li>");
								}

							%>
						</ul>
					</div>
					
				 <!-- social media of administrator to contact  --> 
				<div class="col-sm-5 header-social">        
						<ul >
							<li><a href="resource/#"><i></i></a></li>
							<li><a href="resource/#"><i class="ic1"></i></a></li>
							<li><a href="resource/#"><i class="ic2"></i></a></li>
							<li><a href="resource/#"><i class="ic3"></i></a></li>
							<li><a href="resource/#"><i class="ic4"></i></a></li>
						</ul>
						
				</div>
					<div class="clearfix"> </div>
			</div>
			</div>
			
			<div class="container">
				<div class="head-top">
			 <div class="col-sm-8 col-md-offset-2 h_menu4">
					<nav class="navbar nav_bottom" role="navigation">
	 
	 <!-- Brand and toggle get grouped for better mobile display -->
	  <div class="navbar-header nav_2">
		  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		 
	   </div> 
	   <!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
			<ul class="nav navbar-nav nav_1">
				<li><a class="color" href="resource/index.html">Home</a></li>
				<li><a class="color3" href="resource/product.html">Sale</a></li>
				<li><a class="color4" href="resource/404.html">About</a></li>
				<li><a class="color5" href="resource/typo.html">Short Codes</a></li>
				<li ><a class="color6" href="resource/contact.html">Contact</a></li>
			</ul>
		 </div>
	
	</nav>
	</div>
				<div class="col-sm-2 search-right">
						<div class="cart box_1">
							<a href="resource/checkout.html">
							<h3> <div class="total">
								<span class="simpleCart_total"></span></div>
								<img src="/starbooks/resource/images/cart.png" alt=""/></h3>
							</a>
							<p><a href="/starbooks/resource/javascript:;" class="simpleCart_empty">Empty Cart</a></p>
	
						</div>
						<div class="clearfix"> </div>
	
							
			   
			</div>
			</div>
			</div>     
		</div>
	
	<!--以上为导航栏-->


	<div class="banner-top">
			<div class="container">
				<h1>Admin</h1>
				<em></em>
				<h2><a href="resource/index.html">Home</a><label>/</label>Admin</a></h2>
			</div>
		</div>



    	<div class = "container">
			<p class = "admin_hr"></p>
			<div class = "admin_msg">
				<table class = "admin_table">
					<thead>
						<tr>
							<th>off-line stores</th><!--whatever-->
							<th>inventory</th>
							<th>total user number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>10</th>
							<th>100</th>
							<th>1000</th>
						</tr>
						</tbody>
				</table>
				<!--不知道能不能实现...-->
			</div>
			<p class = "admin_hr"></p>
			<div class = "content">
				<!--
				<a class = "admin_add" href = "#" target = "_blank">Add books</a> -->
				<!--添加和修改跳转到同一书籍信息界面-->
				<a class = "admin_add" href = "#"><button>Add books</button></a>
				<input class = "book_status" type="button" id = "statusBtn" onclick = "statusChange()" value = "Books on Shelf"/>
				<ul>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_01.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Gift cards</a>
								</p>
								<p class = "book_inline">$25, $50, and $100</p>
								<button type = "button">Remove </button>
								<!--删除书籍-->
								<!--
								<a class = "admin_modify" href = "#" target = "_blank">Modify </a>
								-->
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_02.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Just Enough Research</a>
								</p>
								<p class = "book_inline">by Erika Hall</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_03.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Content Strategy for Mobile</a>
								</p>
								<p class = "book_inline">by Karen McGrane</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_04.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Design Is a Job</a>
								</p>
								<p class = "book_inline">by Mike Monteiro</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_05.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Mobile First</a>
								</p>
								<p class = "book_inline">by Luke Wroblewski</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_06.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Designing for Emotion</a>
								</p>
								<p class = "book_inline">by Aarron Walter</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_07.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Responsive Web Design</a>
								</p>
								<p class = "book_inline">by ethan Marcotte</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_08.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">CSS3 for Web Designers</a>
								</p>
								<p class = "book_inline">by Dan Cederholm</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_09.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">HTML5 for Web Designers</a>
								</p>
								<p class = "book_inline">by Jeremy Keith</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_10.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">On Web Typography</a>
								</p>
								<p class = "book_inline">by Jason Santa Maria</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_11.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Responsible Responsive Design</a>
								</p>
								<p class = "book_inline">by Scott Jehl</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_12.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">OnWebTypgra</a>
								</p>
								<p class = "book_inline">by Jason Santa Maria</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
				</ul>
			</div>
		</div>




			
			<div class="footer">
			<div class="footer-bottom">
			<div class="container">
                    <ul class="footer-bottom-top">
                        <li><a href="resource/#"><img src="/starbooks/resource/images/f1.png" class="img-responsive" alt=""></a></li>
                        <li><a href="resource/#"><img src="/starbooks/resource/images/f2.png" class="img-responsive" alt=""></a></li>
                        <li><a href="resource/#"><img src="/starbooks/resource/images/f3.png" class="img-responsive" alt=""></a></li>
                    </ul>
                        <p class="footer-class">Copyright &copy; 2018.Company name All rights reserved &nbsp;<a href="index.html" target="_blank" title="StarBook">StarBook</a> &emsp;Published by Group </p>
                    <div class="clearfix"> </div>
            </div>
            </div>
 			</div>
 

		
		

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins)-->

		<script src="/starbooks/resource/js/imagezoom.js"></script>
		<script defer src="/starbooks/resource/js/jquery.flexslider.js"></script>
		<link rel="stylesheet" href="/starbooks/resource/css/flexslider.css" type="text/css" media="screen" />
		<script>
// Can also be used with $(document).ready()
		$(window).load(function() {
		  $('.flexslider').flexslider({
		    animation: "slide",
		    controlNav: "thumbnails"
		  });
		});
		</script>
		<script src="/starbooks/resource/js/simpleCart.min.js"> </script>
		<script src="/starbooks/resource/js/bootstrap.min.js"></script>
		<!--这一段保留 不用管-->


	</body>
</html>