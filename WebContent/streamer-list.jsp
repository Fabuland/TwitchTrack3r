<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<title>TwitchTrack3r</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: purple">
			<div>
				<a href="list" class="navbar-brand"> <img
					src="https://i.imgur.com/b5GO8xB.png" alt="logdo">
				</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Streamers</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">


		<div class="container">
			<h3 class="text-center">List of Streamers</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New Streamer</a>
			</div>
			<br>
			<table id="example" class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Online</th>
						<th>Subscribers</th>
						<th>Followers</th>
						<th>Category</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="streamer" items="${listStreamer}">

						<tr>
							<td><c:out value="${streamer.id}" /></td>
							<td><c:out value="${streamer.name}" /></td>
							<td><c:out value="${streamer.online}" /></td>
							<td><c:out value="${streamer.subscribers}" /></td>
							<td><c:out value="${streamer.followers}" /></td>
							<td><c:out value="${streamer.category_id}" /></td>
							<td><a href="edit?id=<c:out value='${streamer.id}' />"><i
									class="fas fa-edit"></i></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${streamer.id}' />"><i
									class="fas fa-minus-circle"></i></a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

	<script src="https://kit.fontawesome.com/43a566677e.js"
		crossorigin="anonymous"></script>
	<script>
		$('#example').dataTable({
			"processing" : true
		});
	</script>
</body>

</html>