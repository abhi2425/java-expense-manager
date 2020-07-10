package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/password")
public class Password extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldpassword");
		String newPassword = request.getParameter("newpassword");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String fname = (String) session.getAttribute("fname");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
					"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");
			if (fname.equalsIgnoreCase(firstname)) {
				PreparedStatement ps = con.prepareStatement(
						"Select email , password from credentials where firstname=? ");
				ps.setString(1, fname);
				ResultSet rs = ps.executeQuery();
				rs.next();
				String email_data = rs.getString(1);
				String password_data = rs.getString(2);
				if (email.equalsIgnoreCase(email_data)
						&& oldPassword.equals(password_data)) {
					PreparedStatement ps1 = con.prepareStatement(
							"update credentials set password =? where email=? and password =?");
					ps1.setString(1, newPassword);
					ps1.setString(2, email);
					ps1.setString(3, oldPassword);
					int rowCount1 = ps1.executeUpdate();
					if (rowCount1 != 0) {
						String result = "Password Updated Successfully!!!";
						session.setAttribute("result", result);
						response.sendRedirect("password.jsp");
					} else {
						String result = "Data Not Updated!!!";
						session.setAttribute("result", result);
						response.sendRedirect("password.jsp");
					}

				} else {
					String result = "Incorrect Credentials !!!";
					session.setAttribute("result", result);
					response.sendRedirect("password.jsp");
				}

			} else {
				String result = "Incorrect Name !!!";
				session.setAttribute("result", result);
				response.sendRedirect("password.jsp");
			}
			con.close();
		} catch (Exception e) {
			String result = "DataBase Not Responding!!!";
			session.setAttribute("result", result);
			response.sendRedirect("password.jsp");
		}

	}

}
