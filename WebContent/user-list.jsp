<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>TwitchTrack3r</title>
<base href="/">
<meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="./resources/css/style.css">
<style>
.btn {
	background-color: #6441a5;
	color: white;
}

tbody tr.even:hover {
	background-color: #ccccff
}
tbody tr.odd:hover {
	background-color: #d9b3ff
}

.fa-edit, .fa-minus-circle{
color:purple;
}
body {
  font-family: Verdana;
}
</style>
</head>
<body id="bg">

	<header>
		<nav
			class="navbar navbar-expand-md navbar-dark justify-content-center"
			style="background-color: black">
			<div class="mx-5">
				<a href="<%=request.getContextPath()%>/listStreamer" class="navbar-brand">
					<img src="https://i.imgur.com/b5GO8xB.png" alt="logo" width="100px" height="60px">
				</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/listStreamer"
					class="nav-link" style="color: white">Streamers<img
						src="https://i.imgur.com/KTM5Bjk.gif" width="40px" height="40px"
						class="mx-3"></a></li>
			</ul>
			
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/listUser"
					class="nav-link" style="color: white">Users<img
						src="https://i.imgur.com/qmbb0Tt.gif" width="40px" height="40px"
						class="mx-3"></a></li>
			</ul>

		</nav>
	</header>
	<br>

	<div class="row">

		<div id="img" class="container">
			<img src="https://i.imgur.com/hjER5yP.png" alt="users"
				class="text-center">
		</div>

		<div class="container mb-5">
			<h3 class="text-center" id="prueba">
				List of Users <img src="https://i.imgur.com/PqAdbUP.png"
					width="5%" height="5%">
			</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newUser" class="btn">Add New
					User</a>
			</div>
			<br>
			<table id="dtable" class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<%-- <th>ID</th>--%>
						<th>Name</th>
						<th>Password</th>
						<th>Email</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">

						<tr>
							<%-- <td><c:out value="${user.id}" /></td>--%>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><a
								href="<%=request.getContextPath()%>/editUser?id=<c:out value='${user.id}' />"><i
									class="fas fa-edit"></i></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
								href="<%=request.getContextPath()%>/deleteUser?id=<c:out value='${user.id}' />"><i
									class="fas fa-minus-circle"></i></a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	<footer class="page-footer font-small blue">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			© 2020 Copyright: <a href="https://twitchtrack3r.com/">
				TwitchTrack3r.com</a>
		</div>
		<!-- Copyright -->

	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

	<script src="https://kit.fontawesome.com/43a566677e.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/script.js"></script>
	<script>
		$('#dtable').dataTable({
			"processing" : true
		});
	</script>
</body>

</html>