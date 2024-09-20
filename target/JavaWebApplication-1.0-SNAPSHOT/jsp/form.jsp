

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Sign up</title>
    <link rel="stylesheet" href="css/myStyle.css">
    <script>
        function showPopupLogin(message1) {
            var popup = document.createElement('div');
            popup.id = 'login-popup';
            popup.innerText = message1;
            document.body.appendChild(popup);

            setTimeout(function() {
                popup.style.opacity = '0';
                popup.style.transition = 'opacity 2s ease-in-out';
            }, 3000);


            setTimeout(function() {
                document.body.removeChild(popup);
            }, 5000);
        }
        function showPopupRegister(message) {
            var popup = document.createElement('div');
            popup.id = 'register-popup';
            popup.innerText = message;
            document.body.appendChild(popup);


            setTimeout(function() {
                popup.style.opacity = '0';
                popup.style.transition = 'opacity 2s ease-in-out';
            }, 3000);


            setTimeout(function() {
                document.body.removeChild(popup);
            }, 5000);
        }
        function checkPasswordStrength() {
            var password = document.getElementById("password").value;
            var meter = document.getElementById("password-strength-text");
            var message = document.getElementById("password-strength-message");
            var strength = 0;

            if (password.length >= 8) {
                strength += 2;
            }

            if (password.match(/[a-z]+/)) {
                strength += 1;
            }

            if (password.match(/[A-Z]+/)) {
                strength += 1;
            }

            if (password.match(/[0-9]+/)) {
                strength += 1;
            }

            if (password.match(/[@$!%*?&]+/)) {
                strength += 3;
            }

            if (password.length === 0) {
                meter.style.width = "0%";
                message.textContent = "";
            } else if (strength === 1) {
                meter.style.width = "20%";
                meter.style.backgroundColor = "#ff0015";
                message.textContent = "Your password is too weak, making it vulnerable";
            }
            else if (strength === 2) {
                meter.style.width = "40%";
                meter.style.backgroundColor = "#ff8800";
                message.textContent = "Your password is weak, making it vulnerable.";
            }
            else if (strength === 3) {
                meter.style.width = "60%";
                meter.style.backgroundColor = "#fffb00";
                message.textContent = "Your password is medium, posing moderate risk";
            } else if (strength === 4) {
                meter.style.width = "80%";
                meter.style.backgroundColor = "#c8ff00b9";
                message.textContent = "Your password is strong, providing formidable security.";
            } else if (strength === 5) {
                meter.style.width = "100%";
                meter.style.backgroundColor = "#66ff00";
                message.textContent = "Your password is very strong, ensuring high security.";
            }
        }

    </script>
    <style>
        #login-popup, #register-popup {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 2s ease-in-out;
        }
        #password-strength-meter {
            width: 100%;
            height: 10px;
            bottom: 5px;
            background-color: #f0f0f0;
            margin-bottom: 25px;
            border-radius: 5px;
            background-color: transparent;
        }

        #password-strength-text {
            height: 100%;
            width: 0%;
            bottom: 20px;
            background-color: rgb(204, 2, 2);
            transition: width 0.3s ease, background-color 0.3s ease;
            border-radius: 5px;
        }

        #password-strength-message {
            color: #ff0000;
            font-weight: 600;
        }

        .text {
            font-size: 15px;
            font-weight: 400;
            margin-top: -20px;
        }

        #login-popup {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 5s ease-in-out;
        }
        #login-error-popup.hidden {
            opacity: 0;
        }
        #register-popup {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 5s ease-in-out;
        }
        #register-error-popup.hidden {
            opacity: 0;
        }

    </style>
</head>
<body>

<header>
    <h2 class="logo">
        <ion-icon name="leaf"></ion-icon>
        Inaam Health Care
    </h2>
    <nav class="navigation">
        <a href="http://localhost:8096/">Home</a>
        <a href="#" id="about-link">About</a>
        <a href="#" id="services-link">Services</a>
        <a href="#" id="contact-link">Contact</a>
    </nav>
</header>
<div class="background-image"></div>
<div id="about-modal" class="modal" aria-hidden="true" aria-labelledby="about-title" role="dialog">
    <div class="modal-content">
        <button class="close" aria-label="Close">&times;</button>
        <h2 id="about-title">About Us</h2>
        <p>Welcome to Inaam Health Care! We're committed to providing top-quality healthcare services with a patient-centered approach. With decades of experience, our hospital is a trusted pillar in the community, offering advanced medical care in a compassionate environment. Our dedicated team of professionals focuses on your well-being, ensuring you receive the best possible treatment and support throughout your healthcare journey. From cutting-edge technology to personalized care, we're here to meet your healthcare needs and exceed your expectations. </p>
    </div>
