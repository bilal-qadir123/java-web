



package com.JavaWeb.Model;

import com.JavaWeb.Beans.AppointmentBean;
import com.JavaWeb.Beans.RegisterBean;
import com.JavaWeb.Model.MyDb;

import java.sql.*;

public class UserDb {
    private String url = "jdbc:mysql://localhost:3306/javawebapplication";
    private String dbUsername = "root";
    private String dbPassword = "Rootroot12345";
    MyDb db = new MyDb();

    public String insertUser(RegisterBean rb) {
        Connection con = db.getCon();
        String result = null;

        if (con != null) {
            try {
                int patientId = generateUniquePatientId(con);
                String query = "INSERT INTO register(patient_id, name, email, password, address, DOB, country, phone) VALUES (?, ?, ?, ?, NULL, NULL, NULL, NULL);\n";
                try (PreparedStatement pstmt = con.prepareStatement(query)) {
                    pstmt.setInt(1, patientId);
                    pstmt.setString(2, rb.getName());
                    pstmt.setString(3, rb.getEmail());
                    pstmt.setString(4, rb.getPassword());

                    System.out.println("Executing query: " + pstmt);
                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        result = "Data Inserted";
                        System.out.println("Data inserted successfully.");
                    } else {
                        result = "No rows affected.";
                        System.out.println("No rows were inserted.");
                    }
                }
            } catch (SQLException e) {
                System.out.println("Error executing query: " + e.getMessage());
                e.printStackTrace();
                result = "Data Insertion Failed: " + e.getMessage();
            }
        } else {
            result = "Database connection is null";
            System.out.println("Failed to obtain database connection.");
        }
        return result;
    }

    private int generateUniquePatientId(Connection con) throws SQLException {
        int patientId;
        boolean idExists;

        do {
            patientId = (int) (Math.random() * 900) + 100; 
            String checkQuery = "SELECT patient_id FROM register WHERE patient_id = ?";
            try (PreparedStatement pstmt = con.prepareStatement(checkQuery)) {
                pstmt.setInt(1, patientId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    idExists = rs.next();
                }
            }
        } while (idExists);

        return patientId;
    }

    public String insertInfo(AppointmentBean app) {
        MyDb db = new MyDb();
        Connection con = db.getCon();
        String result = null;

        if (con != null) {
            try (Statement statement = con.createStatement()) {

                String doctorQuery = "SELECT name FROM doctors ORDER BY RAND() LIMIT 1";
                ResultSet rs = statement.executeQuery(doctorQuery);
                String doctorName = "";
                if (rs.next()) {
                    doctorName = rs.getString("name");
                } else {
                    throw new SQLException("No doctors found in the doctors table.");
                }


                String query = "INSERT INTO appointments(id, name, contact, gender, age, appointment_date, reason, doctor) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = con.prepareStatement(query)) {
                    pstmt.setInt(1, app.getId());
                    pstmt.setString(2, app.getName());
                    pstmt.setLong(3, app.getContact());
                    pstmt.setString(4, app.getGender());
                    pstmt.setInt(5, app.getAge());
                    pstmt.setDate(6, java.sql.Date.valueOf(app.getDate()));
                    pstmt.setString(7, app.getReason());
                    pstmt.setString(8, doctorName);

                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        result = "Data Inserted";
                        System.out.println("Data inserted successfully.");
                    } else {
                        result = "No rows affected.";
                        System.out.println("No rows were inserted.");
                    }
                }
            } catch (SQLException e) {
                System.out.println("Error executing query: " + e.getMessage());
                e.printStackTrace();
                result = "Data Insertion Failed: " + e.getMessage();
            }
        } else {
            result = "Database connection is null";
            System.out.println("Failed to obtain database connection.");
        }
        return result;
    }


    public boolean isIdPresent(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isPresent = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String query = "SELECT 1 FROM register WHERE patient_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                isPresent = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
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
        return isPresent;
    }

    public boolean updateInfo(String userEmail, String birthday, String country, long phone) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            String query = "UPDATE register SET DOB=?, country=?, phone=? WHERE email=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, birthday);
            stmt.setString(2, country);
            stmt.setLong(3, phone);
            stmt.setString(4, userEmail);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean updateGeneral(String userEmail, String username, String email, String address) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement stmtRegister = null;
        boolean success = false;

        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            String query = "UPDATE register SET name=?, email=?, address=? WHERE email=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, address);
            stmt.setString(4, userEmail);

            int rowsUpdated = stmt.executeUpdate();
            String updateRegisterQuery = "UPDATE register SET name=?, email=? WHERE email=?";
            stmtRegister = conn.prepareStatement(updateRegisterQuery);
            stmtRegister.setString(1, username);
            stmtRegister.setString(2, email);
            stmtRegister.setString(3, userEmail);
            int rowsUpdatedRegister = stmtRegister.executeUpdate();


            if (rowsUpdated > 0 && rowsUpdatedRegister > 0) {
                conn.commit();
                success = true;
            } else {
                conn.rollback();
            }

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {

            if (stmt != null) {
                stmt.close();
            }
            if (stmtRegister != null) {
                stmtRegister.close();
            }
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }

        return success;
    }
    public boolean updatePassword(String userEmail, String currentPassword, String newPassword) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean updated = false;

        try {
            con = DriverManager.getConnection(url, dbUsername, dbPassword);

            if (con != null) {
                String retrievePasswordQuery = "SELECT password FROM register WHERE email = ?";
                ps = con.prepareStatement(retrievePasswordQuery);
                ps.setString(1, userEmail);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String storedPassword = rs.getString("password");

                    if (storedPassword.equals(currentPassword)) {
                        String updateQuery = "UPDATE register SET password = ? WHERE email = ?";
                        ps = con.prepareStatement(updateQuery);
                        ps.setString(1, newPassword);
                        ps.setString(2, userEmail);

                        int rowsUpdated = ps.executeUpdate();
                        updated = rowsUpdated > 0;

                        if (updated) {
                            System.out.println("Password updated successfully!");
                        } else {
                            System.out.println("No password updated.");
                        }
                    } else {
                        System.out.println("Current password does not match.");
                    }
                } else {
                    System.out.println("User with email " + userEmail + " not found.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error updating password: " + e.getMessage());
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return updated;
    }

    public boolean usernameTaken(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isTaken = false;

        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            String query = "SELECT 1 FROM register WHERE name = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                isTaken = true;
            }
        } catch (SQLException e) {
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
        return isTaken;
    }

    public boolean emailTaken(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isTaken = false;

        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            String query = "SELECT 1 FROM register WHERE email = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                isTaken = true;
            }
        } catch (SQLException e) {
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
        return isTaken;
    }


    public void deleteAppointment(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            String query = "DELETE FROM appointments WHERE name = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Appointment with name " + name + " deleted successfully.");
            } else {
                System.out.println("No appointment found with name " + name + ".");
            }
        } finally {
            // Close resources
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void Calorie(int id, int itemCalories, Date date) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        final int intake = 2000;

        try {
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            stmt = conn.prepareStatement("SELECT date, calories FROM calories WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            boolean idExists = false;
            boolean dateMatches = false;
            int existingCalories = 0;

            while (rs.next()) {
                idExists = true;
                Date existingDate = rs.getDate("date");
                if (existingDate.equals(date)) {
                    dateMatches = true;
                    existingCalories = rs.getInt("calories");
                    break;
                }
            }

            int totalCalories = itemCalories;
            if (idExists && dateMatches) {
                totalCalories += existingCalories;
                stmt = conn.prepareStatement("UPDATE calories SET calories = ?, intake = ? WHERE id = ? AND date = ?");
                stmt.setInt(1, totalCalories);
                stmt.setString(2, getIntakeStatus(totalCalories, intake));
                stmt.setInt(3, id);
                stmt.setDate(4, date);
            } else {
                stmt = conn.prepareStatement("INSERT INTO calories (id, calories, date, intake) VALUES (?, ?, ?, ?)");
                stmt.setInt(1, id);
                stmt.setInt(2, itemCalories);
                stmt.setDate(3, date);
                stmt.setString(4, getIntakeStatus(itemCalories, intake));
            }

            stmt.executeUpdate();

        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    private String getIntakeStatus(int totalCalories, int averageCalories) {
        if (totalCalories < averageCalories * 0.75) {
            return "Low Intake";
        } else if (totalCalories < averageCalories) {
            return "Normal";
        } else if (totalCalories < averageCalories * 1.25) {
            return "High";
        } else {
            return "Very";
        }
    }

    public boolean validatePassword(String newPassword, String confirmPassword) {
        return newPassword != null && newPassword.equals(confirmPassword);
    }
}
