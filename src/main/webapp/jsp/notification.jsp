
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Toast Notification | CodingNepal</title>
    <link rel="stylesheet" href="css/notification.css">
    <link rel="stylesheet" href="css/profileCss.css">
    <link rel="stylesheet" href="css/notification.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <script src="js/notification.js" defer></script>

    <style>

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-image: url("Images/background1.gif");
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
        <a href="calorie.jsp" class="btn btn-primary">
            <i class="fa fa-user-md"></i> Request an appointment
        </a>
        <a href="achievements.jsp" class="btn btn-primary">
            <i class="fa fa-trophy"></i> Achievements
        </a>

        <a href="doctor.jsp" class="btn btn-primary">
            <i class="fa fa-user-md"></i> Explore Doctors
        </a>
        <button id="logOutBtn" onclick="logout()" class="btn btn-primary">
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
                                        <input type="text" class="form-control" id="phoneInput" name = "phone" value="<%= phone %>">
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

<script src="js/notification.js" defer></script>
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




    function logout() {
        var confirmLogout = confirm("Are you sure you want to log out?");

        if (confirmLogout) {
            alert("Logging out...");

            window.location.href = "form.jsp";
        }
    }

    </script>
<body>
<ul class="notifications"></ul>
</body>
</body>
</html>