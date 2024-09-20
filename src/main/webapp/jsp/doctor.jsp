

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doctor Information</title>
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
      background: url('Images/Doctor.gif') center / cover;
      display: flex;
      justify-content: center;
      align-items: center;
      backdrop-filter: blur(5px);
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

    tbody tr.highlight-row {
      background-color: rgba(189, 136, 213, 0.84);
      color: #333;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    tbody tr.highlight-row:hover {
      background-color: rgb(191, 23, 255);
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

</head>
<body>
<main class="table" id="doctors_table">
  <section class="table__header">
    <h1>Doctors Information</h1>
    <!-- Add search and export functionalities if needed -->
  </section>
  <section class="table__body">
    <table class="table">
      <thead>
      <tr>
        <th> ID <span class="icon-arrow">&UpArrow;</span></th>
        <th> Name <span class="icon-arrow">&UpArrow;</span></th>
        <th> Contact <span class="icon-arrow">&UpArrow;</span></th>
        <th> Email <span class="icon-arrow">&UpArrow;</span></th>
        <th> Experience (Years) <span class="icon-arrow">&UpArrow;</span></th>
        <th> Qualification <span class="icon-arrow">&UpArrow;</span></th>
      </tr>
      </thead>
      <tbody>

      <%@ page import="java.sql.*" %>
      <%@ page import="com.JavaWeb.Model.MyDb" %>
      <%
        String query = "SELECT id, name, contact, email, experience_in_years, qualification FROM doctors";
        MyDb db = new MyDb();
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean hasData = false;
        try {
          connection = db.getCon();
          pstmt = connection.prepareStatement(query);
          rs = pstmt.executeQuery();

          while (rs.next()) {
            hasData = true;

            int id = rs.getInt("id");
            String name = rs.getString("name");
            String contact = rs.getString("contact");
            String email = rs.getString("email");
            int experience = rs.getInt("experience_in_years");
            String qualification = rs.getString("qualification");


            boolean highlightRow = (id == 13 || id == 21 || id == 24 || id == 48);


            String rowClass = highlightRow ? "highlight-row" : "";
      %>
      <tr class="<%= rowClass %>">
        <td><%= id %></td>
        <td><a href="#" class="clickable-name"><%= name %></a></td>
        <td><%= contact %></td>
        <td><%= email %></td>
        <td><%= experience %></td>
        <td><%= qualification %></td>
      </tr>
      <%
        }
        if (!hasData) {
      %>
      <tr>
        <td colspan="6">No records found.</td>
      </tr>
      <%
        }
      } catch (Exception e) {
      %>
      <tr>
        <td colspan="6">Error: <%= e.getMessage() %></td>
      </tr>
      <%
        } finally {
          try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
          try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
          try { if (connection != null) connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
      %>
      </tbody>
    </table>
  </section>
</main>

<!-- JavaScript to handle click events -->
<script>
  document.addEventListener("DOMContentLoaded", function () {

    const clickableNames = document.querySelectorAll(".clickable-name");


    clickableNames.forEach(function (element) {
      element.addEventListener("click", function (event) {
        event.preventDefault();


        const id = parseInt(element.closest("tr").querySelector("td:first-of-type").textContent.trim());


        const idToJspPage = {
          13: "drInaam.jsp",
          21: "drRafay.jsp",
          24: "drBilalQadir.jsp",
          48: "drBilalKhan.jsp"

        };


        if (idToJspPage[id]) {

          window.location.href = idToJspPage[id];
        } else {
          console.log("No JSP page defined for ID:", id);
        }
      });
    });
  });
</script>
</body>
</html>