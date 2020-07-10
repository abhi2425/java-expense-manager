<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
	background-image: radial-gradient(circle, #00FA9A, #8470FF);
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	box-sizing: border-box;
}

.heading {
	color: #9400D3;
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
	color: #9400D3;
	letter-spacing: 3px;
}

.table {
	margin: 2rem;
	padding: 1rem;
	background-image: linear-gradient(to right top, #EE1289, #00F5FF);
	border-radius: 50px;
}

.head {
	font-size: 2.8rem;
	font-weight: 600;
	color: beige;
	padding: 2rem;
	border-collapse: collapse;
	font-family: cursive;
	text-align: center;
	letter-spacing: 2px;
}

.data {
	font-size: 2.6rem;
	font-weight: 400;
	color: beige;
	padding: 1.5rem;
	border-collapse: collapse;
	text-align: center;
	letter-spacing: 2px;
	text-transform: capitalize;
	font-family: sans-serif;
}

.container1 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.container3 {
	align-self: center;
	display: flex;
	justify-content: center;
	align-items: center;
	color: beige;
}
</style>

<meta charset="ISO-8859-1">
<title>Expense Manager| Fetch Data</title>
</head>
<body>


	<%
		response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
	if (session.getAttribute("username") == null
			&& session.getAttribute("fname") == null) {
		response.sendRedirect("login.jsp");
	}
	session = request.getSession();
	String firstname = (String) session.getAttribute("fname");
	%>
	<div class="container1">
		<h1 class="heading style1">
			Hii
			<%=firstname%>
			!!!!
		</h1>
		<h1 class="heading ">Your Expense Chart Is Here!!</h1>
	</div>
	<div class="container2">

		<%
			try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
					"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");

			String query = "Select name,itemname,itemprice,dateofentry, _id  From expense where _id=(Select _id from credentials where firstname=?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, firstname);
			ResultSet rs = ps.executeQuery();
			float _id = 0;
			rs.next();
			rs.getString(1);

			out.print("<table class =table> <tr> ");
			out.print("<th class=head>" + "Name" + "</th>" + "<th class=head>"
			+ "Item Name" + "</th>" + "<th class=head>" + "Price($)" + "</th>"
			+ "<th class=head>" + "Date Of Entry" + "</th>");
			out.print("</tr>");
			rs.beforeFirst();
			while (rs.next()) {
				out.print("<tr >");
				out.print("<td class=data>" + rs.getString(1) + "</td>"
				+ "<td class=data>" + rs.getString(2) + "</td>"
				+ "<td class=data>" + rs.getFloat(3) + "</td>"
				+ "<td class=data>" + rs.getDate(4) + "</td>");
				out.print("</tr>");
				_id = rs.getFloat(5);
			}
			String query1 = "Select Sum(itemprice) from expense where name =?";
			PreparedStatement ps1 = con.prepareStatement(query1);
			ps1.setString(1, firstname);
			ResultSet rs1 = ps1.executeQuery();
			rs1.next();
			float totalexpenseofuser = rs1.getFloat(1);

			out.print("</table>");

			out.print("<span class=container3>");
			out.print(
			" <h1 class= heading  style=margin-right:1rem;> User Id-:  </h1>");
			out.print(" <h2 class= heading>  " + _id + "</h2>");
			out.print("</span>");

			out.print("<span class=container3>");
			out.print(
			"<h1 class=heading style=margin-right:1rem;> Total Expense-:  </h1>");
			out.print(" <h2 class= heading > " + totalexpenseofuser + "$</h2>");
			out.print("</span>");

			con.close();
		} catch (Exception e) {
			String empty = "Data Not Inserted Yet...";
			session.setAttribute("empty", empty);
			response.sendRedirect("welcome.jsp");
		}
		%>

	</div>
</body>
</html>