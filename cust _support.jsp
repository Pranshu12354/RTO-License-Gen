<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer Support</title>
	<style>
		 /* Style the page header */
         header {
        background-color: #333;
        color: #fff;
        padding: 20px;
        text-align: center;
    }
    
    /* Style the contact information */
    .contact {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 50px 0;
    }
    
    .contact img {
        margin-right: 20px;
    }
    
    .contact p {
        font-size: 24px;
        margin: 0;
    }
    
    /* Style the footer */
    footer {
        background-color: #333;
        color: #ffffff;
        padding: 20px;
        text-align: center;
    }
</style>

</head>
<body>
	<div class="container">
		<h1>Customer Support</h1>
		<h2>Essential Contact Details</h2>
        <header>
            <h1>Customer Support</h1>
        </header>
        
        <div class="contact">
            <img src="phone.png" alt="Phone">
            <p>Call us at: 1-800-123-4567</p>
        </div>
        
        <div class="contact">
            <img src="email.png" alt="Email">
            <p>Email us at: support@example.com</p>
        </div>
        
        <footer>
            <p>Copyright © 2023 RTO</p>
        </footer>
		<button onclick="window.location.href='link.html'">Back to Dashboard</button>
	</div>
</body>
</html>
