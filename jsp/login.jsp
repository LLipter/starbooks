<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to starbooks</title>
<link rel="stylesheet" type="text/css" href="/starbooks/resource/css/login.css">
</head>
<body>
	<div class="heading_container">
		<div class="heading">
			<!-- <p>Welcome to Starbooks!</p> -->
		</div>
	</div>
	<div class="login_container">
		<div class="login">
			<!-- <form action="login" method="post">
                userName:
                <input type="text" name="user_name"> password:
                <input type="password" name="passwd">
                <input type="submit">
            </form> -->
			<form action="/starbooks/login" method="post" class="white-pink">
				<h1>
					Login to Starbooks <span>Please fill all the texts in the
						fields.</span>
				</h1>
				<label> <span>User Name :</span> <input type="text"
					name="user_name" />
				</label> <label> <span>Password :</span> <input type="password"
					name="passwd" />
				</label> <label>
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
				</label> <label>
					<div class="button_container">
						<input type="submit" class="button" />
					</div>
				</label>
			</form>
		</div>
	</div>
</body>
</html>