

package com.JavaWeb.Controller;

import com.JavaWeb.Beans.AppointmentBean;
import com.JavaWeb.Model.UserDb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Appointment", value = "/display")
public class Appointment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            out.println("<script>alert('Session expired or ID not found. Please log in again.');window.location.href='jsp/display.jsp';</script>");
            return;
        }


        Integer idObject = (Integer) session.getAttribute("id");
        if (idObject == null) {
            out.println("<script>alert('Session attribute 'id' is null. Please log in again.');window.location.href='jsp/display.jsp';</script>");
            return;
        }
        int id = idObject.intValue();

        String name = request.getParameter("name");
        long contact = Long.parseLong(request.getParameter("contact"));
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String date = request.getParameter("date");
        String reason = request.getParameter("reason");
        String doctor = request.getParameter("doctor");

        UserDb ud = new UserDb();


        if (ud.isIdPresent(id)) {
            AppointmentBean app = new AppointmentBean();
            app.setId(id);
            app.setName(name);
            app.setContact(contact);
            app.setGender(gender);
            app.setDate(date);
            app.setAge(age);
            app.setDoctor(doctor);
            app.setReason(reason);

            String result = ud.insertInfo(app);
            out.println("<script>alert('Appointment added successfully.');window.location.href='display.jsp';</script>");
        } else {
            out.println("<script>alert('Patient details for ID " + id + " not found in the database. Data not inserted');window.location.href='jsp/display.jsp';</script>");
        }
        response.sendRedirect(request.getContextPath() + "jsp/billing.jsp");
    }
}
