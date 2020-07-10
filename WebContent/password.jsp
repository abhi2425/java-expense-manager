<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
html {
	font-size: 62.5%;
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	background-image: radial-gradient(circle, #1C86EE, #00CD66, #00B2EE);
	display: flex;
	justify-content: center;
	align-items: center;
}

.heading {
	color: white;
	font-size: 3.2rem;
	text-align: center;
	letter-spacing: 2px;
}

.heading:hover {
	transform: scale(1.2);
}

.style1 {
	text-transform: uppercase;
	font-style: italic;
	color: #9B30FF;
}

.container {
	background-image: linear-gradient(to right bottom, #8470FF, #00FF00);
	padding: 3rem;
	display: flex;
	flex-direction: column;
	box-shadow: 0 2rem 4rem #777777;
	margin-top: 2rem;
}

.text {
	font-size: 2.5rem;
	font-weight: 200;
	font-family: sans-serif;
	color: white;
}

.link, .link:visited {
	color: #7D26CD;
	font-size: 2.2rem;
	align-self: center;
}

.link:hover {
	color: #00FF7F;
	transform: scale(1.2);
	transtion: transform .8s ease-out;
}

.input {
	margin: 1rem 1.5rem;
	padding: 1rem 3rem;
	font-size: 2.2rem;
}

.input:focus {
	background-color: #eeeeee;
	border: 1px soild cyan;
}

.password {
	display: flex;
	flex-direction: column;
}

.btn {
	padding: 1rem 4rem;
	margin: 2rem;
	align-self: center;
	font-size: 2.5rem;
	border-radius: 100px;
	background-image: linear-gradient(to right bottom, #00F5FF, #8470FF);
	color: beige;
	cursor: pointer;
}

.btn:hover {
	transform: scale(1.1);
	background-image: linear-gradient(to left top, #00F5FF, #8470FF);
}

.outcontainer {
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	background-image: linear-gradient(#8470FF, #00FF00);
	padding: 2rem;
	margin: 2rem;
	justify-content: space-between;
	align-items: center;
}

.logtext {
	font-size: 2.5rem;
	color: beige;
	text-transform: capitalize;
	text-align: center;
	font-style: italic;
	font-family: sans-serif;
	font-weight: 400;
	letter-spacing: 1px;
	display: block;
}

.result {
	align-self: center;
	color: red;
	font-size: 2.2rem;
	font-family: monospace;
	text-transform: uppercase;
	letter-spacing: 2px;
}
</style>
<meta charset="ISO-8859-1">
<title>Expense Manger | Change Password</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
	if (session.getAttribute("username") == null
			&& session.getAttribute("fname") == null) {
		response.sendRedirect("login.jsp");
	}
	String fname = (String) session.getAttribute("fname");
	%>



	<div class="container">
		<h1 class="heading style1">
			HII!!!
			<%=fname%></h1>
		<h1 class="heading">CHANGE YOUR PASSWORD!!!</h1>
		<form action="password" method="post" class="password">
			<div>
				<label class="text" style="margin-right: 4.8rem;">First
					Name:</label> <input class="input" type="text" name="firstname"
					required="required">
			</div>

			<nav>
				<label class="text" style="margin-right: 10.7rem;">Email:</label> <input
					class="input" type="email" name="email" required="required">
			</nav>

			<div>
				<label class="text" style="margin-right: 1.3rem;">Old
					Password:</label> <input class="input" type="password" name="oldpassword"
					required="required">
			</div>

			<div>
				<label class="text">New Password:</label> <input class="input"
					type="password" name="newpassword" required="required"
					minlength="8" pattern="[a-zA-Z0-9@#$.]*">
			</div>
			<%
				String result = (String) session.getAttribute("result");
			if (result != null) {
				out.print("<h1 class =result >" + result + "</h1>");
			}
			session.removeAttribute("result");
			%>

			<button class="btn">Change Password</button>
		</form>
	</div>
	<div class="outcontainer">
		<div class="logtext">
			Please Logout After Changing The Password<br> And Again Login
			With New Credentials....
		</div>

		<form action="logout" method="post" class="">
			<input type="submit" value="Logout " class="btn">
		</form>
	</div>


</body>
</html>