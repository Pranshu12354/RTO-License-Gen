<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Vehicle</title>
</head>
<body>
    <h1>Register Vehicle</h1>
    <form action="addVehicle.jsp" method="post">
        <label for="make">Name:</label>
        <input type="text" id="make" name="make" required><br><br>
        <label for="model">Model:</label>
        <input type="text" id="model" name="model" required><br><br>
        <label for="year">Year:</label>
        <input type="number" id="year" name="year" required><br><br>
        <label for="color">Color:</label>
        <input type="text" id="color" name="color" required><br><br>
        <label for="license_plate">License Plate:</label>
        <input type="text" id="license_plate" name="license_plate" required><br><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>