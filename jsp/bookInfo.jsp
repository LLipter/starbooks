<%@page import="model.*"%>
	<%@page import="listener.*"%>
		<%@page contentType="text/html;charset=UTF-8" %>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>Welcome to starbooks</title>
				<link rel="stylesheet" type="text/css" href="/starbooks/resource/css/login.css">

				<%@ include file="include.jsp" %>


					<script>
						var a = document.body.innerHTML;
						document.body.innerHTML = a.replace("&#65279;", ""); 
					</script>

					<!-- <script type="text/javascript">
					$(function () {
						//改变div的高度
						$("#login_conatiner").height($(window).height());
					});
				</script> -->

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
							<form action="/starbooks/BookInfo" method="post" class="white-pink" enctype="multipart/form-data">
								<h1>
									Edit Book Info
									<span>Please fill all the texts in the fields.
									</span>
								</h1>

								<% 
						
						String modify=request.getParameter("Modify");
						Book book = new Book();
						if(modify!=null){
							int bookid=Integer.parseInt(request.getParameter("book_id"));
							book = DatabaseUtility.getBook(bookid);
						}

						%>
									<input type="hidden" name='res_url' value='<%= book.getRes_url() %>' />
									<input type="hidden" name='book_id' value='<%= book.getBook_id() %>' />
									<label>
										<span>Title:</span>
										<input type="text" name="book_title" value='<%if(modify != null) out.print(book.getBook_name()); %>' />
									</label>
									<label>
										<span>Author:</span>
										<input type="text" name="book_Author" value='<%if(modify != null) out.print(book.getAuthor()); %>' />
									</label>
									<label>
										<span>Publisher</span>
										<input type="text" name="book_publisher" value='<%if(modify != null) out.print(book.getPublisher()); %>' />
									</label>
									<label>
										<span>Price</span>
										<input type="text" name="book_price" value='<%if(modify != null) out.print(book.getPrice()); %>' />
									</label>
									<label>
										<span>Description</span>
										<textarea rows="10" cols="20" name="description" warp="soft"><%if(modify != null) out.print(book.getDescription()); %>
								</textarea>
									</label>
									<label>
										<span>Information</span>
										<textarea rows="10" cols="20" name="information" warp="soft"><%if(modify != null) out.print(book.getInformation()); %>
								</textarea>
									</label>
									<label>
										<span>Reviews</span>
										<textarea rows="10" cols="20" name="review" warp="soft"><%if(modify != null) out.print(book.getReviews()); %>
								</textarea>
									</label>

									<label>
										<span>Status</span>
										<select name="status">
										<% 
										if(book.getBook_status() == 1) 
											out.println("<option selected='selected'>avaliable</option><option>unavaliable</option>");
										else 
											out.println("<option>avaliable</option><option selected='selected'>unavaliable</option>");

										%>


										</select>
									</label>
									<label>

											<% 
											if(book.getBook_id() == -1) 
												out.println("<span>Cover</span><input type='file' name='cover' accept='.jpg' />");
	
											%>

										
										
									</label>
									<br/>
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