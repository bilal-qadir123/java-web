

.



<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="css/profileCss.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap");

        body {
            margin: 0;
            padding: 0;
            background-image: url("Images/background1.gif");
            background-size: 110% auto;
            background-position: center top;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .blur-effect {
            backdrop-filter: blur(3px);
            -webkit-backdrop-filter: blur(3px); 
            transition: backdrop-filter 1s ease-in-out;
        }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
            cursor: pointer;

        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5em;
            font-family: 'Poppins', sans-serif;
            margin-left: 20px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .profile-info:hover {
            transform: scale(1.05);
        }

        .profile-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .profile-info:hover .profile-icon {
            background-color: rgba(58, 62, 66, 0.37);
            transform: scale(1.1);
        }

        .profile-icon svg {
            width: 100%;
            height: auto;
        }

        .profile-info.selected .profile-icon {
            background-color: #070809;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-top: 3px;
        }
        .container {
            text-align: center;
            position: absolute;
            width: 100%;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: 80%;
            text-align: left;
        }

        .header-buttons .btn:focus {
            outline: none;
        }

        .welcome span {
            display: block;
            text-transform: uppercase;
        }
        .welcome {
            text-align: center;
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
        }

        .text1 {
            color: #fff;
            font-size: 60px;
            font-weight: 900;
            top: 20px;
            letter-spacing: 8px;
            margin-bottom: 20px;
            position: relative;
            animation: text1 2.8s forwards;
        }

        .text2 {
            font-size: 30px;
            color: #ff0000;
            font-weight: 700;
            opacity: 0;
            animation: text2 1s forwards 2.4s;
        }

        .fade-out {
            transition: opacity 0.5s;
            opacity: 0;
        }


        @keyframes text1 {
            0% {
                color: #000;
                margin-bottom: -40px;
            }
            30% {
                letter-spacing: 25px;
                margin-bottom: -40px;
            }
            85% {
                letter-spacing: 8px;
                margin-bottom: -40px;
            }
            100% {
                color: #fff;
                transform: translateY(0);
            }
        }

        @keyframes text2 {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .user-email {
            font-weight: bold;
        }

        .header-buttons .btn {
            position: relative;
            display: inline-block;
            padding: 10px 15px;
            font-size: 1.05rem;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
            color: #1b1d1f;
            background-color: transparent;
            border: none;
            cursor: pointer;
            transition: color 0.3s ease;
            margin-right: 0 15px;
        }

        .header-buttons .btn::before,
        .header-buttons .btn::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 70%;
            height: 3px;
            background: #000000;
            border-radius: 5px;
            transform-origin: right;
            transform: scaleX(0);
            transition: transform 0.5s;
        }

        .header-buttons a.btn.btn-primary {
            border: none;
            background-color: transparent !important;
            color: #000;
            box-shadow: none !important;
            transition: none !important;
        }

        .header-buttons a.btn.btn-primary:focus,
        .header-buttons a.btn.btn-primary:active,
        .header-buttons a.btn.btn-primary:hover {
            background-color: transparent !important;
            border-color: transparent !important;
            color: #00ff06 !important;
            box-shadow: none !important;
        }



        #logOutBtn {
            transition: color 0.3s ease;
            color: #000000;
            background-color: transparent;
            border: none !important;
            outline: none;
        }

        #logOutBtn:hover {
            color: #ff0019 !important;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: transparent;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 300px;
            margin: auto;
        }

        .modal-content h2 {
            font-family: 'Poppins', sans-serif;
            margin-top: 0;
        }

        .modal-btn {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        #logOutBtn:hover {
            color: rgb(223, 0, 0);
        }

        .header-buttons .btn::after {
            left: auto;
            right: 0;
            transform-origin: left;
        }

        .header-buttons .btn:hover::before,
        .header-buttons .btn:hover::after {
            transform: scaleX(0.9);
        }

        .header-buttons .btn:hover {
            color: #36e600;
        }

        .header-buttons .btn:last-child {
            margin-right: 0;
        }

        #dynamicContent {
            margin-top: -10px;
            font-family: "Arial", sans-serif;
        }



        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translate(0, -20px);
            }
            50% {
                opacity: 1;
                transform: translate(0, 0);
            }
            100% {
                opacity: 1;
                transform: translate(0, 0);
            }
        }

        .content {
            position: fixed;
            top: 70px;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            width: 85%;
            height: calc(100vh - 70px);
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 5px 16px rgba(0,0,0,0.2);
            border-radius: 10px;
            overflow-x: hidden;
            z-index: 999;
        }

        .content.active {
            display: block;
        }

        #register-popup {
            position: fixed;
            top: 20px;
            left: 50%;
            font-family: 'Poppins', sans-serif;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 2s ease-in-out;
        }
        .custom-alert {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(255, 0, 0, 0.7);
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
            font-family: "Poppins", sans-serif;
        }

        .custom-alert.show {
            opacity: 1;
        }

        :root {
            --dark: #34495E;
            --light: #ffffff;
            --success: #0ABF30;
            --error: #E24D4C;
            --warning: #E9BD0C;
            --info: #3498DB;
        }

        .notifications-container {
            position: relative;
            z-index: 9999;
            overflow: visible;
        }
        .notifications {
            position: fixed;
            top: 170px;
            right: 20px;
            cursor: pointer;
            z-index: 99999;
        }


        .notifications :where(.toast, .column) {
            display: flex;
            align-items: center;
        }
        .notifications .toast {
            width: 400px;
            position: relative;
            overflow: hidden;
            list-style: none;
            border-radius: 4px;
            padding: 16px 17px;
            margin-bottom: 10px;
            background: var(--light);
            justify-content: space-between;
            animation: show_toast 0.3s ease forwards;
        }

        #id {
            width: 90px;
            height: 30px;
            padding: 5px;
            font-size: 1em;
            border: 2px solid #005aff;
            border-radius: 4px;

        }
         @keyframes show_toast {
            0% {
                transform: translateX(100%);
            }
            40% {
                transform: translateX(-5%);
            }
            80% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(-10px);
            }
        }
        .notifications .toast.hide {
            animation: hide_toast 0.3s ease forwards;
        }
        @keyframes hide_toast {
            0% {
                transform: translateX(-10px);
            }
            40% {
                transform: translateX(0%);
            }
            80% {
                transform: translateX(-5%);
            }
            100% {
                transform: translateX(calc(100% + 20px));
            }


        }
        .toast::before {
            position: absolute;
            content: "";
            height: 3px;
            width: 100%;
            bottom: 0px;
            left: 0px;
            animation: progress 5s linear forwards;
        }
        @keyframes progress {
            100% {
                width: 0%;
            }
        }

        .toast.info::before, .btn#info {
            background: var(--info);
        }
        .toast .column i {
            font-size: 1.75rem;
        }
        .toast.success .column i {
            color: var(--success);
        }
        .toast.error .column i {
            color: var(--error);
        }
        .toast.warning .column i {
            color: var(--warning);
        }
        .toast.info .column i {
            color: var(--info);
        }
        .toast .column span {
            font-size: 1.07rem;
            margin-left: 12px;
        }
        .toast i:last-child {
            color: #aeb0d7;
            cursor: pointer;
        }
        .toast i:last-child:hover {
            color: var(--dark);
        }
        .buttons .btn {
            border: none;
            outline: none;
            cursor: pointer;
            margin: 0 5px;
            color: var(--light);
            font-size: 1.2rem;
            padding: 10px 20px;
            border-radius: 4px;
        }

        @media screen and (max-width: 530px) {
            .notifications {
                width: 95%;
            }
            .notifications .toast {
                width: 100%;
                font-size: 1rem;
                margin-left: 20px;
            }
            .buttons .btn {
                margin: 0 1px;
                font-size: 1.1rem;
                padding: 8px 15px;
            }
        }



    </style>
