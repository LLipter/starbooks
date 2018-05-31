<%@page import="model.*"%>
	<%@page contentType="text/html;charset=UTF-8" %>
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
						$("#login_conatiner").height($(window).height());
					});
				</script>
		</head>


		<body>
			<%@ include file="header.jsp" %>


				<div class="banner-top">
					<div class="container">
						<h1>Register</h1>
						<em></em>
						<h2>
							<a href="/starbooks/jsp/index.jsp">Home</a>
							<label>/</label>Register</a>
						</h2>
					</div>
				</div>





				<div class="login_container" id="login_conatiner">
					<div class="login">
						<form action="/starbooks/register" method="post" class="white-pink" enctype="multipart/form-data">
							<h1>
								Register to Starbooks
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
								<span>Confirm Password :</span>
								<input type="password" name="passwd_confirm" />
							</label>
							<label>
								<span>Gender</span>
								<select name="gender">
									<option value = '1'>
										male
									</option>
									<option value = '0'>
										female
									</option>
								</select>
							</label>
							<label>
								<span>Birthday</span>
								<input type="date" name="birthday" />
							</label>
							<label>
								<span>Address</span>
								<input type="text" name="address" />
							</label>
							<label>
								<span>Phone</span>
								<input type="text" name="phone" />
							</label>
							<label>
								<span>Email</span>
								<input type="text" name="email" />
							</label>
							<label>
								<span>Portrait</span>
								<input type="file" name="portrait" accept=".jpg"/>
							</label>
							<br/>
							<label>
								<p class="message">

									<% 
										String res = (String) request.getAttribute("registerResult");
										if(res != null){
											out.println(res);
										}
									%>



								</p>
							</label>
							<label>
								<div class="button_container">
									<input type="submit" class="button" value="Register" />
								</div>
							</label>
						</form>
					</div>
				</div>





				<%@ include file="footer.jsp" %>
		</body>

		</html>