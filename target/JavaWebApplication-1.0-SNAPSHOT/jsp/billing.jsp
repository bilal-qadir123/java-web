

<%@ page import="java.sql.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Appointment Booking Confirmation</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-image: url("billing.gif");
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .gradient-text {
      background: linear-gradient(to right, violet, indigo, blue, green, yellow, orange, red);
      -webkit-background-clip: text;
      color: transparent;
      font-weight: bold;
      display: inline-block;
      font-size: 3em;
      transform: skew(-10deg);
      margin-top: 0.1em;
      margin-left: -20px;
      padding: 0.2em 0.5em;
    }
    .heading2 {
      font-size: 7em;
      font-weight: bold;
      margin: 0.2em 0;
      padding: 0;
      font-family: url('Fonts/WEB/fonts/Telma-Light.ttf');
      text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.4);
    }
    h3 {
      margin: 0.1em 0 0.3em 0;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);
    }
    h1 {
      margin: 0.1em 0 0.5em 0;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
    }
  </style>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap">
</head>
<body>
<%
  String url = "jdbc:mysql://localhost:3306/javawebapplication";
  String user = "root";
  String password = "Rootroot12345";
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    HttpSession session3 = request.getSession();
    Integer id = (Integer) session3.getAttribute("id");

    if (id != null) {
      String query = "SELECT doctor FROM appointments WHERE id = ?";
      pstmt = conn.prepareStatement(query);
      pstmt.setInt(1, id);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        String doctor = rs.getString("doctor");
%>
<h3>Appointment Booking was successful! You have an appointment with </h3>
<h1 class="heading2"> <%= doctor %></h1>
<h2>Your total Bill is <span class="gradient-text">$12.99</span></h2>
<%
} else {
%>
<h3>Appointment Booking was successful! But no doctor found for the given ID.</h3>
<h1 class="heading2">Dr. Not Found</h1>
<h2>Your total Bill is <span class="gradient-text">$12.99</span></h2>
<%
  }
} else {
%>
<h3>Appointment Booking was successful! But no ID found in session.</h3>
<h1 class="heading2">Dr. Not Found</h1>
<h2>Your total Bill is <span class="gradient-text">$12.99</span></h2>
<%
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>
</body>
</html>
