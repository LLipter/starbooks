<%@page import="model.*"%>
<html>
<head>
    <meta charset="utf-8"/>
    <title>User</title>
    <!--底层布局的css-->
    <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/reset.css" />
    <!--样式css-->
    <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/user.css" />

    <%@ include file="include.jsp" %>
</head>
<body>


    <%@ include file="header.jsp" %>

<div class="banner-top">
    <div class="container">
        <h1>User Page</h1>
        <em></em>
        <h2><a href="/starbooks/resource/index.jsp">Home</a><label>/</label>User Page</a></h2>
    </div>
</div>
<p></p>

<div class = "container">
    <div class="w_100_l">
        <div class="main">
            <div class = "content">

                <p></p>
                <p class="index_hr"></p>
                <div>
                    <span class="img"><img src="/starbooks/resource/images/randomUser6.png" alt="user" /></span>
                    <!--随机头像6个已上传，不用调用数据库-->
                    <span class="user">User Name :</span>
                    <span class="user_id">Null</span>
                    <span class="user">User Gender</span>
                    <span class="user_gender">male</span>
                    <span class="user">User Birthday</span>
                    <span class="user_birthday">2018-01-01</span>
                    <span class="user">User Address :</span>
                    <span class="user_address">WHU.ISS</span>
                    <span class="user">User Phone :</span>
                    <span class="user_phone">116511231</span>
                    <span class="user">User Email :</span>
                    <span class="user_email">xxxxxxxx@163.com</span>
                </div>

                <p class="index_hr"></p>
                <br/><br/>
                <div>
                    <span class="order_title0">Order:</span>
                    <span class="order_time0">Create Time:</span>
                    <span class="order_status0">Order Status:</span>
                    <span class="order_price0">Total Price:</span>
                </div>
                <div>
                    <span class="order_title">book_order1.order_id</span>
                    <span class="order_time">book_order1.create_time</span>
                    <span class="order_status">book_order1.order_status</span>
                    <span class="order_price">total price</span>
                    <button class="return">Apply For Return</button>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></span>
                        <span class="book_quantity">1</span>
                        <span class="book_price">$15</span>
                    </div>
                    <p class="index_n"></p>
                </div>
                <div>
                    <span class="order_title0">Order:</span>
                    <span class="order_time0">Create Time:</span>
                    <span class="order_status0">Order Status:</span>
                    <span class="order_price0">Total Price:</span>
                    <!--<button class="apply-for-return">Apply For Return</button>-->
                </div>
                <div>
                    <span class="order_title">book_order2.order_id</span>
                    <span class="order_time">book_order2.create_time</span>
                    <span class="order_status">book_order2.order_status</span>
                    <span class="order_price">total price</span>
                    <button class="return">Apply For Return</button>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></span>
                        <span class="book_quantity">1</span>
                        <span class="book_price">$15</span>
                    </div>
                    <p class="index_n"></p>
                </div>
                <div>
                    <span class="order_title0">Order:</span>
                    <span class="order_time0">Create Time:</span>
                    <span class="order_status0">Order Status:</span>
                    <span class="order_price0">Total Price:</span>
                    <!--<button class="apply-for-return">Apply For Return</button>-->
                </div>
                <div>
                    <span class="order_title">book_order3.order_id</span>
                    <span class="order_time">book_order3.create_time</span>
                    <span class="order_status">book_order3.order_status</span>
                    <span class="order_price">total price</span>
                    <button class="return">Apply For Return</button>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Just Enough Research</a></span>
                        <span class="book_quantity">2</span>
                        <span class="book_price">$50</span>
                    </div>
                    <p class="index_n"></p>
                    <div>
                        <span class="img_book"><a href="#"><img src="/starbooks/resource/book/image/5a45dc0cNf1c081f0.jpg" alt="book" /></a></span>
                        <span class="book_title">Title :</span>
                        <span class="book_quantity">Quantity :</span>
                        <span class="book_price">Price :</span>
                        <span class="book_title"><a href="#" target="_blank">Content Strategy for Mobile</a></span>
                        <span class="book_quantity">1</span>
                        <span class="book_price">$15</span>
                    </div>
                    <p class="index_n"></p>
                </div>
            </div>

            <p class="index_hr"></p>

        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>

</html>