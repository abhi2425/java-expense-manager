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
	background-image: radial-gradient(circle, #DC143C, orange, #FF3030);
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
	color: #FF9912;
}

.container {
	background-image: linear-gradient(to right bottom, red, orange);
	padding: 3rem;
	display: flex;
	flex-direction: column;
	box-shadow: 0 2rem 4rem #777777;
	margin-top: 1rem;
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

.signup {
	display: flex;
	flex-direction: column;
}

.btn {
	padding: 1rem 4rem;
	margin: 2rem;
	align-self: center;
	font-size: 2.5rem;
	border-radius: 100px;
	background-image: linear-gradient(to right bottom, orange, red);
	color: beige;
	cursor: pointer;
}

.btn:hover {
	transform: scale(1.1);
	background-image: linear-gradient(to left top, orange, red);
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
<title>Expense Manager | Data Update</title>
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
		<h1 class="heading">UPDATE YOUR EXPENSES</h1>
		<form action="updatedata" method="post" class="signup">
			<div>
				<label class="text" style="margin-right: 4.9rem">First Name:</label>
				<input class="input" type="text" name="firstname"
					required="required">
			</div>

			<div>
				<label class="text " style="margin-right: 0.4rem">Old Item
					Name:</label> <input class="input" type="text" name="olditemname"
					required="required">
			</div>

			<nav>
				<label class="text">New Item Name</label> <input class="input"
					type="text" name="newitemname" required="required">
			</nav>
			<div>
				<label class="text" style="margin-right: 2.7rem">New
					Price($):</label> <input class="input" type="text" name="newprice"
					required="required">
			</div>

			<div>
				<label class="text" style="margin-right: 6rem">Password:</label> <input
					class="input" type="password" name="password" required="required">
			</div>
			<%
				String result = (String) session.getAttribute("result");
			if (result != null) {
				out.print("<h1 class =result >" + result + "</h1>");
			}
			session.removeAttribute("result");
			%>

			<button class="btn">Update Data</button>
		</form>
	</div>


</body>
</html>