</head>
<body>

<%
    HttpSession session1 = request.getSession(false);
    String userEmail = (String) session1.getAttribute("userEmail");

    if (userEmail == null) {
        response.sendRedirect("form.jsp");
        return;
    }
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("form.jsp");
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    int patientId = 0;
    String name = "";
    String password = "";
    String address = "";
    Date dob = null;
    String country = "";
    long phone = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url1 = "jdbc:mysql://localhost:3306/javawebapplication";
        String dbUsername1 = "root";
        String dbPassword1 = "Rootroot12345";
        conn = DriverManager.getConnection(url1, dbUsername1, dbPassword1);

        String query = "SELECT patient_id, name, email, password, address, DOB, country, phone FROM register WHERE email = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, userEmail);
        rs = stmt.executeQuery();

        if (rs.next()) {
            patientId = rs.getInt("patient_id");
            name = rs.getString("name");
            password = rs.getString("password");
            address = rs.getString("address");
            dob = rs.getDate("DOB");
            country = rs.getString("country");
            phone = rs.getLong("phone");

            System.out.println("Patient ID: " + patientId);
            System.out.println("Name: " + name);
            System.out.println("Password: " + password);
            System.out.println("Address: " + address);
            System.out.println("DOB: " + dob);
            System.out.println("Country: " + country);
            System.out.println("Phone: " + phone);

            session1.setAttribute("patientId", patientId);
            session1.setAttribute("name", name);
            session1.setAttribute("password", password);
            session1.setAttribute("address", address);
            session1.setAttribute("dob", dob);
            session1.setAttribute("country", country);
            session1.setAttribute("phone", phone);
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



<div class="header" id="header">
    <div class="profile-info" id="profileInfo">
        <div class="profile-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M12 2C14.76 2 17 4.24 17 7C17 9.76 14.76 12 12 12C9.24 12 7 9.76 7 7C7 4.24 9.24 2 12 2ZM12 14C15.86 14 20 15.79 20 18V20H4V18C4 15.79 8.14 14 12 14Z"></path>
            </svg>
        </div>
        <div class="user-email">
            <%= name %>
        </div>
    </div>
    <div class="header-buttons">
        <a href="display.jsp" class="btn btn-primary">
            <i class="fa fa-user-md"></i> Request an appointment
        </a>
        <a href="achievements.jsp" class="btn btn-primary">
            <i class="fa fa-trophy"></i> Achievements
        </a>

        <a href="doctor.jsp" class="btn btn-primary">
            <i class="fa fa-user-md"></i> Explore Doctors
        </a>
        <button id="logOutBtn" onclick="confirmLogout()" class="btn btn-primary">
            <i class="fa fa-sign-out-alt"></i> Log Out
        </button>
    </div>
</div>

<div id = "welcomeMessage1" class="welcome">
    <span class="text1">Welcome </span>
    <span class="text2"><%= name %></span>
</div>
<div id="dynamicContent" class="content">
    <div class="container light-style flex-grow-1 container-p-y">
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-change-password">Change password</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">Info</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="account-general">
                            <div class="card-body media align-items-center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Avatar" class="d-block ui-w-80">
                                <div class="media-body ml-4">
                                </div>
                                <div class="form-group">
                                    <label for="id" class="form-label">ID</label>
                                    <input type="number" id="id" name="id" value="<%= patientId %>" readonly class="form-control">
                                </div>
                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <form action="/settings" method="post">
                                    <div class="form-group">
                                        <label class="form-label">Username</label>
                                        <input type="text" class="form-control mb-1" name="username" value="<%= name %>">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input type="text" class="form-control mb-1" name="email" value="<%= userEmail %>">
                                        <div class="alert alert-warning mt-3">
                                            If your email is not confirmed. Please check your inbox.<br>
                                            <a href="javascript:void(0)">Resend confirmation</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Address</label>
                                        <input type="text" class="form-control" name="address" value="<%= address %>">
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary" id="saveChangesBtn">Save changes</button>&nbsp;

                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-change-password">
                            <form id="changePasswordForm" action="/password" method="POST">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Current password</label>
                                        <input type="password" class="form-control" name="currentPassword">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">New password</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Repeat new password</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                                    </div>
                                </div>
                                <div class="text-right mt-3">
                                    <button type="submit" class="btn btn-primary" id="savePasswordBtn">Save changes</button>&nbsp;

                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="account-info">
                            <form id="InfoForm" action="/info" method="POST">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Birthday</label>
                                        <input type="date" class="form-control" name = "birthday" value="<%= dob %>">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Country</label>
                                        <select class="custom-select" id="countrySelect" name="country">
                                            <option<%= "Afghanistan".equals(country) ? " selected" : "" %>>Afghanistan</option>
                                            <option<%= "Albania".equals(country) ? " selected" : "" %>>Albania</option>
                                            <option<%= "Algeria".equals(country) ? " selected" : "" %>>Algeria</option>
                                            <option<%= "Brazil".equals(country) ? " selected" : "" %>>Brazil</option>
                                            <option<%= "Bangladesh".equals(country) ? " selected" : "" %>>Bangladesh</option>
                                            <option<%= "Belgium".equals(country) ? " selected" : "" %>>Belgium</option>
                                            <option<%= "Canada".equals(country) ? " selected" : "" %>>Canada</option>
                                            <option<%= "China".equals(country) ? " selected" : "" %>>China</option>
                                            <option<%= "Colombia".equals(country) ? " selected" : "" %>>Colombia</option>
                                            <option<%= "Denmark".equals(country) ? " selected" : "" %>>Denmark</option>
                                            <option<%= "Djibouti".equals(country) ? " selected" : "" %>>Djibouti</option>
                                            <option<%= "Dominican Republic".equals(country) ? " selected" : "" %>>Dominican Republic</option>
                                            <option<%= "Egypt".equals(country) ? " selected" : "" %>>Egypt</option>
                                            <option<%= "Estonia".equals(country) ? " selected" : "" %>>Estonia</option>
                                            <option<%= "Ethiopia".equals(country) ? " selected" : "" %>>Ethiopia</option>
                                            <option<%= "Finland".equals(country) ? " selected" : "" %>>Finland</option>
                                            <option<%= "France".equals(country) ? " selected" : "" %>>France</option>
                                            <option<%= "Fiji".equals(country) ? " selected" : "" %>>Fiji</option>
                                            <option<%= "Germany".equals(country) ? " selected" : "" %>>Germany</option>
                                            <option<%= "Ghana".equals(country) ? " selected" : "" %>>Ghana</option>
                                            <option<%= "Greece".equals(country) ? " selected" : "" %>>Greece</option>
                                            <option<%= "Honduras".equals(country) ? " selected" : "" %>>Honduras</option>
                                            <option<%= "Hungary".equals(country) ? " selected" : "" %>>Hungary</option>
                                            <option<%= "Haiti".equals(country) ? " selected" : "" %>>Haiti</option>
                                            <option<%= "Iceland".equals(country) ? " selected" : "" %>>Iceland</option>
                                            <option<%= "India".equals(country) ? " selected" : "" %>>India</option>
                                            <option<%= "Indonesia".equals(country) ? " selected" : "" %>>Indonesia</option>
                                            <option<%= "Jamaica".equals(country) ? " selected" : "" %>>Jamaica</option>
                                            <option<%= "Japan".equals(country) ? " selected" : "" %>>Japan</option>
                                            <option<%= "Jordan".equals(country) ? " selected" : "" %>>Jordan</option>
                                            <option<%= "Kenya".equals(country) ? " selected" : "" %>>Kenya</option>
                                            <option<%= "Kuwait".equals(country) ? " selected" : "" %>>Kuwait</option>
                                            <option<%= "Kazakhstan".equals(country) ? " selected" : "" %>>Kazakhstan</option>
                                            <option<%= "Laos".equals(country) ? " selected" : "" %>>Laos</option>
                                            <option<%= "Latvia".equals(country) ? " selected" : "" %>>Latvia</option>
                                            <option<%= "Lebanon".equals(country) ? " selected" : "" %>>Lebanon</option>
                                            <option<%= "Madagascar".equals(country) ? " selected" : "" %>>Madagascar</option>
                                            <option<%= "Malaysia".equals(country) ? " selected" : "" %>>Malaysia</option>
                                            <option<%= "Mexico".equals(country) ? " selected" : "" %>>Mexico</option>
                                            <option<%= "Nepal".equals(country) ? " selected" : "" %>>Nepal</option>
                                            <option<%= "Netherlands".equals(country) ? " selected" : "" %>>Netherlands</option>
                                            <option<%= "Nigeria".equals(country) ? " selected" : "" %>>Nigeria</option>
                                            <option<%= "Oman".equals(country) ? " selected" : "" %>>Oman</option>
                                            <option<%= "Pakistan".equals(country) ? " selected" : "" %>>Pakistan</option>
                                            <option<%= "Panama".equals(country) ? " selected" : "" %>>Panama</option>
                                            <option<%= "Paraguay".equals(country) ? " selected" : "" %>>Paraguay</option>
                                            <option<%= "Qatar".equals(country) ? " selected" : "" %>>Qatar</option>
                                            <option<%= "Romania".equals(country) ? " selected" : "" %>>Romania</option>
                                            <option<%= "Russia".equals(country) ? " selected" : "" %>>Russia</option>
                                            <option<%= "Rwanda".equals(country) ? " selected" : "" %>>Rwanda</option>
                                            <option<%= "Saudi Arabia".equals(country) ? " selected" : "" %>>Saudi Arabia</option>
                                            <option<%= "Senegal".equals(country) ? " selected" : "" %>>Senegal</option>
                                            <option<%= "Singapore".equals(country) ? " selected" : "" %>>Singapore</option>
                                            <option<%= "Thailand".equals(country) ? " selected" : "" %>>Thailand</option>
                                            <option<%= "Tunisia".equals(country) ? " selected" : "" %>>Tunisia</option>
                                            <option<%= "Turkey".equals(country) ? " selected" : "" %>>Turkey</option>
                                            <option<%= "Uganda".equals(country) ? " selected" : "" %>>Uganda</option>
                                            <option<%= "Ukraine".equals(country) ? " selected" : "" %>>Ukraine</option>
                                            <option<%= "United Arab Emirates".equals(country) ? " selected" : "" %>>United Arab Emirates</option>
                                            <option<%= "Vietnam".equals(country) ? " selected" : "" %>>Vietnam</option>
                                            <option<%= "Venezuela".equals(country) ? " selected" : "" %>>Venezuela</option>
                                            <option<%= "Vatican City".equals(country) ? " selected" : "" %>>Vatican City</option>
                                            <option<%= "Yemen".equals(country) ? " selected" : "" %>>Yemen</option>
                                            <option<%= "Zambia".equals(country) ? " selected" : "" %>>Zambia</option>
                                            <option<%= "Zimbabwe".equals(country) ? " selected" : "" %>>Zimbabwe</option>
                                        </select>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Contacts</h6>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" class="form-control" placeholder="+92 (315) 5822937" id="phoneInput" name = "phone" value="<%= phone %>">
                                    </div>
                                </div>
                                <div class="text-right mt-3">
                                    <button type="submit" class="btn btn-primary" id="saveInfoBtn">Save changes</button>&nbsp;

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

    document.addEventListener('DOMContentLoaded', function() {

        var header = document.getElementById('header');
        var profileInfo = document.getElementById('profileInfo');
        var dynamicContent = document.getElementById('dynamicContent');
        var cancelButton = document.getElementById('cancelButton');



        profileInfo.onclick = function() {
            if (dynamicContent.classList.contains("active")) {
                dynamicContent.classList.remove("active");
                profileInfo.classList.remove("selected");
                header.classList.remove("expanded");
            } else {
                dynamicContent.classList.add("active");
                profileInfo.classList.add("selected");
                header.classList.add("expanded");
            }
        };

        cancelButton.onclick = function() {
            dynamicContent.classList.remove("active");
            profileInfo.classList.remove("selected");
            header.classList.remove("expanded");
        };
    });
    function showPopupRegisterGreen(message) {
        var popup = document.createElement('div');
        popup.id = 'register-popup-green';
        popup.innerText = message;
        document.body.appendChild(popup);

        setTimeout(function() {
            popup.style.opacity = '0';
        }, 3000);

        setTimeout(function() {
            document.body.removeChild(popup);
        }, 3000);
    }

    function removeWelcomeMessage() {
        const welcomeMessage = document.getElementById('welcomeMessage1');
        welcomeMessage.classList.add('fade-out');

        setTimeout(() => {
            welcomeMessage.remove();
        }, 500);
    }

    setTimeout(removeWelcomeMessage, 5500);


    document.getElementById("savePasswordBtn").addEventListener("click", function() {
        var formData = new FormData(document.querySelector("#changePasswordForm"));
        const newPasswordField = document.getElementById('newPassword');
        const confirmPasswordField = document.getElementById('confirmPassword');

        const newPasswordValue = newPasswordField.value;
        const confirmPasswordValue = confirmPasswordField.value;

        if (newPasswordValue !== confirmPasswordValue) {
            displayCustomAlert('Passwords do not match');
            return;
        }

        fetch('/password', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    console.log('Password update request sent successfully');
                } else {
                    throw new Error('Failed to update password');
                }
            })
            .catch(error => {
                console.error('Error updating password:', error);
                displayCustomAlert('Failed to update password. Please try again.');
            });
    });

    function displayCustomAlert(message) {
        const alertBox = document.getElementById('customAlert');
        const alertMessage = document.getElementById('alertMessage');
        alertMessage.textContent = message;


        alertBox.classList.add('show');


        setTimeout(function() {
            alertBox.classList.remove('show');
        }, 3000);
    }

    document.getElementById('infoForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const birthday = document.getElementById('birthday').value;
        const country = document.getElementById('country').value;
        const phone = document.getElementById('phone').value;

        const formData = {
            birthday: birthday,
            country: country,
            phone: phone
        };

        fetch('/info', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                if (data.success) {
                    window.location.href = 'success.jsp';
                } else {
                    console.error('Error:', data.message);
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    });

    document.getElementById('cancelBtn').addEventListener('click', function() {
        document.getElementById('infoForm').reset();
        window.location.href = 'form.jsp';
    });



    const countrySelect = document.getElementById('countrySelect');
    const phoneInput = document.getElementById('phoneInput');

    const countryPhoneCodes = {
        "Afghanistan": "+93",
        "Albania": "+355",
        "Algeria": "+213",
        "Brazil": "+55",
        "Bangladesh": "+880",
        "Belgium": "+32",
        "Canada": "+1",
        "China": "+86",
        "Colombia": "+57",
        "Denmark": "+45",
        "Djibouti": "+253",
        "Dominican Republic": "+1-809",
        "Egypt": "+20",
        "Estonia": "+372",
        "Ethiopia": "+251",
        "Finland": "+358",
        "France": "+33",
        "Fiji": "+679",
        "Germany": "+49",
        "Ghana": "+233",
        "Greece": "+30",
        "Honduras": "+504",
        "Hungary": "+36",
        "Haiti": "+509",
        "Iceland": "+354",
        "India": "+91",
        "Indonesia": "+62",
        "Jamaica": "+1-876",
        "Japan": "+81",
        "Jordan": "+962",
        "Kenya": "+254",
        "Kuwait": "+965",
        "Kazakhstan": "+7",
        "Laos": "+856",
        "Latvia": "+371",
        "Lebanon": "+961",
        "Madagascar": "+261",
        "Malaysia": "+60",
        "Mexico": "+52",
        "Nepal": "+977",
        "Netherlands": "+31",
        "Nigeria": "+234",
        "Oman": "+968",
        "Pakistan": "+92",
        "Panama": "+507",
        "Paraguay": "+595",
        "Qatar": "+974",
        "Romania": "+40",
        "Russia": "+7",
        "Rwanda": "+250",
        "Saudi Arabia": "+966",
        "Senegal": "+221",
        "Singapore": "+65",
        "Thailand": "+66",
        "Tunisia": "+216",
        "Turkey": "+90",
        "Uganda": "+256",
        "Ukraine": "+380",
        "United Arab Emirates": "+971",
        "Vietnam": "+84",
        "Venezuela": "+58",
        "Vatican City": "+379",
        "Yemen": "+967",
        "Zambia": "+260",
        "Zimbabwe": "+263"
    };

    countrySelect.addEventListener('change', function() {
        const selectedCountry = countrySelect.value;
        const phoneCode = countryPhoneCodes[selectedCountry];
        phoneInput.placeholder = phoneCode ? phoneCode + " (123) 456-7890" : "(123) 456-7890";
    });


    function confirmLogout() {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = "/logout";
        }
    }


</script>

</body>
</html>