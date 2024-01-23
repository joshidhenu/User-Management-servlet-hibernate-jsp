<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management System</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="container mt-4">
		<h1>User Management</h1>
		<h2>
			<a class="btn btn-primary" href="new">Add New User</a> <a
				class="btn btn-secondary" href="list">List All Users</a>
		</h2>

		<table class="table table-bordered">
			<caption>List of Users</caption>
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="user" items="${listUser}">
				<tr>
					<td><c:out value="${user.id}" /></td>
					<td><c:out value="${user.firstname}" /></td>
					<td><c:out value="${user.lastname}" /></td>
					<td><a class="btn btn-info btn-sm"
						href="edit?id=<c:out value='${user.id}' />">Edit</a> <a
						class="btn btn-danger btn-sm"
						href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- Add Bootstrap JS (optional, depends on your requirements) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
