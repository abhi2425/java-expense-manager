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

@WebServlet("/login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email").toLowerCase();
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://lyl3nln24eqcxxot.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/znpjgnsgyxpqvf05?autoReconnect=true&useSSL=false",
					"hbk7uhuebpbiu824", "g4p548qlv5rc46z2");
			PreparedStatement ps = con.prepareStatement(
					"Select email,password,firstname  from credentials where email=? And password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String email_data = rs.getString(1);
			String password_data = rs.getString(2);
			String firstname_data = rs.getString(3);

			if ((email.equalsIgnoreCase(email_data)
					&& password.equals(password_data))
					&& firstname.equalsIgnoreCase(firstname_data)) {
				session.setAttribute("username", email);
				session.setAttribute("fname", firstname);
				response.sendRedirect("welcome.jsp");
			} else {
				String error = "Invalid Credentials!!!";
				session.setAttribute("error", error);
				response.sendRedirect("login.jsp");
			}
			con.close();
		} catch (Exception e) {
			String error = "Invalid Credentials!!!";
			session.setAttribute("error", error);
			response.sendRedirect("login.jsp");
		}

	}

}
