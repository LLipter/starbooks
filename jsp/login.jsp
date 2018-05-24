<%@page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to starbooks</title>
<link rel="stylesheet" type="text/css" href="/starbooks/resource/css/login.css">


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




<script type="text/javascript">
    $(function(){
        //改变div的高度
        $("#login_conatiner").height($(window).height()-80-76-250);
    });
</script>
</head>


<body>

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
                                
                                
                                <!-- <li><a href="resource/checkout.html">Checkout</a></li> -->
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
                                <p><a href="resource/javascript:;" class="simpleCart_empty">Empty Cart</a></p>
        
                            </div>
                            <div class="clearfix"> </div>
        
                                
                   
                </div>
                </div>
                </div>     
            </div>
        
        <!--以上为导航栏-->


        <div class="banner-top">
                <div class="container">
                    <h1>Login</h1>
                    <em></em>
                    <h2><a href="resource/index.html">Home</a><label>/</label>Login</a></h2>
                </div>
            </div>





	<div class="login_container" id="login_conatiner">
		<div class="login">
			<!-- <form action="login" method="post">
                userName:
                <input type="text" name="user_name"> password:
                <input type="password" name="passwd">
                <input type="submit">
            </form> -->
			<form action="/starbooks/login" method="post" class="white-pink">
				<h1>
					Login to Starbooks <span>Please fill all the texts in the
						fields.</span>
				</h1>
				<label> <span>User Name :</span> <input type="text"
					name="user_name" />
				</label> <label> <span>Password :</span> <input type="password"
					name="passwd" />
				</label> <label>
					<p class="message">

						<% 
							String res = (String) request.getAttribute("loginResult");
							if(res != null){
								if(res.equals("login successfully")){
									out.println("Hello, " + (String)request.getAttribute("user_name"));
									out.println("your password is " + (String)request.getAttribute("passwd"));
								}else{
									out.println(res);
								}
							}
						%>
					</p>
				</label> <label>
					<div class="button_container">
						<input type="submit" class="button" value="Login" />
					</div>
				</label>
			</form>
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