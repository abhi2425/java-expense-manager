package com.servlet;

import java.io.IOException;
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
import java.util.regex.*;

@WebServlet("/updatedata")
public class UpdateData extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String olditemname = request.getParameter("olditemname");
		String newitemname = request.getParameter("newitemname").trim()
				.toLowerCase();
		String newprice = request.getParameter("newprice");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String fname = (String) session.getAttribute("fname");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/expensemanager?autoReconnect=true&useSSL=false",
					"root", "Abhinav@2425");

			if (fname.equalsIgnoreCase(firstname)) {
				PreparedStatement ps = con.prepareStatement(
						"Select password  from credentials where firstname = ?");
				ps.setString(1, firstname);
				ResultSet rs = ps.executeQuery();
				rs.next();
				String password_data = rs.getString(1);
				String query2 = "Select itemname from expense where itemname=? and name=? ";
				PreparedStatement ps2 = con.prepareStatement(query2);
				ps2.setString(1, olditemname);
				ps2.setString(2, firstname);
				ResultSet rs2 = ps2.executeQuery();
				rs2.next();
				rs2.getString(1);

				if (Pattern.matches("[0-9]*", newprice)
						&& Pattern.matches("[a-zA-Z]*", newitemname)) {

					if (password.equals(password_data)) {
						String query1 = "Update expense set itemname = ? , itemprice = ? where itemname =? and name =?";
						PreparedStatement ps1 = con.prepareStatement(query1);
						ps1.setString(1, newitemname);
						ps1.setString(2, newprice);
						ps1.setString(3, olditemname);
						ps1.setString(4, firstname);

						int rowCount1 = ps1.executeUpdate();
						if (rowCount1 != 0) {

							String result = "Updated Successfully!!!";
							session.setAttribute("result", result);
							response.sendRedirect("updatedata.jsp");
						} else {
							String result = "Data Not Updated!!!";
							session.setAttribute("result", result);
							response.sendRedirect("updatedata.jsp");
						}
					} else {
						String result = "Incorrect Credentials!!!";
						session.setAttribute("result", result);
						response.sendRedirect("updatedata.jsp");
					}

				} else {
					String result = "Enter Valid Name and Price  For New Item!!!";
					session.setAttribute("result", result);
					response.sendRedirect("updatedata.jsp");
				}
			} else {
				String result = "Incorrect Name - Enter Your Name Only!!!";
				session.setAttribute("result", result);
				response.sendRedirect("updatedata.jsp");
			}

			con.close();

		} catch (Exception e) {
			String result = "No Such Item Available!!!";
			session.setAttribute("result", result);
			response.sendRedirect("updatedata.jsp");
		}
	}

}
