

package com.JavaWeb.Controller;

import com.JavaWeb.Beans.RegisterBean;
import com.JavaWeb.Model.UserDb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Registration", value = "/register")
public class Registration extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

    /*out.println("<html><body>");
    out.println("<h2>Username: " + name + "</h2>");
    out.println("<h2>Email: " + email + "</h2>");
    out.println("<h2>Password: " + password + "</h2>");
    out.println("</body></html>");*/

        System.out.println("Username: " + name);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);


        RegisterBean rb;
        rb = new RegisterBean();
        rb.setName(name);
        rb.setEmail(email);
        rb.setPassword(password);

        UserDb ud = new UserDb();
        String result = ud.insertUser(rb);
        System.out.println(result);

        response.sendRedirect(request.getContextPath() + "jsp/profile.jsp");
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getRequestDispatcher("jsp/index.jsp");
    }
 }