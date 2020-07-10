package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.regex.*;

@WebServlet("/signup")
public class SignUp extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstname = request.getParameter("firstname").trim()
				.toLowerCase();
		String lastname = request.getParameter("lastname").trim().toLowerCase();
		String email = request.getParameter("email").trim().toLowerCase();
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/expensemanager?autoReconnect=true&useSSL=false",
					"root", "Abhinav@2425");

			if ((Pattern.matches("[a-zA-Z]*", firstname)
					&& Pattern.matches("[a-zA-Z]*", lastname))) {

				if ((firstname.length() >= 3 && lastname.length() >= 3)
						&& password.length() >= 8) {
					PreparedStatement ps = con.prepareStatement(
							"insert into credentials value(?,?,?,?,?) ");
					ps.setString(1, firstname);
					ps.setString(2, lastname);
					ps.setString(3, email);
					ps.setString(4, password);
					ps.setFloat(5, (float) Math.random());

					int rowCount = ps.executeUpdate();

					if (rowCount != 0) {
						session.setAttribute("fname", firstname);
						response.sendRedirect("welcome.jsp");
					} else {

						String signuperror = "Sign Up Failed";
						session.setAttribute("signuperror", signuperror);
						response.sendRedirect("signup.jsp");
					}
				} else {

					if (firstname.length() <= 3 || lastname.length() <= 3) {
						String error = "Too Short Name....";
						session.setAttribute("error", error);
						response.sendRedirect("signup.jsp");
					} else {
						String error = "Weak Password....";
						session.setAttribute("error", error);
						response.sendRedirect("signup.jsp");
					}
				}
			} else {
				String error = "Invalid Characters For Name!!!";
				session.setAttribute("error", error);
				response.sendRedirect("signup.jsp");
			}
			con.close();
		} catch (Exception e) {
			String error = "Database not Responding";
			session.setAttribute("error", error);
			response.sendRedirect("signup.jsp");
		}
	}
}
