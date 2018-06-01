<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="listener.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>UI for Admin</title>
		<link href = "/starbooks/resource/css/reset.css" rel = "stylesheet" type="text/css"/>
		<link href = "/starbooks/resource/css/admin.css" rel = "stylesheet" type="text/css"/>

		<script>
            function changeStatus(bookid,aim_status){
        
                var form = document.createElement("form");  
                form.action = '/starbooks/ChangeStatus';  
                form.method = "post";  
                form.style.display = "none";  
        
                var book_id = document.createElement("textarea");  
                book_id.name = 'book_id';  
                book_id.value = bookid;
                form.appendChild(book_id);  
				
				var aim_status = document.createElement("textarea");  
                aim_status.name = 'aim_status';  
                aim_status.value = aim_status;
                form.appendChild(aim_status); 
        
                document.body.appendChild(form);  
                form.submit();  
                           
            }

			function changeBook(status){
				var form = document.createElement("form");  
                form.action = '/starbooks/jsp/admin.jsp';  
                form.method = "get";  
                form.style.display = "none";  
				
				var book_status = document.createElement("textarea");  
                book_status.name = 'book_status';  
                book_status.value = status;
                form.appendChild(book_status); 
        
                document.body.appendChild(form);  
                form.submit(); 
			}
        
        </script>
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
						    <th>上架书数量</th><!--whatever-->
							<th>下架书数量</th>
							<th>total user number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
					        <th><%= DatabaseUtility.getNumberOfBook(1) %></th>
							<th><%= DatabaseUtility.getNumberOfBook(0) %></th>
							<th><%= DatabaseUtility.getNumberOfUser() %></th>
						</tr>
						</tbody>
				</table>
			</div>
			<p class = "admin_hr"></p>
			<div class = "content">
				<!--
				<a class = "admin_add" href = "#" target = "_blank">Add books</a> -->
				<!--添加和修改跳转到同一书籍信息界面-->
				<a class = "admin_add" href = "/starbooks/jsp/bookInfo.jsp"><button>Add books</button></a>
				<%
					int book_status = 1;
					if(request.getParameter("book_status") != null){
						book_status = Integer.parseInt(request.getParameter("book_status"));
					}
					if(book_status == 1)
						out.println("<input class = 'book_status' type='button' id = 'statusBtn' onclick = 'changeBook(0)' value = '查看下架书'/>");
					else
						out.println("<input class = 'book_status' type='button' id = 'statusBtn' onclick = 'changeBook(1)' value = '查看上架书'/>");

				%>
				
				<ul>
					<%
                                    ArrayList<Book> books = DatabaseUtility.getAllBooks(book_status);
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
										if(book_status == 1)
											out.println("<button type='button' onclick='changeStatus("+book.getBook_id() + ",0)'>下架</button>");
										else
											out.println("<button type='button' onclick='changeStatus("+book.getBook_id() + ",1)'>上架</button>");


                                        out.println("<a href='/starbooks/jsp/bookInfo.jsp?Modify=true"+"&book_id="+book.getBook_id()+"'><button>Modify</button></a> ");
                                        out.println("</dt>");
                                        out.println("</dl>");
                                        out.println("</li>");

                                    }

                    %>
                </ul>


		</div>
			</div>
		</div>

		<%@ include file="footer.jsp" %>
	</body>
</html>