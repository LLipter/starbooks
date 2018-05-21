<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Home for StarBook</title>
<!--底层布局的css-->
<link type="text/css" rel="stylesheet" href="resource/css/reset.css" />
<!--样式css-->
<link type="text/css" rel="stylesheet" href="resource/css/index.css" />
</head>

<body>
<div class="w_100_l">
	<div class="main">
      <div class="top_banner">
			<!--登陆、主页面、用户中心、购物车按钮-->
            <div class="top_menu">
            	<ul>
                	<li class="sel"><a href="#">Home</a></li>
					<li><a href="jsp/login.jsp">Login</a></li>
                	<li><a href="ShoppingCart.jsp">Cart</a></li>
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
		<!--一张凑位置的图片-->
        <span class="index_img">
			<img src="resource/images/1.jpg" alt="Dan Cederholm" border="0"/>
        </span>
        <p class="index_hr"></p>
	<!--出售书本的信息-->
      <div class="content">
            <h1 class="h1_book_title">Here are books for users to buy</h1>
        	<ul>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_01.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Gift cards</a></p>
                            <p class="book_inline">$25, $50, and $100</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_02.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Just Enough Research</a></p>
                            <p class="book_inline">by Erika Hall</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_03.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></p>
                            <p class="book_inline">by Karen McGrane</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_04.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Design Is a Job</a></p>
                            <p class="book_inline">by Mike Monteiro</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_05.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Mobile First</a></p>
                            <p class="book_inline">by Luke Wroblewski</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_06.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Designing for Emotion</a></p>
                            <p class="book_inline">by Aarron Walter</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_07.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Responsive Web Design</a></p>
                            <p class="book_inline">by Ethan Marcotte</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_08.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">CSS3 for Web Designers</a></p>
                            <p class="book_inline">by Dan Cederholm</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_09.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">HTML5 for Web Designers</a></p>
                            <p class="book_inline">by Jeremy Keith</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_10.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">On Web Typography</a></p>
                            <p class="book_inline">by Jason Santa Maria</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_11.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">Responsible Responsive Design</a></p>
                            <p class="book_inline">by Scott Jehl</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="resource/book/book_12.jpg" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">On Web Typography</a></p>
                            <p class="book_inline">by Jason Santa Maria</p>
                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                        </dt>
                    </dl>
                </li>
            </ul>
      </div>
        <p class="index_hr"></p>
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