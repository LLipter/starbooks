<%@page import="model.*"%>
<%@page import="listener.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>User</title>
    <!--底层布局的css-->
    <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/reset.css" />
    <!--样式css-->
    <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/user.css" />

    <%@ include file="include.jsp" %>


    <script>
            function cancelOrder(button){
        
                var form = document.createElement("form");  
                form.action = '/starbooks/cancelorder';  
                form.method = "post";  
                form.style.display = "none";  
        
                var order_id = document.createElement("textarea");  
                order_id.name = 'order_id';  
                order_id.value = button.nextSibling.innerHTML;
                form.appendChild(order_id);  
        
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

<div class="banner-top">
    <div class="container">
        <h1>User Page</h1>
        <em></em>
        <h2><a href="/starbooks/jsp/index.jsp">Home</a><label>/</label>User Page</a></h2>
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
                    <span class="img"><img src="/starbooks/resource/user/<%= user.getUser_id() %>.jpg" onerror="this.src='/starbooks/resource/images/randomUser<%=(int)(1+Math.random()*(6-1+1))%>.png'" alt="user" /></span>
                    <span class="user">User Name :</span>
                    <span class="user_id"><%= user.getUser_name() %></span>
                    <span class="user">User Gender</span>
                    <span class="user_gender"><%= user.getGender() == 1 ? "male" : "female" %></span>
                    <span class="user">User Birthday</span>
                    <span class="user_birthday"><%= user.getBirthday() %></span>
                    <span class="user">User Address :</span>
                    <span class="user_address"><%= user.getAddress() %></span>
                    <span class="user">User Phone :</span>
                    <span class="user_phone"><%= user.getPhone() %></span>
                    <span class="user">User Email :</span>
                    <span class="user_email"><%= user.getEmail() %></span>
                </div>

                <% ArrayList<Order> orders = DatabaseUtility.getOrder(user); %>
                <%--<p class="index_hr"></p>--%>
                <%--<br/><br/>--%>
                <%--<div>--%>
                    <%--<span class="order_title0">Order:</span>--%>
                    <%--<span class="order_time0">Create Time:</span>--%>
                    <%--<span class="order_status0">Order Status:</span>--%>
                    <%--<span class="order_price0">Total Price:</span>--%>
                <%--</div>--%>

                <%
                if(orders.size()==0){
                    out.println("<p class='index_hr'></p>");
                        out.println("<br/><br/>");
                        out.println("<div>");
                        out.println("<span class='order_title0'>Order:</span>");
                        out.println("<span class='order_time0'>Create Time:</span>");
                        out.println("<span class='order_status0'>Order Status:</span>");
                        out.println("<span class='order_price0'>Total Price:</span>");
                        out.println("</div>");
                        out.println("<div>");
                        out.println("<span class='order_title'>");
                        out.println("Empty order~");
                        out.println("</span>");
                        out.println("</span>");
                        out.println("<span class='order_time'>");
                        out.println("Empty order~");
                        out.println("</span>");
                        out.println("<span class='order_status'>");
                        out.println("Buy something~");
                        out.println("</span>");
                        out.println("<span class='order_price'>");
                        out.println("Go~");
                        out.println("</span>");
                        out.println("</div>");

                }else{
                    for(Order order : orders){
                        out.println("<p class='index_hr'></p>");
                        out.println("<br/><br/>");
                        out.println("<div>");
                        out.println("<span class='order_title0'>Order:</span>");
                        out.println("<span class='order_time0'>Create Time:</span>");
                        out.println("<span class='order_status0'>Order Status:</span>");
                        out.println("<span class='order_price0'>Total Price:</span>");
                        out.println("</div>");
                        out.println("<div>");
                        out.println("<span class='order_title'>");
                        out.println(order.getOrder_id());
                        out.println("</span>");
                        out.println("<span class='order_time'>");
                        out.println(order.getCreated_time());
                        out.println("</span>");
                        out.println("<span class='order_status'>");
                        if(order.getOrder_status()==1){
                            out.println("Normal");
                        }else{
                            out.println("Cancelled");
                        }
                        out.println("</span>");
                        out.println("<span class='order_price'>");
                        out.println(order.getTotalPrice());
                        out.println("</span>");
                        if(order.getOrder_status() == 1){

                            out.print("<button class='return' onclick='cancelOrder(this)'>Cancel</button>");
                            out.println("<div  class='order_id' style='display: none'>" + order.getOrder_id() + "</div>");
                        }
                        for(Item item : order){
                            out.println("<p class='index_n'></p>");
                            out.println("<div>");
                            out.println("<span class='img_book'><img src='/starbooks/resource/book/image/");
                            out.println(item.getBook().getRes_url());
                            out.println(".jpg'/></span>");
                            out.println("<span class='book_title'>Title :</span>");
                            out.println("<span class='book_quantity'>Quantity :</span>");
                            out.println("<span class='book_price'>Price :</span>");
                            out.println("<span class='book_title'>");
                            out.println(item.getBook().getBook_name());
                            out.println("</span>");
                            out.println("<span class='book_quantity'>");
                            out.println(item.getQuantity());
                            out.println("</span>");
                            out.println("<span class='book_price'>");
                            out.println(item.getBook().getPrice());
                            out.println("</span>");
                            out.println("</div>");
                        }
                        out.println("</div>");
                    }
                }

                %>


                 <p class="index_hr"></p>



            </div>


        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>

</html>
