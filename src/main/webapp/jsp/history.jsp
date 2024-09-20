


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
</head>

<body>
<style>



    * {
        margin: 0;
        padding: 0;

        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    @media print {
        .table, .table__body {
            overflow: visible;
            height: auto !important;
            width: auto !important;
        }
    }

    /*@page {
        size: landscape;
        margin: 0;
    }*/

    body {
        min-height: 100vh;
        background: url('Images/Personal Data.gif') center / cover;
        display: flex;
        justify-content: center;
        align-items: center;
        backdrop-filter: blur(3px);
    }

    main.table {
        width: 82vw;
        height: 90vh;
        background-color: #fff5;

        backdrop-filter: blur(7px);
        box-shadow: 0 .4rem .8rem #0005;
        border-radius: .8rem;

        overflow: hidden;
    }
    .body-blur {
        filter: blur(10px);
        pointer-events: none;
    }
    .modal-backdrop {
        display: none;
        position: fixed;
        z-index: 1000;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(10px);
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.5);
        width: 300px;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
        color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        font-family: 'Poppins', sans-serif;
    }

    .modal-content {
        background-color: #fefefe;
        padding: 20px;
        border-radius: 8px;
        color: #333;
        font-family: 'Poppins', sans-serif;
    }

    .modal h2 {
        margin-bottom: 10px;
    }

    .modal-content input[type="text"],
    .modal-content input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    .modal input[type=text]:focus,
    .modal input[type=password]:focus {
        background-color: rgba(255, 255, 255, 0.2);
    }

    .modal-content button {
        background-color: #6c00bd;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
        font-family: 'Poppins', sans-serif;
    }

    .modal button:hover {
        background-color: #4a007e;
    }

    .table__header {
        width: 100%;
        height: 10%;
        background-color: #fff4;
        padding: .8rem 1rem;

        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .table__header .input-group {
        width: 35%;
        height: 100%;
        background-color: #fff5;
        padding: 0 .8rem;
        border-radius: 2rem;

        display: flex;
        justify-content: center;
        align-items: center;

        transition: .2s;
    }

    .table__header .input-group:hover {
        width: 45%;
        background-color: #fff8;
        box-shadow: 0 .1rem .4rem #0002;
    }

    .table__header .input-group img {
        width: 1.2rem;
        height: 1.2rem;
    }

    .table__header .input-group input {
        width: 100%;
        padding: 0 .5rem 0 .3rem;
        background-color: transparent;
        border: none;
        outline: none;
    }

    .table__body {
        width: 95%;
        max-height: calc(89% - 1.6rem);
        background-color: #fffb;

        margin: .8rem auto;
        border-radius: .6rem;

        overflow: auto;
        overflow: overlay;
    }

    #deleteBtn {
        font-family: 'Poppins', sans-serif;
        background-color: #ff0000;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 7px;
        margin-left: 20px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #deleteBtn:hover {
        background-color: #e90000;
    }

    .table__body::-webkit-scrollbar{
        width: 0.5rem;
        height: 0.5rem;
    }

    .table__body::-webkit-scrollbar-thumb{
        border-radius: .5rem;
        background-color: #0004;
        visibility: hidden;
    }

    .table__body:hover::-webkit-scrollbar-thumb{
        visibility: visible;
    }


    table {
        width: 100%;
    }

    td img {
        width: 36px;
        height: 36px;
        margin-right: .5rem;
        border-radius: 50%;

        vertical-align: middle;
    }

    table, th, td {
        border-collapse: collapse;
        padding: 1rem;
        text-align: left;
    }

    thead th {
        position: sticky;
        top: 0;
        left: 0;
        background-color: #d5d1defe;
        cursor: pointer;
        text-transform: capitalize;
    }

    tbody tr:nth-child(even) {
        background-color: #0000000b;
    }

    tbody tr {
        --delay: .1s;
        transition: .5s ease-in-out var(--delay), background-color 0s;
    }

    tbody tr.hide {
        opacity: 0;
        transform: translateX(100%);
    }

    tbody tr:hover {
        background-color: #fff6 !important;
    }

    tbody tr td,
    tbody tr td p,
    tbody tr td img {
        transition: .2s ease-in-out;
    }

    tbody tr.hide td,
    tbody tr.hide td p {
        padding: 0;
        font-family: sans-serif;
        transition: .2s ease-in-out .5s;
    }

    tbody tr.hide td img {
        width: 0;
        height: 0;
        transition: .2s ease-in-out .5s;
    }
    .name-cell {
        padding-left: 5px;
    }
    .reason-cell {
        word-wrap: break-word;
        white-space: pre-wrap;
        overflow-wrap: break-word;
        max-width: 200px;
    }
    .gender-cell {
        text-align: start;
        margin-left: 25px;
        padding-left: 25px;
        right: 25px
    }
    .status {
        padding: .4rem 0;
        border-radius: 2rem;
        text-align: center;
    }

    .status.appointment {

        margin-left: 20px;
        padding-left: 20px;
        background-color: #86e49d;
        color: #006b21;
        padding: 0.6rem 1rem;
        border-radius: 20px;
        display: inline-block;
        margin-right: 7px;
        text-align: right;
        white-space: nowrap;
        margin-top: 4px;
    }
    .contact-cell {
        background-color: #6fcaea;
        color: rgba(35, 28, 28, 0.84);
        padding: 0.7rem 1rem;
        border-radius: 20px;
        display: inline-block;
        margin-right: 10px;
        white-space: nowrap;
        line-height: 1;
        vertical-align: middle;
        margin-top: 18px;
    }
    .appointmentWith {
        background-color: #da16bd;
        font-weight: bold;
        color: rgba(35, 28, 28, 0.84);
        padding: 0.7rem 1rem;
        border-radius: 25px;
        display: inline-block;
        margin-left: 35px;
        white-space: nowrap;
        line-height: 1;
        vertical-align: middle;
        margin-top: 19px;
    }


    @media (max-width: 1000px) {
        td:not(:first-of-type) {
            min-width: 12.1rem;
        }
    }

    thead th span.icon-arrow {
        display: inline-block;
        width: 1.3rem;
        height: 1.3rem;
        border-radius: 50%;
        border: 1.4px solid transparent;

        text-align: center;
        font-size: 1rem;

        margin-left: .5rem;
        transition: .2s ease-in-out;
    }

    thead th:hover span.icon-arrow{
        border: 1.4px solid #6c00bd;
    }

    thead th:hover {
        color: #6c00bd;
    }

    thead th.active span.icon-arrow{
        background-color: #6c00bd;
        color: #fff;
    }

    thead th.asc span.icon-arrow{
        transform: rotate(180deg);
    }

    thead th.active,tbody td.active {
        color: #6c00bd;
    }

    .export__file {
        position: relative;
    }

    .export__file .export__file-btn {
        display: inline-block;
        width: 2rem;
        height: 2rem;
        background: #fff6 url(Images/export.png) center / 80% no-repeat;
        border-radius: 50%;
        transition: .2s ease-in-out;
    }

    .export__file .export__file-btn:hover {
        background-color: #fff;
        transform: scale(1.15);
        cursor: pointer;
    }

    .export__file input {
        display: none;
    }

    .export__file .export__file-options {
        position: absolute;
        right: 0;

        width: 12rem;
        border-radius: .5rem;
        overflow: hidden;
        text-align: center;

        opacity: 0;
        transform: scale(.8);
        transform-origin: top right;

        box-shadow: 0 .2rem .5rem #0004;

        transition: .2s;
    }

    .export__file input:checked + .export__file-options {
        opacity: 1;
        transform: scale(1);
        z-index: 100;
    }

    .export__file .export__file-options label{
        display: block;
        width: 100%;
        padding: .6rem 0;
        background-color: #f2f2f2;

        display: flex;
        justify-content: space-around;
        align-items: center;

        transition: .2s ease-in-out;
    }

    .export__file .export__file-options label:first-of-type{
        padding: 1rem 0;
        background-color: #86e49d !important;
    }

    .export__file .export__file-options label:hover{
        transform: scale(1.05);
        background-color: #fff;
        cursor: pointer;
    }

    .export__file .export__file-options img{
        width: 2rem;
        height: auto;
    }

