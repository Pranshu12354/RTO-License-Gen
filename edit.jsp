<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Account Details</title>
</head>
<body>
    <style>
        .update-button {
    background-color: #fff;
    border: 2px solid #333;
    border-radius: 5px;
    padding: 10px;
}

.update-button img {
    max-width: 100%;
    height: auto;
}

    </style>
    <h1>Edit Account Details</h1>
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
    %>
                
                    <form action="UpdateUserAccount.jsp" method="post">
                        <button type="submit" class="update-button">
                            <img src="path/to/image.png" alt="Update Account">
                        </button>
                    </form>
                    
                    <p>
                        <label for="fullName">Full Name:</label>
                        <input type="text" id="fullName" name="fullName" value="<%=fullName%>" required>
                    </p>
                    <p>
                        <label for="dob">Date of Birth:</label>
                        <input type="values" id="dob" name="dob" value="<%=dob%>" required>
                    </p>
                    <p>
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="">Select Gender</option>
                            <option value="Male" <%=gender.equals("Male") ? "selected" : ""%>>Male</option>
                            <option value="Female" <%=gender.equals("Female") ? "selected" : ""%>>Female</option>
                            <option value="Other" <%=gender.equals("Other") ? "selected" : ""%>>Other</option>
                        </select>
                    </p>
                    <p>
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%=email%>" required>
                    </p>
                    <p>
                        <input type="submit" value="Save">
                    </p>
                </form>
                <%
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
</body>
</html>
