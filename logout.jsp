<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

</head>
<body>

    <%-- Redirect to index.html --%>
    <%
        response.sendRedirect("index.html");
    %>
</body>
</html>
