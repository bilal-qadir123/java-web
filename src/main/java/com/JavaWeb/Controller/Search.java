

package com.JavaWeb.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Search", value = "/search")
public class Search extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String search = request.getParameter("search");
        String name = search;


        String jdbcUrl = "jdbc:mysql://localhost:3306/javawebapplication";
        String username = "root";
        String password = "Rootroot12345";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);


            String query = "SELECT * FROM appointments WHERE name = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);


            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                response.sendRedirect(request.getContextPath() + "/jsp/history.jsp?name=" + name);
            } else {

                response.sendRedirect(request.getContextPath() + "/jsp/error.jsp?message=No+records+found+for+" + name);
            }


            connection.close();
        } catch (Exception ex) {

            response.sendRedirect(request.getContextPath() + "/jsp/error.jsp?message=" + ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/jsp/history.jsp").forward(request, response);
    }
 }
