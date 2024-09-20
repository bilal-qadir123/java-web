

package com.JavaWeb.Controller;

import com.JavaWeb.Model.UserDb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Password", value = "/password")
public class Password extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession(false);
        if (session == null) {

            response.sendRedirect("jsp/form.jsp");
            return;
        }
        String userEmail = (String) session.getAttribute("userEmail");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        if (currentPassword != null && newPassword != null && !currentPassword.isEmpty() && !newPassword.isEmpty() && userEmail != null && !userEmail.isEmpty()) {
            UserDb userDb = new UserDb();
            if (userDb.validatePassword(newPassword, confirmPassword)) {
                try {
                    boolean updated = userDb.updatePassword(userEmail, currentPassword, newPassword);
                    if (updated) {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Password updated successfully!');");
                        out.println("location='jsp/form.jsp';");
                        out.println("</script>");
                    } else {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Current password does not match');");
                        out.println("location='jsp/profile.jsp';");
                        out.println("</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('SQL Exception: " + e.getMessage() + "');");
                    out.println("location='jsp/profile.jsp';");
                    out.println("</script>");
                }
            } else {

                out.println("<script type=\"text/javascript\">");

                out.println("history.back();");
                out.println("</script>");
            }
        } else {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid or missing form data.');");
            out.println("history.back();");
            out.println("</script>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/profile.jsp");
        dispatcher.forward(request, response);
    }
 }
