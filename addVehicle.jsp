<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Registration</title>
</head>
<body>
<h1>Vehicle Registration</h1>
<%
    String make = request.getParameter("make");
    String model = request.getParameter("model");
    int year = Integer.parseInt(request.getParameter("year"));
    String color = request.getParameter("color");
    String licensePlate = request.getParameter("license_plate");
    
    // Establish database connection
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "system";
    String password = "prashant";
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO vehicles (name, model, year, color, license_plate) VALUES (?, ?, ?, ?, ?)";
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, make);
        pstmt.setString(2, model);
        pstmt.setInt(3, year);
        pstmt.setString(4, color);
        pstmt.setString(5, licensePlate);
        pstmt.executeUpdate();
        out.println("<p>Vehicle registration successful!</p>");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p>Vehicle registration failed.</p>");
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
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
</body>
</html>
