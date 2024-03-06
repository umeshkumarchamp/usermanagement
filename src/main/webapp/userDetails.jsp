<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.User"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Management System</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
	display: flex;
	flex-direction: column; /* Stack children vertically */
	justify-content: center;
	height: 50vh; /* Adjusted height */
	max-width: 1000px; /* Increased max-width */
	margin: 100px auto; /* Center horizontally and add space from top */
	margin-top: 200px;
	padding: 10px;
	background-color: #fff; /* Added background color */
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.user-details {
	display: flex;
	margin-top: 20px;
	
	justify-content: space-around;
}

.user-details img {
	width: 400px;
	height: 400px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.user-info {
	margin-left: 20px;
}

.user-info h3 {
	color: #333;
	margin-top: 0;
	font-size: 24px;
}

.user-info p {
	color: #666;
	margin-bottom: 10px;
	font-size: 18px;
}

.user-info a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.user-info a:hover {
	text-decoration: underline;
}

.back-link {
	margin-top: 20px;
	text-align: center;
}

.back-link a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.back-link a:hover {
	text-decoration: underline;
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
			<a href="home.jsp" class="nav-link">Home</a> <a href="#"
				class="nav-link">Services</a> <a href="#" class="nav-link">Contact</a>
		</div>
		<a href="addUser.jsp" class="add-btn">Add User</a>
	</nav>

	<%
	// Assuming you have a List<User> userList defined in your servlet
	User user = (User) request.getAttribute("user");
	%>

	<div class="container">
		<div class="user-details">
            <img src="data:image/png;base64, <%= Base64.getEncoder().encodeToString(user.getPhoto()) %>" alt="Profile Photo">
            <div class="user-info">
                <h3><%=user.getName()%></h3>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Age:</strong> <%= user.getAge() %></p>
                <p><strong>Gender:</strong> <%=user.getGender()%></p>
                <p><strong>Phone:</strong> <%=user.getPhone()%></p>
                <p><strong>Address:</strong> <%=user.getAddress()%></p>
                <p><a href="download-pdf?id=<%= user.getId() %>">Download CV</a></p>
            </div>
        </div>
		</div>

	</div>
	<div class="back-link">
		<a href="users">Back to User List</a>
	</div>
</body>
</html>