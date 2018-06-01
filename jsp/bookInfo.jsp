<%@page import="model.*"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Welcome to starbooks</title>
		<link rel="stylesheet" type="text/css" href="/starbooks/resource/css/login.css">

		<%@ include file="include.jsp" %>




			<script type="text/javascript">
				$(function () {
					//改变div的高度
					$("#login_conatiner").height($(window).height() - 200);
				});
			</script>
	
	</head>


	<body>

		<%@ include file="header.jsp" %>


			<div class="banner-top">
				<div class="container">
					<h1>Edit</h1>
					<em></em>
					<h2>
						<a href="/starbooks/jsp/index.jsp">Home</a>
						<label>/</label>Edit</a>
					</h2>
				</div>
			</div>





			<div class="login_container" id="login_conatiner">
				<div class="login">
					<form action="/starbooks/BookInfo" method="post" class="white-pink">
						<h1>
							Edit Book Info
							<span>Please fill all the texts in the fields.
							</span>
						</h1>
						
						<% 
						
						String modify=request.getParameter("Modify");
						if(modify!=null){
						int bookid=Integer.parseInt(request.getParameter("book_id"));

						out.println("<label>");
						out.println("<span>Book id</span>");
						out.println("<input type='text' name='book_id' value="+bookid+">");
						out.println("</label>");
						}
						else{
						out.println("<label>");
						out.println("<span>Book id</span>");
						out.println("<input type='text' name='book_id' />");
						out.println("</label>");
					}
						%>
						<label>
							<span>Title:</span>
							<input type="text" name="book_title" />
						</label>
						<label>
							<span>Author:</span>
							<input type="text" name="book_Author" />
						</label>
						<label>
								<span>Publisher</span>
								<input type="text" name="book_publisher" />
						</label>
						<label>
									<span>Price</span>
									<input type="text" name="book_price" />
						</label>
						<label>
								<span>Resource</span>
								<input type="text" name="book_resource" />
							</label>
						<label>
						    <span>Status</span>
						       <select name="status">
						            <option >
						             avaliable
						             </option>
						            <option >
						            unavaliable
						            </option>
						      </select>
						</label>
									<label>
								

								<p class="message">

									<% 
										String res = (String) request.getAttribute("BookInfoResult");
										if(res != null){
											out.println(res);
										}
									%>



								</p>
							</label>
							
									
									<label>
										<div class="button_container">
											<input type="submit" class="button" value="Confirm" />
										</div>
									</label>
								</label>
							</label>
					</form>
				</div>
			</div>




			<%@ include file="footer.jsp" %>
	</body>

	</html>