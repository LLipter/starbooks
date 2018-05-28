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
            <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/order.css" />

        <%@ include file="include.jsp" %>
        </head>

        <body>
        <%@ include file="header.jsp" %>

        <div class="banner-top">
        <div class="container">
        <h1>Starbooks</h1>
        <em></em>
        <h2><a href="/starbooks/jsp/index.jsp">Order Details</a></h2>
        </div>
        </div>

        <!--以上为导航栏-->

        <div class = "container">
        <div class="w_100_l">
        <div class="main">



        <div class = "content">
        <h1 class = "title_shoppingcart">The Details Of Orders</h1>

        <p class="index_hr"></p>
        <ul>
        <li class="img"><a href="#"><img src="../resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></li>
        <li class="book_title">Title :</li>
        <li class="book_quantity">Quantity :</li>
        <li class="book_price">Price :</li>
        <li class="book_title"><a href="#" target="_blank">Gift cards</a></li>
        <li class="book_quantity">1</li>
        <li class="book_price">$20</li>
        </ul>

        <p class="index_n"></p>
        <ul>
        <li class="img"><a href="#"><img src="../resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></li>
        <li class="book_title">Title :</li>
        <li class="book_quantity">Quantity :</li>
        <li class="book_price">Price :</li>
        <li class="book_title"><a href="#" target="_blank">Just Enough Research</a></li>
        <li class="book_quantity">2</li>
        <li class="book_price">$50</li>
        </ul>

        <p class="index_n"></p>
        <ul>
        <li class="img"><a href="#"><img src="../resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></li>
        <li class="book_title">Title :</li>
        <li class="book_quantity">Quantity :</li>
        <li class="book_price">Price :</li>
        <li class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></li>
        <li class="book_quantity">1</li>
        <li class="book_price">$15</li>
        </ul>
        </div>

        <p class="index_hr"></p>
        <p class = "total_price">Total Price: $85</p>

        <form class = "button" method="post" action="ShopCartServlet">

        <button class = "apply_for_return" name="clearCart" type="submit">Apply For Return</button>
        <button class = "confirm_receiving" name="pay" type="submit">Confirm Receiving</button>

        </form>
        </div>
        </div>
        </div>

        <p class = "blank_cart"></p>


        <%@ include file="footer.jsp" %>

        </body>

        </html>