</div>

<div id="services-modal" class="modal" aria-hidden="true" aria-labelledby="services-title" role="dialog">
    <div class="modal-content">
        <button class="close" aria-label="Close">&times;</button>
        <h2 id="services-title">Our Services</h2>
        <p>We prioritize patient well-being above all else. With a dedicated team of medical professionals and state-of-the-art facilities, we strive to provide comprehensive healthcare services tailored to meet the diverse needs of our community.</p>
        <ul>
            <li>Comprehensive Medical Consultations</li>
            <li>Specialized Treatments</li>
            <li>Diagnostic Imaging Services</li>
            <li>Surgical Expertise</li>
            <li>Emergency Care</li>
            <li>Rehabilitation Programs</li>
            <li>Wellness Initiatives</li>
            <li>Telemedicine Services</li>
        </ul>
    </div>
</div>

<div id="contact-modal" class="modal" aria-hidden="true" aria-labelledby="contact-title" role="dialog">
    <div class="modal-content">
        <button class="close" aria-label="Close">&times;</button>
        <h2 id="contact-title">Contact Us</h2>
        <p>Phone: +92 100102942</p>
    </div>
</div>
<div class="wrapper">
    <div class="form-box login">
        <h2>Login</h2>
        <form method="POST">
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <input type="email" name="email" required>
                <label>Email</label>
            </div>
            <div class="input-box">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>
            <button type="submit" class="btn">Login</button>
            <div class="login-register">
                <p>Don't have an account? <a href="#" class="register-link">Sign up</a></p>
            </div>
        </form>
    </div>

    <div class="form-box register">
        <h2>Register</h2>
        <form method="POST">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" name="name" required>
                <label>Username</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <input type="email" name="email" required>
                <label>Email</label>
            </div>
            <div class="input-box">

                <input type="password" name="password" id="password" required onkeyup="checkPasswordStrength()">
                <label>Password</label>
            </div>
            <div id="password-strength-meter">
                <div id="password-strength-text"></div>
            </div>
            <div id="password-strength-message" class="text">Include '@, $, &', to improve pasword's strength</div>
            <button type="submit" class="btn">Register</button>
            <div class="login-register">
                <p>Already have an account? <a href="#" class="login-link">Login</a></p>
            </div>
        </form>
    </div>
    <div class="background-image"></div>
</div>

<script src="js/javaScript.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<script>
    function redirectToDisplay() {
        window.location.href = "http://localhost:8098/jsp/display.jsp";
    }
</script>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    boolean registrationError = false;

    if (name != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url1 = "jdbc:mysql://localhost:3306/javawebapplication";
            String dbUsername1 = "root";
            String dbPassword1 = "Rootroot12345";
            Connection conn1 = DriverManager.getConnection(url1, dbUsername1, dbPassword1);

            PreparedStatement stmt2 = conn1.prepareStatement("SELECT * FROM register WHERE name=?");
            stmt2.setString(1, name);
            ResultSet rs1 = stmt2.executeQuery();

            if (rs1.next()) {
                out.println("<script>showPopupRegister('Username is already taken. Please choose a different username.');</script>");
                registrationError = true;
            } else {
                PreparedStatement stmt3 = conn1.prepareStatement("SELECT * FROM register WHERE email=?");
                stmt3.setString(1, email);
                ResultSet rs2 = stmt3.executeQuery();

                if (rs2.next()) {
                    out.println("<script>showPopupRegister('This email is already registered. Please enter your password to log in.');</script>");
                    registrationError = true;
                } else {
%>
<form id="redirectForm" method="POST" action="/register">
    <input type="hidden" name="name" value="<%= name %>">
    <input type="hidden" name="email" value="<%= email %>">
    <input type="hidden" name="password" value="<%= password %>">
</form>
<script>
    document.getElementById('redirectForm').submit();
</script>
<%
                    session.setAttribute("userEmail", email);

                }
                rs2.close();
                stmt3.close();
            }
            rs1.close();
            stmt2.close();
            conn1.close();
        } catch (Exception e) {
            out.println("Exception: " + e);
        }
    }

    if (email != null && password != null && !registrationError) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/javawebapplication";
            String dbUsername = "root";
            String dbPassword = "Rootroot12345";
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("userEmail", email);
                response.sendRedirect("profile.jsp");
            }
            else {
                out.println("<script>showPopupLogin('Incorrect email or password. Please try again.');</script>");
            }
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception e) {
            out.println("Exception: " + e);
        }
    }
%>

</body>
</html>