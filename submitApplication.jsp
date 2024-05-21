<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Get form data
    String fullName = request.getParameter("fullName");
    String parentFullName = request.getParameter("parentFullName");
    String permanentAddress = request.getParameter("permanentAddress");
    String dob = request.getParameter("dob");
    String pob = request.getParameter("pob");
    String eduQual = request.getParameter("eduQual");
    String bloodGroup = request.getParameter("bloodGroup");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    
    // Initialize database connection variables
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
    String dbUsername = "system";
    String dbPassword = "prashant";

    // Initialize database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        
        // Insert form data into the database
        String sql = "INSERT INTO license (full_name, parent_full_name, permanent_address, date_of_birth, place_of_birth, educational_qualification, blood_group, phone_number, email_id) VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, fullName);
        stmt.setString(2, parentFullName);
        stmt.setString(3, permanentAddress);
        stmt.setString(4, dob);
        stmt.setString(5, pob);
        stmt.setString(6, eduQual);
        stmt.setString(7, bloodGroup);
        stmt.setString(8, phone);
        stmt.setString(9, email);
        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("success.jsp");
        } else {
            out.println("Error submitting application!");
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error submitting application: " + e.getMessage());
        e.printStackTrace();
    }
     finally {
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
