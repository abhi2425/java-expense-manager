package com.servlet;

import java.io.IOException;
import java.util.regex.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/name")
public class Name extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String oldFirstName = request.getParameter("oldfirstname");
		String newFirstName = request.getParameter("newfirstname").trim().toLowerCase();
		String newLastName = request.getParameter("newlastname").trim().toLowerCase();
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String fname = (String) session.getAttribute("fname");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
					"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");
			if (fname.equalsIgnoreCase(oldFirstName)) {

				PreparedStatement ps = con.prepareStatement(
						"Select password from credentials where firstname= ?");
				ps.setString(1, fname);
				ResultSet rs = ps.executeQuery();
				rs.next();
				String password_data = rs.getString(1);

				if (password.equals(password_data)) {
					String query1 = "update credentials set firstname=? , lastname=?  where password =? ";
					String query2 = "update expense set name = ? where name=?";
					PreparedStatement ps1 = con.prepareStatement(query1);
					PreparedStatement ps2 = con.prepareStatement(query2);
					ps1.setString(1, newFirstName);
					ps1.setString(2, newLastName);
					ps1.setString(3, password);
					ps2.setString(1, newFirstName);
					ps2.setString(2, oldFirstName);
					int rowCount1 = ps1.executeUpdate();
					int rowCount2 = ps2.executeUpdate();

					if (rowCount1 != 0 && rowCount2 != 0) {
						String result = "Name Updated Succesfully!!!";
						session.setAttribute("result", result);
						response.sendRedirect("name.jsp");
					} else {
						String result = " Data Not Updated!!! ";
						session.setAttribute("result", result);
						response.sendRedirect("name.jsp");
					}
				} else {
					String result = "Password Error!!! ";
					session.setAttribute("result", result);
					response.sendRedirect("name.jsp");
				}

			} else {
				String result = "Enter Your Name Not Others !!!  ";
				session.setAttribute("result", result);
				response.sendRedirect("name.jsp");
			}
			con.close();
		} catch (Exception e) {
			String result = "Database Not Responding!!!";
			session.setAttribute("result", result);
			response.sendRedirect("name.jsp");
		}

	}

}
