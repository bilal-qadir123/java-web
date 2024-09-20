

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

@WebServlet(name = "Settings", value = "/settings")
public class Settings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("form.jsp");
            return;
        }
        String userEmail = (String) session.getAttribute("userEmail");

        String currentUsername = getCurrentUsername(userEmail);
        String currentEmail = getCurrentEmail(userEmail);

        UserDb userDb = new UserDb();
        boolean isUsernameTaken = userDb.usernameTaken(username) && !username.equals(currentUsername);
        boolean isEmailTaken = userDb.emailTaken(email) && !email.equals(currentEmail);

        PrintWriter out = response.getWriter();

        if ((!isUsernameTaken || username.equals(currentUsername)) && (!isEmailTaken || email.equals(currentEmail))) {
            try {
                boolean updated = userDb.updateGeneral(userEmail, username, email, address);
                if (updated) {
                    System.out.println("Record updated successfully!");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Updated successfully!');");
                    out.println("location='jsp/form.jsp';");
                    out.println("</script>");
                    return;
                } else {
                    System.out.println("");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Updated successfully!');");
                    out.println("location='jsp/form.jsp';");
                    out.println("</script>");
                    return;
                }
            } catch (SQLException e) {
                System.out.println("SQL Exception: " + e.getMessage());
                e.printStackTrace();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SQL Exception!');");
                out.println("location='jsp/error.jsp';");
                out.println("</script>");
            }
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or Email already taken!');");
            out.println("location='jsp/form.jsp';");
            out.println("</script>");
        }
    }

    private String getCurrentUsername(String userEmail) {
        String currentUsername = null;
        try {
            MyDb db = new MyDb();
            Connection con = db.getCon();
            String query = "SELECT name FROM register WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                currentUsername = rs.getString("name");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return currentUsername;
    }

    private String getCurrentEmail(String userEmail) {
        String currentEmail = null;
        try {
            MyDb db = new MyDb();
            Connection con = db.getCon();
            String query = "SELECT email FROM register WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userEmail);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                currentEmail = rs.getString("email");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return currentEmail;
    }
}
