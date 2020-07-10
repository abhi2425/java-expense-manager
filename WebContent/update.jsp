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
	background-image: radial-gradient(circle, #FF3E96, #FF00FF, #7D26CD);
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.container {
	background-image: linear-gradient(to right bottom, #1C86EE, #EE2C2C);
	padding: 3rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	box-shadow: 0 2rem 4rem #777777;
	margin-top: 4rem;
}

.link, .link:visited {
	font-size: 2.8rem;
	font-family: sans-serif;
	font-weight: 300;
	text-decoration: none;
	text-transform: uppercase;
	margin: 2.5rem;
	background-image: linear-gradient(to left bottom, #00FA9A, #FFD700);
	padding: 1.5rem 3rem;
	border-radius: 100px; '
	color: white;
}

.link:hover {
	background-image: linear-gradient(to right top, #00FA9A, #FFD700);
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
	color: #00FA9A;
}
</style>
<meta charset="ISO-8859-1">
<title>Expense Manger | Manage Data</title>
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
		<h1 class="heading">UPDATE YOUR DATA</h1>

		<a href="password.jsp" class="link">CHANGE PASSWORD</a> <a
			href="name.jsp" class="link">CHANGE NAME</a> <a
			href="updatedata.jsp " class="link">UPDATE DATA</a>
	</div>
</body>
</html>