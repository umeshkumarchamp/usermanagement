<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        nav {
            background-color: #333;
            padding: 10px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            position: fixed; /* Fix position */
            top: 0; /* Stick to the top of the viewport */
            width: 100%; /* Occupy full width */
        }
        .logo {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }
        .nav-links {
            display: flex;
        }
        .nav-link {
            color: #fff;
            text-decoration: none;
            margin-right: 20px;
            font-size: 16px;
        }
        .add-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }
        .add-btn:hover {
            background-color: #0056b3;
        }
        .container {
            max-width: 1000px; /* Increased max-width */
            margin: auto;
            text-align: center;
            position: fixed; /* Fix position */
            top: 40%; /* Center vertically */
            left: 50%; /* Center horizontally */
            transform: translate(-50%, -50%); /* Center vertically and horizontally */
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <!-- Logo -->
        <a href="#" class="logo">CodizWorld</a>
        <!-- Navbar Links -->
        <div class="nav-links">
            <a href="home.jsp" class="nav-link">Home</a>
            <a href="#" class="nav-link">Services</a>
            <a href="#" class="nav-link">Contact</a>
        </div>
        <a href="addUser.jsp" class="add-btn">Add User</a>
    </nav>
    
    <!-- Welcome Message with Button -->
    <div class="container">
        <h1>Welcome to User Management System</h1>
        <button onclick="showUsersList()">Show Users List</button>
    </div>

    <!-- Script to Show Users List -->
    <script>
        function showUsersList() {
            window.location.href = "users"; // Redirect to Users List page
        }
    </script>
</body>
</html>

