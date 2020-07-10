package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.*;

@WebServlet("/insert")
public class Insert extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String itemname = request.getParameter("itemname").trim().toLowerCase();
		String itemprice = request.getParameter("itemprice");
		HttpSession session = request.getSession();
		String fname = (String) session.getAttribute("fname");
		System.out.println(fname);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
					"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");

			if ((fname.equalsIgnoreCase(name))) {
				PreparedStatement st1 = con
						.prepareStatement("Select curdate()");
				ResultSet rs1 = st1.executeQuery();
				rs1.next();
				Date date = rs1.getDate(1);

				if (Pattern.matches("[0-9]*", itemprice)) {
					PreparedStatement ps1 = con.prepareStatement(
							"Insert into expense value(?,?,?,?,(Select _id from credentials where firstname =?)) ");
					ps1.setString(1, name);
					ps1.setString(2, itemname);
					ps1.setString(3, itemprice);
					ps1.setDate(4, date);
					ps1.setString(5, name);

					int rowCount = ps1.executeUpdate();

					if (rowCount == 0) {
						String notinserted = "Data Not Inserted";
						session.setAttribute("notinserted", notinserted);
						response.sendRedirect("insert.jsp");
					} else {
						String result = " Data Inserted Successfully!!!";
						session.setAttribute("result", result);
						response.sendRedirect("insert.jsp");
					}
				} else {
					String result = "Enter Valid Numbers For Price!!!";
					session.setAttribute("result", result);
					response.sendRedirect("insert.jsp");
				}
			} else {
				String nameerror = "Incorrect Name:  Enter  Your  Name   Not Others";
				session.setAttribute("nameerror", nameerror);
				response.sendRedirect("insert.jsp");
			}
			con.close();
		} catch (Exception e) {
			String notinserted = "Database Not Responding";
			session.setAttribute("notinserted", notinserted);
			response.sendRedirect("insert.jsp");
		}
	}

}
