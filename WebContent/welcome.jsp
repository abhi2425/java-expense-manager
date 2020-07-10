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
	background-image: radial-gradient(circle, #FF3030, #8A2BE2);
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.container {
	background-image: linear-gradient(to right bottom, #00F5FF, #00FF00);
	padding: 3rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	box-shadow: 0 2rem 4rem #777777;
	margin-top: 1rem;
}

.link, .link:visited {
	font-size: 2.8rem;
	font-family: sans-serif;
	font-weight: 300;
	text-decoration: none;
	text-transform: uppercase;
	margin: 2.5rem;
	background-image: linear-gradient(to left bottom, #FF00FF, #FFD700);
	padding: 1.5rem 3rem;
	border-radius: 100px; '
	color: white;
}

.link:hover {
	background-image: linear-gradient(to right top, #FF00FF, #FFD700);
	transform: scale(1.2);
}

.heading {
	color: white;
	font-size: 3.2rem;
	text-align: center;
	letter-spacing: 2px;
	text-transform: uppercase;
}

.heading:hover {
	transform: scale(1.08);
}

.style1 {
	font-style: italic;
	font-weight: 700;
	color: #FF00FF;
}

.form {
	margin: 10rem;
}

.btn {
	font-size: 2.8rem;
	padding: 1.5rem 3rem;
	background-image: linear-gradient(to right bottom, #00FFFF, #00FF00);
	color: white;
	border-radius: 100px;
	text-transform: uppercase;
	cursor: pointer;
}

.btn:hover {
	background-image: linear-gradient(to left top, #00FFFF, #00FF00);
	transform: scale(1.2);
	box-shadow: 0 2rem 4rem #777777;
}

.error {
	color: red;
	font-size: 2.2rem;
	font-family: monospace;
	text-transform: uppercase;
	letter-spacing: 2px;
}
</style>
<meta charset="ISO-8859-1">
<title>Expense Manager | Welcome!!!</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
	if (session.getAttribute("username") == null
			&& session.getAttribute("fname") == null) {
		response.sendRedirect("login.jsp");
	}
	String firstname = (String) session.getAttribute("fname");
	%>
	<div class="container">
		<h1 class="heading style1">
			HII !!!
			<%=firstname%>
		</h1>
		<h1 class="heading">WELCOME IN EXPENSE MANAGER!!!</h1>

		<a href="insert.jsp" class="link">Data Entry</a> <a href="update.jsp"
			class="link">Data Update</a> <a href="read.jsp " class="link">Fetch
			User Data</a>
		<%
			String empty = (String) session.getAttribute("empty");
		if (empty != null) {
			out.println("<h1 class= error>" + empty + "</h1>");
		}
		session.removeAttribute("empty");
		%>
		<a href="totalexpense.jsp" class="link">Total Expense </a>
	</div>
	<form action="logout" method="post" class="form">
		<input type="submit" value="Logout " class="btn">
	</form>
</body>
</html>