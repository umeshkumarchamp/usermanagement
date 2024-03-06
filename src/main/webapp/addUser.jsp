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
            height: 100%; /* Ensure body covers entire viewport height */
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
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: fixed; /* Fix position */
            top: 50%; /* Center vertically */
            left: 50%; /* Center horizontally */
            transform: translate(-50%, -50%); /* Center vertically and horizontally */
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }
        form {
            display: grid;
            gap: 10px;
            grid-template-columns: 1fr 1fr;
        }
        label {
            font-weight: bold;
            grid-column: 1 / 2;
        }
        input[type="text"],
        input[type="number"],
        input[type="email"],
        select,
        button,
        input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            grid-column: 2 / 3;
        }
        input[type="file"] {
            margin-top: 10px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin : 20px 0px;
            transition: background-color 0.3s ease;
            grid-column: 1 / -1;
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
        <a href="home.jsp" class="logo">CodizWorld</a>
        <!-- Navbar Links -->
        <div class="nav-links">
            <a href="home.jsp" class="nav-link">Home</a>
            <a href="#" class="nav-link">Services</a>
            <a href="#" class="nav-link">Contact</a>
        </div>
        <a href="#" class="add-btn">Add User</a>
    </nav>
    
    <!-- Form to add a new user -->
    <div class="container">
        <h1>Add a New Naukar</h1>
        <form action="users" method="post" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>
            
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="profilePhoto">Profile Photo:</label>
            <input type="file" id="profilePhoto" name="photo" accept="image/*">
            
            <label for="resume">Resume:</label>
            <input type="file" id="resume" name="resume" accept=".pdf">
            
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
