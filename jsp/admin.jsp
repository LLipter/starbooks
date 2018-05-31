<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="listener.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>UI for Admin</title>
		<link href = "/starbooks/resource/css/reset.css" rel = "stylesheet" type = "text/css"/>
		<link href = "/starbooks/resource/css/admin.css" rel = "stylesheet" type="text/css"/>
		<!--默认查看上架书籍 点击文本替换为下架书籍-->
		<%@ include file="include.jsp" %>
	</head>
	<body>
		<div class = "main">
			<%@ include file="header.jsp" %>
	<div class="banner-top">
			<div class="container">
				<h1>Admin</h1>
				<em></em>
				<h2><a href="/starbooks/jsp/index.jsp">Home</a><label>/</label>Admin</a></h2>
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
                                        out.println("<button type='button'>Remove</button> ");
                                        out.println("<a href='#'><button>Modify</button></a> ");
                                        out.println("</dt>");
                                        out.println("</dl>");
                                        out.println("</li>");

                                    }

                    %>
                </ul>


				<!--
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
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					-->
			</div>
		</div>

		<%@ include file="footer.jsp" %>
	</body>
</html>