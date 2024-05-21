<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>License</title>
<link rel="stylesheet" type="text/css" href="license.css">
</head>
<body>
<%
    // Get the full name of the person to generate the license for
    String fullName = request.getParameter("fullName");

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
        
        // Retrieve data for the specified person from the database
        String sql = "SELECT * FROM license WHERE full_name = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, fullName);
        rs = stmt.executeQuery();
        if (rs.next()) {
            // Generate the license using the retrieved data and the license style
            out.println("<div class=\"license\">");
            out.println("<h2>Driver's License</h2>");
            out.println("<p><span class=\"name\">Name:</span> <span class=\"info\">" + rs.getString("full_name") + "</span></p>");
            out.println("<p><span class=\"name\">Date of Birth:</span> <span class=\"info\">" + rs.getDate("date_of_birth") + "</span></p>");
            out.println("<p><span class=\"name\">Address:</span> <span class=\"info\">" + rs.getString("permanent_address") + "</span></p>");
            out.println("<p><span class=\"name\">Blood Group:</span> <span class=\"info\">" + rs.getString("blood_group") + "</span></p>");
            out.println("<p><span class=\"name\">Phone Number:</span> <span class=\"info\">" + rs.getString("phone_number") + "</span></p>");
            out.println("<p><span class=\"name\">Email:</span> <span class=\"info\">" + rs.getString("email_id") + "</span></p>");
            out.println("</div>");
        } else {
            out.println("<p>Could not find license data for " + fullName + "</p>");
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
