

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Appointment Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="index.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/notification.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd',
                showButtonPanel: true,
                onChangeMonthYear: function(year, month, inst) {
                    $(this).datepicker("setDate", new Date(year, month - 1, $(this).datepicker("getDate").getDate()));
                }
            });
        });

    </script>
    <script src="js/notification.js" defer></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,500&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "poppins", sans-serif;
        }
        body {
            height: 100vh;
            width: 100%;
            background: #000;
        }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 25px 13%;
            background: transparent;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
            font-weight: 600;
            color: #162938;
        }
        .input-box:nth-child(3) label {
            position: absolute;
            top: -10px;
            left: 0;
            display: block;
            font-size: 16px;
            font-weight: 400;
            pointer-events: none;
            color: rgb(73, 71, 71);
        }

        .navbar a {
            position: relative;
            font-size: 16px;
            color: #162938;
            margin-right: 30px;
            text-decoration: none;
        }
        .navbar a::after {
            content: "";
            position: absolute;
            left: 0;
            width: 100%;
            height: 2px;
            background: #162938;
            bottom: -5px;
            border-radius: 5px;
            transform: translateY(10px);
            opacity: 0;
            transition: .5s ease;
        }
        .navbar a:hover::after {
            transform: translateY(0);
            opacity: 1;
        }
        .search-bar {
            width: 250px;
            height: 45px;
            background-color: transparent;
            border: 6px #162938;
            border-radius: 6px;
            display: flex;
            align-items: center;
            backdrop-filter: blur(5px);
            margin: 0 auto;
        }
        .search-bar input {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
            color: #162938;
            font-size: 16px;
            padding-left: 10px;
        }
        .search-bar button {
            width: 40px;
            height: 100%;
            background: transparent;
            outline: none;
            border: none;
            color: #162938;
            cursor: pointer;
            margin-top: 3px;
        }
        .search-bar input::placeholder {
            color: #162938;
        }
        .search-bar button i {
            font-size: 22px;
        }
        .container {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 75%;
            height: 85%;
            margin-top: 20px;
            background-position: center;
            background-size: cover;
            border-radius: 20px;
            overflow: hidden;
        }
        .item {
            position: absolute;
            top: 0;
            left: 0;
            width: 58%;
            height: 100%;
            color: #162938;
            background: transparent;
            padding: 80px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
        }
        .item .logo {
            color: #162938;
            font-size: 30px;
        }
        .text-item h2 {
            font-size: 40px;
            line-height: 1;
            color: #162938
        }
        .text-item p {
            font-size: 5px;
            margin: 10px 0;
            color: #162938;
        }
        .social-icon a i {
            color: #162938;
            font-size: 24px;
            margin-left: 10px;
            cursor: pointer;
            transition: .5s ease;
        }
        .social-icon a:hover i {
            transform: scale(1.2);
        }
        .container .item {
            position: absolute;
            top: 0;
            left: 0;
            width: 58%;
            height: 100%;
            color: #162938;
            background-color: rgba(247, 45, 122, 0.8);
            padding: 80px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            backdrop-filter: blur(20px);
        }

        .login-section {
            position: absolute;
            top: 0;
            right: 0;
            width: 42%;
            height: 100%;
            backdrop-filter: blur(20px);
        }


        .login-section .form-box {
            position: absolute;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }
        .login-section .form-box.login {
            transform: translateX(0px);
            transition: transform .6s ease;
            transition-delay: 0.7s;
        }
        .login-section.active .form-box.login {
            transform: translateX(430px);
            transition-delay: 0s;
        }
        .login-section .form-box h2 {
            text-align: center;
            font-size: 25px;
            color: rgba(247, 45, 122);
        }
        .form-box .input-box {
            width: 340px;
            height: 50px;
            border-bottom: 2px solid #fff;
            margin: 20px 0;
            position: relative;
        }
        .input-box input[type="date"] {
            width: 100%;
            padding: 1px;
            font-size: 16px;
            color: #8f8e8e;
        }

        .input-box input[name="id"] {
            width: 100%;
            padding: 1px;
            font-size: 16px;
            color: #6c6a6a;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "poppins", sans-serif;
        }
        body {
            height: 100vh;
            width: 100%;
            background: #000;
        }
        .background {
            background: url("Images/background3.jpg") no-repeat center;
            background-size: cover;
            height: 100vh;
            width: 100%;
            filter: blur(5px);
        }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 25px 13%;
            background: transparent;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
            font-weight: 600;
            color: #162938;
        }
        .navbar a {
            position: relative;
            font-size: 16px;
            color: #162938;
            margin-right: 30px;
            text-decoration: none;
        }
        .navbar a::after {
            content: "";
            position: absolute;
            left: 0;
            width: 100%;
            height: 2px;
            background: #162938;
            bottom: -5px;
            border-radius: 5px;
            transform: translateY(10px);
            opacity: 0;
            transition: .5s ease;
        }
        .navbar a:hover::after {
            transform: translateY(0);
            opacity: 1;
        }
        .search-bar {
            width: 250px;
            height: 45px;
            background-color: transparent;
            border: 6px #162938;
            border-radius: 6px;
            display: flex;
            align-items: center;
            backdrop-filter: blur(5px);
        }
        .search-bar input {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
            color: #162938;
            font-size: 16px;
            padding-left: 10px;
        }
        .search-bar button {
            width: 40px;
            height: 100%;
            background: transparent;
            outline: none;
            border: none;
            color: #162938;
            cursor: pointer;
        }
        .search-bar input::placeholder {
            color: #162938;
        }
        .search-bar button i {
            font-size: 22px;
        }
        .container {
            position: absolute;
            left: 50%;
            top: 52%;
            transform: translate(-50%, -50%);
            width: 75%;
            height: 87%;
            margin-top: 20px;
            background-position: center;
            background-size: cover;
            border-radius: 20px;
            overflow: hidden;
        }
        .item {
            position: absolute;
            top: 0;
            left: 0;
            width: 58%;
            height: 100%;
            color: #162938;
            background: transparent;
            padding: 80px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
        }
        .item .logo {
            color: #162938;
            font-size: 30px;
        }
        .text-item h2 {
            font-size: 40px;
            line-height: 1;
            color: #162938
        }
        .text-item p {
            font-size: 16px;
            margin: 20px 0;
            color: #162938;
        }
        .social-icon a i {
            color: #162938;
            font-size: 24px;
            margin-left: 10px;
            cursor: pointer;
            transition: .5s ease;
        }
        .social-icon a:hover i {
            transform: scale(1.2);
        }
        .container .item {
            position: absolute;
            top: 0;
            left: 0;
            width: 58%;
            height: 100%;
            color: #162938;
            background-color: rgba(247, 45, 122, 0.8);
            padding: 80px;
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            backdrop-filter: blur(20px);
        }

        .login-section {
            position: absolute;
            top: 0;
            right: 0;
            width: 42%;
            height: 99.9%;
            backdrop-filter: blur(20px);
        }


        .login-section .form-box {
            position: absolute;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }
        .login-section .form-box.login {
            transform: translateX(0px);
            transition: transform .6s ease;
            transition-delay: 0.7s;
        }
        .login-section.active .form-box.login {
            transform: translateX(430px);
            transition-delay: 0s;
        }
        .login-section .form-box h2 {
            text-align: center;
            font-size: 25px;
            color: rgba(247, 45, 122);
        }
        .form-box .input-box {
            width: 340px;
            height: 50px;
            border-bottom: 2px solid #fff;
            margin: 20px 0;
            position: relative;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .datepicker-container {
            background-color: rgba(255, 192, 203, 0.5);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .datepicker-header {
            background-color: rgb(255, 59, 95);
            border-radius: 10px 10px 0 0;
            padding: 10px;
            position: relative;
            z-index: 1;
            text-align: center;
        }

        .datepicker {
            width: 400px;
            margin: 0 auto;
            position: relative;
            z-index: 0;
        }

        .ui-datepicker {
            background-color: rgba(255, 192, 203, 0.5);
            border: none;
            border-radius: 0;
            box-shadow: none;
            margin-top: -10px;
            z-index: 0;
        }

        .ui-datepicker-header {
            position: relative;
        }

        .ui-datepicker-calendar {
            border: none;
        }

        .ui-datepicker-calendar tbody td {
            padding: 10px;
            text-align: center;
        }

        .ui-datepicker-calendar tbody td:hover {
            background-color: #ffa07a;
            color: #fff;
            cursor: pointer;
        }

        .ui-datepicker-calendar .ui-state-active {
            background-color: #ff69b4;
            color: #fff;
        }
        .input-box input,
        .input-box select,
        .input-box textarea {
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            padding-right: 28px;
            color: #1c0202;
        }
        .input-box label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-30%);
            font-size: 16px;
            font-weight: 400;
            pointer-events: none;
            transition: 0.3s ease;
            color: rgb(70, 67, 67);
        }

        .input-box .icon {
            position: absolute;
            top: 13px;
            right: 0;
            font-size: 19px;
        }
        .input-box input:focus ~ label,
        .input-box input:valid ~ label,
        .input-box select:focus ~ label,
        .input-box select:valid ~ label,
        .input-box textarea:focus ~ label,
        .input-box textarea:valid ~ label {
            top: -5px;
        }
        .btn {
            background: #fff;
            width: 100%;
            height: 45px;
            outline: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background: #f72d7a;
            font-size: 16px;
            color: #fff;
            box-shadow: rgba(0, 0, 0, 0.4);
            margin-top: 10px;
        }

        #patient-name {
            border-bottom-color: #f72d7a;
        }

        #patient-name + label {
            color: #162938;
        }

        #patient-name:focus {
            border-bottom-color: #f72d7a;
        }

        #patient-name + label + .icon {
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
            font-size: 22px;
            color: #162938;
        }

        .logo ion-icon {
            transform: rotate(20deg) translateY(3px) translateX(2px);
            color: rgb(33, 143, 0);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .logo {
            font-size: 2em;
            color: rgb(61, 221, 12);
            user-select: none;
        }

        .input-box .icon {
            position: absolute;
            top: 13px;
            right: 0;
            font-size: 19px;
        }
        .input-box input:focus ~ label,
        .input-box input:valid ~ label,
        .input-box select:focus ~ label,
        .input-box select:valid ~ label,
        .input-box textarea:focus ~ label,
        .input-box textarea:valid ~ label {
            top: -5px;
        }
        .btn {
            background: #f72d7a;
            color: #fff;
            font-size: 16px;
            width: 70%;
            height: 40px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            display: block;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
        }

        .btn:hover {
            background: #e62066;
        }
    </style>
</head>
<body>
<header class="header">
    <form id="search-form" class="search-bar" action="/search" method="POST">
        <input type="text" name="search" placeholder="Search your history...">
        <button type="submit"><i class='bx bx-search'></i></button>
    </form>
</header>
<div class="background"></div>
<div class="container">
    <div class="item">
        <h2 class="logo">
            <ion-icon name="leaf"></ion-icon>
            Inaam HealthCare
        </h2>
        <div class="text-item">
            <h2>Welcome to <br><span>Inaam Healthcare Service</span></h2>
            <p>Please enter the complete details of the patient.</p>
            <p>Find us on: </p>
            <div class="social-icon">
                <a href="#"><i class='bx bxl-facebook'></i></a>
                <a href="#"><i class='bx bxl-twitter'></i></a>
                <a href="#"><i class='bx bxl-youtube'></i></a>
                <a href="#"><i class='bx bxl-instagram'></i></a>
                <a href="#"><i class='bx bxl-linkedin'></i></a>
            </div>
        </div>
    </div>
    <div class="login-section">
        <div class="form-box appointment">
            <form id="appointment" action="/display" method="POST">
                <h2>Appointment Booking</h2>
                <%
                    HttpSession session1 = request.getSession(false);
                    String userEmail = (String) session1.getAttribute("userEmail");
                    if (userEmail == null) {
                        response.sendRedirect("profile.jsp");
                        return;
                    }
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    int id = 0;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url1 = "jdbc:mysql://localhost:3306/javawebapplication";
                        String dbUsername1 = "root";
                        String dbPassword1 = "Rootroot12345";
                        conn = DriverManager.getConnection(url1, dbUsername1, dbPassword1);

                        String query = "SELECT patient_id FROM register WHERE email = ?";
                        stmt = conn.prepareStatement(query);
                        stmt.setString(1, userEmail);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            id = rs.getInt("patient_id");

                            System.out.println("ID: " + id);

                            session1.setAttribute("id", id);
                        }
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();

                        response.sendRedirect("error.jsp");
                        return;
                    } catch (SQLException e) {
                        e.printStackTrace();

                        response.sendRedirect("error.jsp");
                        return;
                    } finally {

                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>

                <div class="input-box">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <input type="text" name="name" required>
                    <label>Patient Name</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <input type="text" name="id" value="<%= id %>" required disabled>
                    <label>Patient Id</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-phone'></i></span>
                    <input type="text" name="contact" required>
                    <label>Contact</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <select name="gender" required>
                        <option value="" disabled selected></option>
                        <option value="Male">Male</option>
                        <option value="female">Female</option>
                    </select>
                    <label>Gender</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-time-five'></i></span>
                    <input type="number" name="age" required>
                    <label>Age</label>
                </div>
                <div class="input-box">

                    <input type="date" name="date" id="datepicker" placeholder="Select Date">
                    <label>Appointment Date</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-pencil'></i></span>
                    <textarea rows="5" name="reason" required></textarea>
                    <label>What happened to you? Write details</label>
                </div>
                <button class="btn" onclick="window.location.href = 'billing.jsp';">Proceed</button>
            </form>
        </div>
    </div>
</div>

<div class="notifications-container">
    <ul class="notifications">
    </ul>
</div>

</body>
</html>




