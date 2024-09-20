

package com.JavaWeb.Controller;

import com.JavaWeb.Model.MyDb;
import com.JavaWeb.Model.UserDb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Info", value = "/info")
public class Info extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String birthday = request.getParameter("birthday");
        String country = request.getParameter("country");
        String phoneStr = request.getParameter("phone");

        PrintWriter out = response.getWriter();

        long phone = 0;
        try {
            phone = Long.parseLong(phoneStr.replaceAll("[^\\d]", ""));
        } catch (NumberFormatException e) {

            response.sendRedirect("jsp/form.jsp?error=invalidPhone");
            return;
        }

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("jsp/form.jsp");
            return;
        }
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            response.sendRedirect("form.jsp");
            return;
        }

        UserDb userDb = new UserDb();
        boolean updateSuccess = userDb.updateInfo(userEmail, birthday, country, phone);
        if (updateSuccess) {
            System.out.println("Record updated successfully!");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Updated successfully!');");
            out.println("location='jsp/form.jsp';");
            out.println("</script>");
        } else {
            response.sendRedirect("jsp/form.jsp?error=updateFailed");
        }
    }
 }
