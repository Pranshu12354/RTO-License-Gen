<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-image: url('https://media3.giphy.com/media/3a53VvGpzUgh05qq7W/200w.gif?cid=6c09b952tieoq7ujjqer0qe0jfpfv6wa6pu93v2wsiylr238&ep=v1_gifs_search&rid=200w.gif&ct=g');
    background-repeat: no-repeat;
    background-size: cover ;
  }
  .success-msg {
    margin-top: 50px;
    font-size: 28px;
    font-weight: bold;
    color: green;
  }
  #dashboard-btn {
    display: inline-block;
    margin-top: 30px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    font-size: 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  #dashboard-btn:hover {
    background-color: #3e8e41;
  }
  
</style>
</head>
<body>
  <div class="success-msg">
    <p>Your application has been submitted successfully!</p>
  </div>
  <button id="dashboard-btn" onclick="window.location.href='link.html'">Go to Dashboard</button>
</body>
</html>
