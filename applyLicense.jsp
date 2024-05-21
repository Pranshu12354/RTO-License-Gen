<!DOCTYPE html>
<html>
<head>
	<title>License Application Form</title>
	<style>
		body {
			background-color: #F5F5F5;
			background-image: url('https://as2.ftcdn.net/v2/jpg/02/10/93/55/1000_F_210935550_vk9TUYQ4uHKBhePm1derj1pASOwLz3dl.jpg');
			background-repeat: no-repeat;
			background-size: cover;
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		h1 {
			background-color: #0066CC;
			color: #FFFFFF;
			margin: 0;
			padding: 20px;
			text-align: center;
		}
		form {
			background-color: #FFFFFF;
			border-radius: 10px;
			box-shadow: 0px 0px 10px #888888;
			margin: 50px auto;
			max-width: 500px;
			padding: 20px;
			width: 90%;
		}
		label {
			display: block;
			font-weight: bold;
			margin: 10px 0 5px;
		}
		input[type="text"],
		input[type="email"],
		input[type="tel"],
		textarea {
			border: 1px solid #CCCCCC;
			border-radius: 3px;
			box-sizing: border-box;
			margin: 5px 0 10px;
			padding: 10px;
			width: 100%;
		}
		input[type="submit"] {
			background-color: #0066CC;
			border: none;
			border-radius: 3px;
			color: #FFFFFF;
			cursor: pointer;
			font-size: 16px;
			margin-top: 10px;
			padding: 10px 20px;
		}
		input[type="submit"]:hover {
			background-color: #004C99;
			color: #FFFFFF;
		}
	</style>
</head>
<body>
	<h1>License Application Form</h1>
	<form action="submitApplication.jsp" method="post">
		<label for="fullName">Full Name:</label>
		<input type="text" id="fullName" name="fullName" required>

		<label for="parentFullName">Parent's Full Name:</label>
		<input type="text" id="parentFullName" name="parentFullName" required>

		<label for="permanentAddress">Permanent Address:</label>
		<textarea id="permanentAddress" name="permanentAddress" required></textarea>

		<label for="dob">Date of Birth (YYYY-MM-DD):</label>
		<input type="date" id="dob" name="dob" required>

		<label for="pob">Place of Birth:</label>
		<input type="text" id="pob" name="pob" required>

		<label for="eduQual">Educational Qualification:</label>
		<input type="text" id="eduQual" name="eduQual" required>

		<label for="bloodGroup">Blood Group:</label>
		<input type="text" id="bloodGroup" name="bloodGroup" required>

		<label for="phone">Phone Number:</label>
		<input type="tel" id="phone" name="phone" required>

		<label for="email">Email Address:</label>
		<input type="email" id="email" name="email" required>

		<input type="submit" value="Submit Application">
	</form>
</body>
</html>
