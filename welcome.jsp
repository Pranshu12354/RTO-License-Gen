<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
<h1>Welcome <%= request.getParameter("name") %>!</h1>
<p>Here is your license.</p>
<a href="genrateLicense.jsp">Download License</a>
</body>
</html>
