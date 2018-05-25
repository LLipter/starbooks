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
					$("#login_conatiner").height($(window).height() - 80 - 76 - 250);
				});
			</script>
	</head>


	<body>

		<%@ include file="header.jsp" %>


			<div class="banner-top">
				<div class="container">
					<h1>Login</h1>
					<em></em>
					<h2>
						<a href="/starbooks/jsp/index.jsp">Home</a>
						<label>/</label>Login</a>
					</h2>
				</div>
			</div>





			<div class="login_container" id="login_conatiner">
				<div class="login">
					<!-- <form action="login" method="post">
                userName:
                <input type="text" name="user_name"> password:
                <input type="password" name="passwd">
                <input type="submit">
            </form> -->
					<form action="/starbooks/login" method="post" class="white-pink">
						<h1>
							Login to Starbooks
							<span>Please fill all the texts in the fields.
							</span>
						</h1>
						<label>
							<span>User Name :</span>
							<input type="text" name="user_name" />
						</label>
						<label>
							<span>Password :</span>
							<input type="password" name="passwd" />
						</label>
						<label>
							<p class="message">

								<% 
									String res = (String) request.getAttribute("loginResult");
									if(res != null){
										if(res.equals("login successfully")){
											out.println("Hello, " + (String)request.getAttribute("user_name"));
											out.println("your password is " + (String)request.getAttribute("passwd"));
										}else{
											out.println(res);
										}
									}
								%>
							</p>
						</label>
						<%
							if(request.getParameter("admin") != null)
								out.println("<input type='hidden' name='admin' value='true'/>");
                		%>


							<label>
								<div class="button_container">
									<input type="submit" class="button" value="Login" />
								</div>
							</label>
					</form>
				</div>
			</div>



			<%@ include file="footer.jsp" %>



	</body>

	</html>