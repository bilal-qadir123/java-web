



package com.JavaWeb.Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/ValidateUserServlet")
public class ValidateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");


        String url = "jdbc:mysql://localhost:3306/javawebapplication";
        String dbUsername = "root";
        String dbPassword = "Rootroot12345";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);


            String query = "SELECT * FROM register WHERE patient_id=? AND password=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(patientId));
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                response.getWriter().write("success");
            } else {

                response.getWriter().write("failure");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("error");
        } finally {

            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
