<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    .login-container {
        width: 300px;
        margin: 100px auto;
        background-color: #fff;
        border-radius: 5px;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.5s ease;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    input[type="text"],
    input[type="password"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Admin Login</h2>
    <form id="loginForm" action="admin-login" method="post">
        <input type="text" name="username"  name="username" placeholder="Username">
        <input type="password" name="password"  name="password" placeholder="Password">
        <input type="submit" value="Login">
    </form>
</div>

<script>
    // Add animation for the login container
    document.addEventListener('DOMContentLoaded', function () {
        var loginContainer = document.querySelector('.login-container');
        loginContainer.style.animation = 'fadeIn 0.5s ease';
    });
</script>
</body>
</html>