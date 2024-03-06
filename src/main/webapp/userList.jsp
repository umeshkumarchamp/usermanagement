<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="models.User"%>
<%@ page import="java.util.List"%>
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
	margin: 50px auto; /* Increased margin */
	text-align: center;
	position: fixed; /* Fix position */
	top: 30%; /* Center vertically */
	left: 50%; /* Center horizontally */
	transform: translate(-50%, -50%);
	/* Center vertically and horizontally */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 20px; /* Increased padding */
	border-bottom: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #333;
	color: white;
}

.action-btn {
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border: none;
	padding: 7px 15px; /* Increased padding */
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	border: none;
}

.action-btn:hover {
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
			<a href="home.jsp" class="nav-link">Home</a> <a href="#"
				class="nav-link">Services</a> <a href="#" class="nav-link">Contact</a>
		</div>
		<a href="addUser.jsp" class="add-btn">Add User</a>
	</nav>

	<div class="container">
		<h2>List of Users</h2>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>

				<%
				for (User user : (List<User>) request.getAttribute("userList")) {
				%>
				<tr>
					<td><%=user.getId()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getEmail()%></td>
					<td><a class="action-btn"
						href="user-details?id=<%=user.getId()%>">Edit</a> <a
						class="action-btn" href="user-details?id=<%=user.getId()%>">Delete</a>
						<a class="action-btn" href="user-details?id=<%=user.getId()%>">View</a>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>


</body>
</html>
