<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="UTF-8">
    <title>Update Account</title>
</head>
<body>
    <script>
        // show success message on successful form submission
        var urlParams = new URLSearchParams(window.location.search);
        var success = urlParams.get('success');
        if (success) {
          document.getElementById('success').style.display = 'block';
        }
      </script>
       <img src="path/to/image.png" alt="Update Account">
      
    <div class="container">
        <%-- add your form here --%>
        <div id="success" class="success" style="display:none;">
          <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
          </div>
    <h1>Account details updated successfully!</h1>
    <% 
        String Uname = (String) session.getAttribute("Uname");
        if (Uname == null) {
            out.println("<p>Error: No user is currently logged in.</p>");
            return;
        }
        
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        
        if (fullName == null || dob == null || gender == null || email == null) {
            out.println("<p>Error: Missing required parameters.</p>");
            return;
        }
        
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "simran");
            
            pstmt = con.prepareStatement("UPDATE rto SET name=?, dob=?, gender=?, email=? WHERE uname=?");
            pstmt.setString(1, fullName);
            pstmt.setString(2, dob);
            pstmt.setString(3, gender);
            pstmt.setString(4, email);
            pstmt.setString(5, Uname);
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.println("<p></p>");
            } else {
                out.println("<p>Error: Failed to update account information.</p>");
            }
            
        } catch (ClassNotFoundException e) {
            out.println("<h1>Database driver not found</h1>");
        } catch (SQLException e) {
            out.println("<h1>Database error: " + e.getMessage() + "</h1>");
        } finally {
            try {
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
</body>
</html>
