

package com.JavaWeb.Controller;

import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Index", urlPatterns = "/login")
public class Index extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        out.println("<html><body>");
        out.println("<h2>Email: " + email + "</h2>");
        out.println("<h2>Password: " + password + "</h2>");
        out.println("</body></html>");

        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
 }
