<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="listener.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8" />
        <title>Home for StarBook</title>
        <!--底层布局的css-->
        <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/reset.css" />
        <!--样式css-->
        <link type="text/css" rel="stylesheet" href="/starbooks/resource/css/index.css" />

        <%@ include file="include.jsp" %>
    </head>
    <body>

        <%@ include file="header.jsp" %>
            <div class="banner-top">
                <div class="container">
                    <h1>Starbooks</h1>
                    <em></em>
                    <h2>
                        <a href="/starbooks/jsp/index.jsp">Home</a>
                    </h2>
                </div>
            </div>

            <div class="container">
                <div class="w_100_l">
                    <div class="main">
                        <div class="content">
                            <h1 class="h1_book_title">Here are books for users to buy</h1>
                            <ul>
                                <!-- <li>
                                    <dl>
                                        <dd>
                                            <a href="resource/single.html">
                                                <img src="/starbooks/resource/book/book_01.jpg" alt="book" />
                                            </a>
                                        </dd>
                                        <dt>
                                            <p class="book_title">
                                                <a href="resource/single.html" target="_blank">Gift cards</a>
                                            </p>
                                            <p class="book_inline">$25, $50, and $100</p>
                                            <a class="book_buy" href="#" target="_blank">ADD TO CART</a>
                                        </dt>
                                    </dl>
                                </li> -->
                                <%
                                    ArrayList<Book> books = DatabaseUtility.getAllBooks(1);
                                    for(Book book : books){
                                        out.println("<li>");
                                        out.println("<dl>");
                                        out.println("<dd>");
                                        out.println("<a href='/starbooks/jsp/single.jsp?book_id=" + book.getBook_id() + "'>");
                                        out.println("<img class='book_image' src='/starbooks/resource/book/image/" + book.getRes_url() + ".jpg' alt='book' />");
                                        out.println("</a>");
                                        out.println("</dd>");
                                        out.println("<dt>");
                                        out.println("<p class='book_title'>");
                                        out.println("<a href='/starbooks/jsp/single.jsp?book_id=" + book.getBook_id() + "'>" + book.getBook_name() + "</a>");
                                        out.println("</p>");
                                        out.println("<p class='book_inline'>" + book.getAuthor() +"</p>");
                                        out.println("<a class='book_buy' href='/starbooks/addbook?book_id="+book.getBook_id()+"&quentity=1' target='_blank'>ADD TO CART</a>");
                                        out.println("</dt>");
                                        out.println("</dl>");
                                        out.println("</li>");

                                    }

                                %>
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