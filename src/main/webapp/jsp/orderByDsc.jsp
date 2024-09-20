





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calorie Intake</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        @media print {
            .table,
            .table__body {
                overflow: visible;
                height: auto !important;
                width: auto !important;
            }
        }

        body {
            min-height: 100vh;
            background: url('Images/Calorie.gif') center / cover;
            display: flex;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(3px);
        }

        main.table {
            width: 82vw;
            height: 90vh;
            background-color: rgba(255, 255, 255, 0.90);
            backdrop-filter: blur(7px);
            box-shadow: 0 .4rem .8rem rgba(0, 0, 0, 0.2);
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
            background-color: rgba(255, 255, 255, 0.8);
            padding: .8rem 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ccc;
        }

        .table__header .input-group {
            width: 35%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 0 .8rem;
            border-radius: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: .2s;
        }

        .table__header .input-group:hover {
            width: 45%;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 .1rem .4rem rgba(0, 0, 0, 0.1);
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
            background-color: rgba(255, 255, 255, 0.95);
            margin: .8rem auto;
            border-radius: .6rem;
            overflow: auto;
            overflow: overlay;
            box-shadow: 0 .2rem .5rem rgba(0, 0, 0, 0.1);
        }



        .table__body::-webkit-scrollbar {
            width: .8rem;
            height: .8rem;
        }

        .table__body::-webkit-scrollbar-thumb {
            border-radius: .5rem;
            background-color: rgba(0, 0, 0, 0.2);
            visibility: hidden;
        }

        .table__body:hover::-webkit-scrollbar-thumb {
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

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: center;
            padding: 10px;
        }
        thead {
            background-color: rgba(0, 255, 232, 0.68);
        }
        thead title-header {
            background-color: rgba(13, 0, 44, 1);
            color: #333;
        }

        thead th {
            position: sticky;
            top: 0;
            background-color: rgba(221, 0, 255, 0.71);
            cursor: pointer;
            text-transform: capitalize;
            padding: 10px;
        }


        th:nth-child(2),
        td:nth-child(2) {
            text-align: center;
            padding-left: 240px;
        }

        th:nth-child(3),
        td:nth-child(3) {

            padding-left: 130px;

        }


        table, th, td {
            border: none;
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

        thead th:hover span.icon-arrow {
            border: 1.4px solid #6c00bd;
        }

        thead th:hover {
            color: #6c00bd;
        }

        thead th.active span.icon-arrow {
            background-color: #6c00bd;
            color: #fff;
        }

        thead th.asc span.icon-arrow {
            transform: rotate(180deg);
        }

        thead th.active,
        tbody td.active {
            color: #6c00bd;
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
            box-shadow: 0 .2rem .5rem rgba(0, 0, 0, 0.2);
            transition: .2s;
        }

        .export__file input:checked + .export__file-options {
            opacity: 1;
            transform: scale(1);
            z-index: 100;
        }

        .export__file .export__file-options label {
            display: block;
            width: 100%;
            padding: .6rem 0;
            background-color: #f2f2f2;
            display: flex;
            justify-content: space-around;
            align-items: center;
            transition: .2s ease-in-out;
        }

        .export__file .export__file-options label:first-of-type {
            padding: 1rem 0;
            background-color: #86e49d !important;
        }

        .export__file .export__file-options label:hover {
            transform: scale(1.05);
            background-color: #fff;
            cursor: pointer;
        }

        .export__file .export__file-options img {
            width: 2rem;
            height: auto;
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
            font-weight: bold;
        }

        .status.rejected {
            background-color: #f2dede;
            color: #a94442;
        }

        .status.processing {
            background-color: #f0ad4e;
            color: #a85400;
        }

        .status.complete {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .status.onhold {
            background-color: #d9edf7;
            color: #31708f;
        }

        .status span {
            margin-left: 10px;
        }

        .status.badge {
            display: inline-block;
            font-size: 0.9rem;
            padding: 0.3rem 0.6rem;
            border-radius: 1rem;
        }

        .status.draft {
            background-color: #f0f0f0;
            color: #555555;
        }

        .status.published {
            background-color: #4CAF50;
            color: white;
        }

        .status.pending {
            background-color: #e7e7bd;
            color: #8a8a1e;
        }

        .status.danger {
            background-color: #ffaaaa;
            color: #aa0000;
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
            font-weight: bold;
        }

        .status.rejected {
            background-color: #f2dede;
            color: #a94442;
        }

        .status.processing {
            background-color: #f0ad4e;
            color: #a85400;
        }

        .status.complete {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .status.onhold {
            background-color: #d9edf7;
            color: #31708f;
        }

        .status span {
            margin-left: 10px;
        }

        .status.badge {
            display: inline-block;
            font-size: 0.9rem;
            padding: 0.3rem 0.6rem;
            border-radius: 1rem;
        }

        .status.draft {
            background-color: #f0f0f0;
            color: #555555;
        }

        .status.published {
            background-color: #4CAF50;
            color: white;
        }

        .status.pending {
            background-color: #e7e7bd;
            color: #8a8a1e;
        }

        .status.danger {
            background-color: #ffaaaa;
            color: #aa0000;
        }
        #maxButton {
            font-family: 'Poppins', sans-serif;
            background-color: #ff0000;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 7px;
            margin-right: -700px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        #minButton {
            font-family: 'Poppins', sans-serif;
            background-color: #20ff00;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 7px;
            margin-right: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

    </style>
</head>

<body>

<% int id = Integer.parseInt(request.getParameter("id")); %>
<%@ page import="java.sql.*" %>
<%@ page import="com.JavaWeb.Model.MyDb" %>
<%
    String query = "SELECT id, calories, date, intake FROM calories WHERE id=? ORDER BY calories DESC";
    MyDb db = new MyDb();
    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        connection = db.getCon();
        pstmt = connection.prepareStatement(query);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        boolean hasData = false;
%>

<main class="table" id="calories_table">

    <section class="table__header">
        <h1>CALORIE INTAKE HISTORY</h1>
        <button id="maxButton" onclick="redirectToMaxPage(<%= id %>)" class="btn btn-primary">
            Max
        </button>
        <button id="minButton" onclick="redirectToMinPage(<%= id %>)" class="btn btn-primary">
            Min
        </button>

    </section>

    <section class="table__body">
        <table class="table">
            <thead>
            <tr>
                <th>Date</th>
                <th>Calories Consumed</th>
                <th>Caloric intake</th>
            </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
                    hasData = true;

                    int entryId = rs.getInt("id");
                    long calories = rs.getLong("calories");
                    Date date = rs.getDate("date");
                    String intakeStatus = rs.getString("intake");
            %>
            <tr>
                <td><%= date %></td>
                <td><%= calories %></td>
                <td><%= intakeStatus %></td>
            </tr>
            <%
                }
                if (!hasData) {
            %>
            <tr>
                <td colspan="3">No records found for ID <%= id %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
            %>
            <tr>
                <td colspan="3">Error: <%= e.getMessage() %></td>
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
<script>
    function redirectToMaxPage(id) {
        window.location.href = 'max.jsp?id=' + id;
    }
    function redirectToMinPage(id) {
        window.location.href = 'min.jsp?id=' + id;
    }

</script>
</body>
</html>
