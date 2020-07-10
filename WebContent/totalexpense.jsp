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
	background-image: radial-gradient(circle, blue, red);
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	box-sizing: border-box;
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
	color: #9400D3;
	letter-spacing: 3px;
}

.table {
	margin: 2rem;
	padding: 1rem;
	background-image: linear-gradient(to right top, #1C86EE, #DC143C);
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
</style>
<meta charset="ISO-8859-1">
<title>Expense Manager| Total Expenses</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", " no-cache , no-store, must-revalidate");
	if (session.getAttribute("username") == null
			&& session.getAttribute("fname") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container1">
		<h1 class="heading">Total Expenses Of All Users!!!</h1>
	</div>


	<div class="container2">
		<%
			Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
				"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");
		try {
			String query = "Select Name , Sum(itemprice),  _id  From expense Group by Name Order by Name";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			out.print("<table class =table> <tr> ");
			out.print("<th class=head>" + "Name" + "</th>" + "<th class=head >"
			+ "Total Expense($)" + "</th>" + "<th class=head>" + "User Id"
			+ "</th>");
			out.print("</tr>");
			while (rs.next()) {
				out.print("<tr class= row>");
				out.print("<td class=data>" + rs.getString(1).toLowerCase() + "</td>"
				+ "<td class=data>" + rs.getFloat(2) + "</td>"
				+ "<td class=data>" + rs.getFloat(3) + "</td>");
				out.print("</tr>");
			}
			out.print("</table>");

			String query1 = "select count( distinct name), sum(ItemPrice), max(ItemPrice) , min(ItemPrice)  from  expense";
			PreparedStatement ps1 = con.prepareStatement(query1);
			ResultSet rs1 = ps1.executeQuery();
			rs1.next();
			int totaldistinctuser = rs1.getInt(1);
			float totalexpenseofalluser = rs1.getFloat(2);
			float maxexpense = rs1.getFloat(3);
			float minexpense = rs1.getFloat(4);

			float averageexpense = totalexpenseofalluser / totaldistinctuser;
		} catch (Exception e) {

			out.print("<h1 class= heading>No Data Is Inserted Is Yet...</h1> ");
		}
		%>

	</div>


</body>
</html>