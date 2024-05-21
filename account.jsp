<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 50px;
        }
        p {
            font-size: 16px;
            line-height: 1.5;
            margin: 20px 0;
        }
        form {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Your Account Details</h1>
        <p>Here is your personal information:</p>
    <% 
        String Uname = (String) session.getAttribute("uname");
        if (Uname == null) {
            out.println("<p>Error: No user is currently logged in.</p>");
            return;
        }
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "prashant");
            
            pstmt = con.prepareStatement("SELECT * FROM rto WHERE uname=?");
            pstmt.setString(1, Uname);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String fullName = rs.getString("name");
                String dob = rs.getString("dob");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                
                out.println("<p><strong>Full Name:</strong> " + fullName + "</p>");
                out.println("<p><strong>Username:</strong> " + Uname + "</p>");
                out.println("<p><strong>Date of Birth:</strong> " + dob + "</p>");
                out.println("<p><strong>Gender:</strong> " + gender + "</p>");
                out.println("<p><strong>Email:</strong> " + email + "</p>");
            } else {
                out.println("<p>User information not found.</p>");
            }
            
        } catch (ClassNotFoundException e) {
            out.println("<h1>Database driver not found</h1>");
        } catch (SQLException e) {
            out.println("<h1>Database error: " + e.getMessage() + "</h1>");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                out.println("<h1>Database error: " + e.getMessage() + "</h1>");
            }
        }
    %>
    <form action="edit.jsp" method="post">
        <input type="submit" value="Edit Details">
    </form>
</body>
</html>
