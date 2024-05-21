<HTML>
    <BODY bgcolor="green">
        <%@ page import="java.sql.*, java.util.*, java.net.*, 
   oracle.jdbc.*, oracle.sql.*, oracle.jsp.dbutil.*" %>
   

   <%
   String fullName = request.getParameter("full-name");
   String username = request.getParameter("username");
   String dateOfBirth = request.getParameter("date-of-birth");
   String password = request.getParameter("password");
   String gender = request.getParameter("gender");
   String email = request.getParameter("email");
   String confirmPassword = request.getParameter("confirm-password");
   out.println("data received");

   try {
       Class.forName("oracle.jdbc.driver.OracleDriver");
       out.println("Driver Loaded Sucessfully");
       Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "prashant");
       out.println("Connect with oracle Sucessfully");
       PreparedStatement ps = cn.prepareStatement("insert into rto values(?,?,?,?,?,?,?)");
       ps.setString(1,fullName);
       ps.setString(2,username);
       ps.setString(3,(dateOfBirth));
       ps.setString(4,password);
       ps.setString(5,gender);
       ps.setString(6,email);
       ps.setString(7,confirmPassword);
       int x = ps.executeUpdate();
       if (x > 0) {
           out.println("user created sucessfully");
           %>
           <form action="index.html">
               <input type="submit" value="Go to SIGN UP PAGE">
           </form>
           <%
       }
     } catch (ClassNotFoundException e) {
       out.println("Driver Problem" + e.getMessage());
   } catch (SQLException e) {
       if (e.getMessage().contains("ORA-12899")) {
           %>
           <h2><font color="red">The data entered is too large for the column. Please try again.</font></h2>
           <form action="index.html">
               <input type="submit" value="Go to SIGN UP PAGE">
           </form>
           <%
       } else {
           out.println("Record with Given id already exist" + e.getMessage());
       }
   } catch (Exception e) {
       out.println("data insertion problem" + e.getMessage());
   }
   out.close(); 
   %>
   <h1><font color="red"><%out.println("data received");%></font></h1>
   <h1><font color="red"><%out.println(fullName);%></font></h1>
</BODY>

</HTML>
