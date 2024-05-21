<HTML>
    <head>
        <meta charset="UTF-8">
    </head>
    <BODY bgcolor="green">
        <%@ page import="java.sql.*, java.util.*, java.net.*, oracle.jdbc.*, oracle.sql.*, oracle.jsp.dbutil.*,javax.servlet.http.Cookie" %>
        <% 
        String s1 = request.getParameter("username");
        String s2 = request.getParameter("password");

        out.println("USERNAME " + s1 + "<br>");
        out.println("PASSWORD " + s2 + "<br>");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "prashant");
            out.println("Connect with Oracle successfully<br>");
            PreparedStatement st = cn.prepareStatement("SELECT * FROM rto WHERE uname=? AND Password=?");
            st.setString(1, s1);
            st.setString(2, s2);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString("NAME");
                Cookie ct = new Cookie("Name", URLEncoder.encode(name, "UTF-8"));
                ct.setMaxAge(1500000 * 60);
                response.addCookie(ct);
                out.println(rs.getString(3) + "<br>");
                out.println(rs.getString(4) + "<br>");
                out.println(rs.getString(5) + "<br>");
                out.println(rs.getString(6) + "<br>");
                out.println(rs.getString(7) + "<br>");
                session.setAttribute("uname", s1); // set session attribute
                response.sendRedirect("link.html");
            } else {
                out.println("Invalid credential<br>");
                response.sendRedirect("CreateUserAccount.html");
            }
        } catch (ClassNotFoundException e) {
            out.println("Driver problem: " + e.getMessage() + "<br>");
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage() + "<br>");
        } catch (Exception e) {
            out.println("Data insertion problem: " + e.getMessage() + "<br>");
        }
        %>
    </BODY>
</HTML>
