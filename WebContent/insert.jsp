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
	background-image: radial-gradient(circle, #912CEE, #FF4040, #FF00FF);
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
	color: #00B2EE;
	font-style: italic;
	text-transform: uppercase;
}

.container {
	background-image: linear-gradient(to right bottom, #FF0000, #FF00FF);
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

.input {
	margin: 1rem 1.5rem;
	padding: 1rem 3rem;
	font-size: 2.2rem;
}

.input:focus {
	background-color: #eeeeee;
	border: 1px soild cyan;
}

.insert {
	display: flex;
	flex-direction: column;
}

.btn {
	padding: 1rem 4rem;
	margin: 2rem;
	align-self: center;
	font-size: 2.5rem;
	border-radius: 100px;
	background-image: linear-gradient(to right bottom, #FF4040, #436EEE);
	color: beige;
	cursor: pointer;
}

.btn:hover {
	transform: scale(1.1);
	background-image: linear-gradient(to left top, #FF4040, #912CEE);
}

.result {
	align-self: center;
	font-size: 2.2rem;
	font-family: monospace;
	text-transform: capitalize;
	letter-spacing: 2px;
	color: skyblue;
}
</style>

<meta charset="ISO-8859-1">
<title>Expense Manager | Insert Data</title>
</head>
<body>

	<div class="container">
		<%
			response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
		if (session.getAttribute("username") == null
				&& session.getAttribute("fname") == null) {
			response.sendRedirect("login.jsp");
		}
		String fname = (String) session.getAttribute("fname");
		%>
		<h1 class="heading  style1">
			HII !!!<%=fname%></h1>
		<h1 class="heading">INSERT YOUR EXPENSES!!!</h1>
		<form action="insert" method="post" class="insert">
			<div>
				<label class="text" style="margin-right: 2.5rem;">First
					Name:</label> <input class="input" type="text" name="name"
					required="required">
			</div>
			<nav>
				<label class="text" style="margin-right: 2.5rem;">Item Name:</label>
				<input class="input" type="text" name="itemname" required="required">
			</nav>

			<div>
				<label class="text">Item Price ($):</label> <input class="input"
					type="text" name="itemprice" required="required">
			</div>
			<%
				String notinserted = (String) session.getAttribute("notinserted");
			String result = (String) session.getAttribute("result");
			String nameerror = (String) session.getAttribute("nameerror");

			if (result != null) {
				out.print("<h1 class=result>" + result + "</h1>");
			}
			if (nameerror != null) {

				out.print("<h1 class=result>" + nameerror + "</h1>");
			}
			if (notinserted != null) {
				out.print("<h1 class=result>" + notinserted + "</h1>");
			}
			session.removeAttribute("notinserted");
			session.removeAttribute("result");
			session.removeAttribute("nameerror");
			%>

			<button class="btn">Submit</button>
		</form>
	</div>



</body>
</html>