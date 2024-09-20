

<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Calories Tracker</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <style>
    body {
      font-family: Arial, sans-serif;
      font-size: 16px;
      background-image: url('Images/Mountain Snow.gif');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }

    .clear-btn.btn.blue.lighten-3 {
      border-radius: 6px;
      margin-bottom: 1%;
    }

    .clear-btn.btn.blue.lighten-3:hover {
      background-color: #039be5;
    }

    .blur-background {
      background: rgba(255, 255, 255, 0.8);
      backdrop-filter: blur(8px);
      padding: 20px;
      border-radius: 10px;
    }

    .btn.add-btn.blue.darken-3 {
      border-radius: 7px;
    }

    .nav-wrapper {
      background-color: rgba(0, 0, 255, 0.5);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      font-weight: 600;
      position: relative;
      z-index: 1;
    }

    .total-calories {
      font-weight: bold;
    }

    .total-calories .span {
      text-transform: uppercase;
    }

    input[type="text"],
    input[type="number"] {
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 8px;
    }

    .collection-item {
      margin-bottom: 10px;
    }

    .btn {
      border-radius: 5px;
    }

    .btn:hover {
      opacity: 0.8;
    }
  </style>
</head>
<%
  HttpSession session1 = request.getSession(false);
  String userEmail = (String) session1.getAttribute("userEmail");
  int id = 0;

  if (userEmail == null) {
    response.sendRedirect("profile.jsp");
  } else {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/javawebapplication";
      String dbUsername = "root";
      String dbPassword = "Rootroot12345";
      conn = DriverManager.getConnection(url, dbUsername, dbPassword);

      String query = "SELECT patient_id FROM register WHERE email = ?";
      stmt = conn.prepareStatement(query);
      stmt.setString(1, userEmail);
      rs = stmt.executeQuery();

      if (rs.next()) {
        id = rs.getInt("patient_id");
      }

      session1.setAttribute("id", id);

    } catch (SQLException | ClassNotFoundException e) {
      e.printStackTrace();
    } finally {
      try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
%>
<body>

<br>

<div class="container blur-background">
  <div class="card">
    <div class="card-content">
      <span class="card-title">Add Meal / Food item</span>
      <form id="calorieForm" action="/calorie" method="POST" class="col">

        <div class="row">

          <div class="input-field col s6">
            <input type="number" name="id" placeholder="Add ID" id="id-name" value = "<%= id %>" readonly>
            <label for="id-name">ID</label>
          </div>

          <div class="input-field col s6">
            <input type="text" name="item-name" placeholder="Add Item" id="item-name">
            <label for="item-name">Meal</label>
          </div>

          <div class="input-field col s6">
            <input type="number" name="item-calories" placeholder="Add Calories" id="item-calories">
            <label for="item-calories">Calories</label>
          </div>

          <div class="input-field col s6">
            <input type="date" name="date" placeholder="Add Date" id="date">
            <label for="date">Date</label>
          </div>

        </div>

        <div class="row">
          <button type="button" onclick="submitForm()" class="btn add-btn blue darken-3"><i class="fa fa-plus"></i> Add Meal</button>
          <button type="submit" class="btn update-btn orange"><i class="fa fa-pencil-square-o"></i> Update Meal</button>
          <button type="submit" class="btn delete-btn red"><i class="fa fa-remove"></i> Delete Meal</button>
          <button type="button" class="btn back-btn grey pull-right"><i class="fa fa-chevron-circle-left"></i> Back</button>
        </div>
      </form>
    </div>
  </div>

  <h3 class="center-align">Total calories: <span class="total-calories">0</span></h3>
  <li>
    <a href="#" class="clear-btn btn blue lighten-3">Clear All</a>
  </li>
  <ul id="item-list" class="collection">
  </ul>

  <div class="row">
    <button type="button" onclick="goToCalorieTable()" class="btn blue darken-3"><i class="fa fa-table"></i> View Calorie Table</button>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script>
  function submitForm() {
    var formData = new FormData(document.getElementById("calorieForm"));

    var xhr = new XMLHttpRequest();
    var url = "/calorie";
    xhr.open("POST", url, true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          console.log(xhr.responseText);
        } else {
          console.error('Error submitting form');
        }
      }
    };
    xhr.send(new URLSearchParams(formData));
  }
  function goToCalorieTable() {
    var id = <%= id %>;
    var url = 'calorieTable.jsp?id=' + id;
    window.location.href = url;
  }

</script>


<script src="js/app.js"></script>
</body>

</html>
