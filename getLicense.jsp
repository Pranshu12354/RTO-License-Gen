<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>License List</title>
<style>
    /* Style for the "Print License" button */
    .print-button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
</style>
</head>
<body>
<h1>License List</h1>
<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Parent Name</th>
    <th>Permanent Address</th>
    <th>Date of Birth</th>
    <th>Place of Birth</th>
    <th>Educational Qualification</th>
    <th>Blood Group</th>
    <th>Phone Number</th>
    <th>Email</th>
    <th>Print License</th>
</tr>
<%
    // Initialize database connection variables
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
    String dbUsername = "system";
    String dbPassword = "prashant";

    // Initialize database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        
        // Retrieve data from the database
        String sql = "SELECT * FROM license";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("full_name") + "</td>");
            out.println("<td>" + rs.getString("parent_full_name") + "</td>");
            out.println("<td>" + rs.getString("permanent_address") + "</td>");
            out.println("<td>" + rs.getDate("date_of_birth") + "</td>");
            out.println("<td>" + rs.getString("place_of_birth") + "</td>");
            out.println("<td>" + rs.getString("educational_qualification") + "</td>");
            out.println("<td>" + rs.getString("blood_group") + "</td>");
            out.println("<td>" + rs.getString("phone_number") + "</td>");
            out.println("<td>" + rs.getString("email_id") + "</td>");
            // Add "Print License" button and link to the "Generate License" page
            String fullName = rs.getString("full_name");
            out.println("<td><a href=\"generateLicense.jsp?fullName=" + fullName + "\" class=\"print-button\">Print License</a></td>");
            out.println("</tr>");
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error retrieving data!");
        e.printStackTrace();
    } finally {
        // Close database resources
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
%>
</table>
</body>
</html>
