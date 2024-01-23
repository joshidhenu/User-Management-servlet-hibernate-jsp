<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>User Management Application</title>
<!-- Add Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="container mt-4">
		<h1 class="text-center">User Management</h1>
		<h2 class="text-center">
			<a class="btn btn-primary" href="list">List All Users</a>
		</h2>

		<div class="text-center">
			<c:if test="${user != null}">
				<form action="update" method="post">
					<table class="table table-bordered">
						<caption>Edit User</caption>
						<tr>
							<th>First Name:</th>
							<td><input type="text" name="firstname" class="form-control"
								value="<c:out value='${user.firstname}' />" /></td>
						</tr>
						<tr>
							<th>Last Name:</th>
							<td><input type="text" name="lastname" class="form-control"
								value="<c:out value='${user.lastname}' />" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="hidden"
								name="id" value="<c:out value='${user.id}' />" /> <input
								type="submit" class="btn btn-success" value="Save" /></td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>

	<!-- Add Bootstrap JS (optional, depends on your requirements) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
