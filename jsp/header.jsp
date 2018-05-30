<!--头部-->
<%@page import= "model.*" %>
<div class="header">
    <div class="container">
        <div class="head">
            <div class=" logo">
                <a href="/starbooks/jsp/index.jsp">
                    <img src="/starbooks/resource/images/logo.png" alt="">
                </a>
            </div>
        </div>
    </div>

    <div class="header-top">
        <div class="container">
            <div class="col-sm-5 col-md-offset-2  header-login">
                <ul>
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
                <ul>
                    <li>
                        <a href="resource/#">
                            <i></i>
                        </a>
                    </li>
                    <li>
                        <a href="resource/#">
                            <i class="ic1"></i>
                        </a>
                    </li>
                    <li>
                        <a href="resource/#">
                            <i class="ic2"></i>
                        </a>
                    </li>
                    <li>
                        <a href="resource/#">
                            <i class="ic3"></i>
                        </a>
                    </li>
                    <li>
                        <a href="resource/#">
                            <i class="ic4"></i>
                        </a>
                    </li>
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
                            <li>
                                <a class="color" href="/starbooks/jsp/index.jsp">Home</a>
                            </li>
                            <li>
                                <a class="color3" href="/starbooks/userhome">User</a>
                            </li>
                            <li>
                                <a class="color4" href="/starbooks/CartCenter">Cart</a>
                            </li>
                        </ul>
                    </div>

                </nav>
            </div>
            <div class="col-sm-2 search-right">
                <div class="cart box_1">
                    <a href="/starbooks/jsp/cart.jsp">
                        <h3>
                            <div class="total">
                                <span class="price">
                                    <%
                                        Order cart = (Order) session.getAttribute("cart");
                                        if(cart == null)
                                            out.print("$0.00");
                                        else
                                            out.print("$" + cart.getTotalPrice());
                                    %>


                                </span>
                            </div>
                            <img src="/starbooks/resource/images/cart.png" alt="" />
                        </h3>
                    </a>
                    <p>
                        <a href="/starbooks/jsp/cart.jsp" class="simpleCart_empty">Cart</a>
                    </p>

                </div>
                <div class="clearfix"> </div>



            </div>
        </div>
    </div>
</div>

<!--以上为导航栏-->