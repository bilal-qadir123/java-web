

package com.JavaWeb.Controller;

import com.JavaWeb.Model.UserDb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Calorie", urlPatterns = "/calorie")
public class Calorie extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String itemCaloriesStr = request.getParameter("item-calories");
        String dateStr = request.getParameter("date");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("form.jsp");
            return;
        }
        int userId = (Integer) session.getAttribute("id");


        int id = Integer.parseInt(idStr);
        int itemCalories = Integer.parseInt(itemCaloriesStr);
        Date date = Date.valueOf(dateStr);


        try {
            UserDb userDb = new UserDb();
            userDb.Calorie(id, itemCalories, date);

            response.setContentType("text/html");

        } catch (SQLException e) {
            e.printStackTrace();

            response.sendRedirect("error.jsp");
        }
    }
 }
