<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Management Application</title>
<!-- Add Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container"></div>
	<div class="text-center mt-5"></div>

	<h1>User Management</h1>
	<h2>
		<a class="btn btn-primary" href="new">Add New User</a>
		&nbsp;&nbsp;&nbsp; <a class="btn btn-primary" href="list">List All
			Users</a>
	</h2>

	<div align="center">
		<form action="insert" method="post" class="mt-4">
			<table class="table table-bordered">
				<caption>Add New User</caption>
				<tr>
					<th>First Name:</th>
					<td><input type="text" name="firstname" class="form-control"
						size="45" /></td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td><input type="text" name="lastname" class="form-control"
						size="45" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" class="btn btn-success" /> <script
							src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
