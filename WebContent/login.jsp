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
	background-image: radial-gradient(circle, #DC143C, #00F5FF, #912CEE);
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

.container {
	background-image: linear-gradient(to right bottom, #00B2EE, #FF00FF);
	padding: 3rem;
	display: flex;
	flex-direction: column;
	box-shadow: 0 2rem 4rem #777777;
	margin-top: 5rem;
}

.text {
	font-size: 2.5rem;
	font-weight: 200;
	font-family: sans-serif;
	color: white;
}

.link, .link:visited {
	color: #00F5FF;
	font-size: 2.2rem;
	align-self: center;
}

.link:hover {
	color: #00FF00;
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

.login {
	display: flex;
	flex-direction: column;
}

.btn {
	padding: 1rem 4rem;
	margin: 2rem;
	align-self: center;
	font-size: 2.5rem;
	border-radius: 100px;
	background-image: linear-gradient(to right bottom, #B23AEE, #00FF7F);
	color: beige;
	cursor: pointer;
}

.btn:hover {
	transform: scale(1.1);
	background-image: linear-gradient(to left top, #B23AEE, #00E5EE);
}

.error {
	align-self: center;
	color: red;
	font-size: 2.2rem;
	font-family: monospace;
	text-transform: uppercase;
	letter-spacing: 2px;
}
</style>
<meta charset="ISO-8859-1">
<title>Expense Manager| Login</title>
</head>


<body>

	<script>
		function myFunction() {
			var x = document.getElementById("fname");
			x.value = x.value.toLowerCase();
		}
	</script>

	<div class="container">
		<h1 class="heading">EXPENSE MANAGER</h1>
		<form action="login" method="post" class="login">
			<div>
				<label class="text">First Name:</label> <input class="input"
					type="text" name="firstname" required="required">
			</div>
			<nav>
				<label class="text" style="margin-right: 5.8rem;">Email:</label> <input
					class="input" type="email" name="email" required="required"
					id="fname" onChange="myFunction()">
			</nav>

			<div>
				<label class="text" style="margin-right: 1.1rem;">Password:</label>
				<input class="input" type="password" name="password"
					required="required">
			</div>
			<button class="btn">LOGIN</button>
			<%
				response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
			String error = (String) session.getAttribute("error");
			if (error != null) {
				out.print("<h1 class=error>" + error + "</h1>");
			}
			session.removeAttribute("error");
			session.invalidate();
			%>
		</form>

		<a href="signup.jsp" class="link">Not a user - Signup </a>
	</div>

</body>
</html>