</style>

<% String name = request.getParameter("name"); %>
<%@ page import="java.sql.*" %>
<%@ page import="com.JavaWeb.Model.MyDb" %>
<%
    String query = "SELECT id, contact, gender, age, appointment_date, reason, doctor FROM appointments WHERE name=?";
    MyDb db = new MyDb();
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        connection = db.getCon();
        pstmt = connection.prepareStatement(query);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        boolean hasData = false;
%>

<main class="table" id="customers_table">
    <section class="table__header">
        <h1>Patient's history</h1>
        <button id="deleteBtn" onclick="deleteAppointment()">Delete</button>

    </section>
    <section class="table__body">
        <table class="table">
            <thead>
            <tr>
                <th> Id <span class="icon-arrow">&UpArrow;</span></th>
                <th> Name <span class="icon-arrow">&UpArrow;</span></th>
                <th> Contact <span class="icon-arrow">&UpArrow;</span></th>
                <th> Gender <span class="icon-arrow">&UpArrow;</span></th>
                <th> Age <span class="icon-arrow">&UpArrow;</span></th>
                <th> Appointment Date <span class="icon-arrow">&UpArrow;</span></th>
                <th> Reason <span class="icon-arrow">&UpArrow;</span></th>
                <th> Appointment With <span class="icon-arrow">&UpArrow;</span></th>
            </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
                    hasData = true;
                    int id = rs.getInt("id");
                    String contact = rs.getString("contact");
                    String gender = rs.getString("gender");
                    int age = rs.getInt("age");
                    Date appointmentDate = rs.getDate("appointment_date");
                    String reason = rs.getString("reason");
                    String appointmentWith = rs.getString("doctor");

                    String imageSrc = "";
                    if (gender.equalsIgnoreCase("female")) {
                        imageSrc = "Images/Zinzu Chan Lee.jpg";
                    } else {
                        imageSrc = "Images/Alson.jpg";
                    }
            %>
            <tr>
                <td><%= id %></td>
                <td class="name-cell"><img src="<%= imageSrc %>"><%= name %></td>
                <td class="contact-cell"><%= contact %></td>
                <td class="gender-cell"><%= gender %></td>
                <td><%= age %></td>
                <td>
                    <span class="status appointment"><%= appointmentDate %></span>
                </td>
                <td class = "reason-cell"><%= reason %></td>
                <td class="appointmentWith"><%= appointmentWith %></td>
            </tr>
            <%
                }
                if (!hasData) {
            %>
            <tr>
                <td colspan="8">No records found for <%= name %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
            %>
            <tr>
                <td colspan="8">Error: <%= e.getMessage() %></td>
            </tr>
            <%
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
            </tbody>
        </table>
    </section>
</main>

<div class="modal-backdrop" id="modalBackdrop"></div>
<div class="modal" id="passwordModal">
    <div class="modal-content">
        <h2>Enter ID and Password</h2>
        <input type="text" id="idInput" placeholder="ID">
        <br><br>
        <input type="password" id="passwordInput" placeholder="Password">
        <br><br>
        <button onclick="validateCredentials()">Submit</button>
    </div>
</div>

<script>

    function showModal() {
        document.getElementById('modalBackdrop').style.display = 'block';
        document.getElementById('passwordModal').style.display = 'block';
        document.querySelector('main.table').classList.add('body-blur');
    }

    function hideModal() {
        document.getElementById('modalBackdrop').style.display = 'none';
        document.getElementById('passwordModal').style.display = 'none';
        document.querySelector('main.table').classList.remove('body-blur');
    }

    function validateCredentials() {
        var id = document.getElementById('idInput').value;
        var password = document.getElementById('passwordInput').value;
        var name = '<%= name %>';

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/ValidateUserServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var response = xhr.responseText.trim();
                    if (response === 'success') {
                        hideModal();
                    } else {
                        alert('Invalid ID or password! Please try again.');
                    }
                } else {
                    alert('Error: ' + xhr.status);
                }
            }
        };
        xhr.send('name=' + encodeURIComponent(name) + '&id=' + encodeURIComponent(id) + '&password=' + encodeURIComponent(password));
    }

    window.onload = function() {
        showModal();
    };

    function deleteAppointment() {
        var name = "<%= name %>";

        if (confirm("Are you sure you want to delete this appointment?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var response = xhr.responseText.trim();
                        if (response === "success") {
                            alert("Appointment deleted successfully.");
                            window.location.reload();
                        } else if (response === "error") {
                            alert("Error deleting appointment. Please try again later.");
                        } else if (response === "invalid") {
                            alert("Invalid request. Please provide a valid appointment name.");
                        } else {
                            alert("Unexpected response from server: " + response);
                        }
                    } else {
                        alert("Error: " + xhr.status + ", " + xhr.statusText);
                    }
                }
            };
            xhr.send("name=" + encodeURIComponent(name));
        } else {
            console.log("Deletion cancelled.");
        }
    }



</script>

</body>
</html>

<script src="script.js"></script>

</body>
</html>

