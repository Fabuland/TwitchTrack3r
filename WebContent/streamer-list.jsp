<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<title>TwitchTrack3r</title>
<base href="/">
<meta charset="utf-8">
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

</style>
</head>
<body id="bg">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark justify-content-center"
			style="background-color: black">
			<div class="mx-5">
				<a href="<%=request.getContextPath()%>/list" class="navbar-brand"> <img
					src="https://i.imgur.com/b5GO8xB.png" alt="logdo">
				</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link" style="color: white">Streamers<img src="https://i.imgur.com/4jPsJhj.gif" width="40px" height="40px" class="mx-3"></a></li>
			</ul>
			
		</nav>
	</header>
	<br>

	<div class="row">

		<div id="img" class="container">
		<img src="https://i.imgur.com/QClOTfG.png" alt="streams" class="text-center">
		</div>

		<div class="container mb-5">
			<h3 class="text-center" id="prueba">List of Streamers</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New Streamer</a>
			</div>
			<br>
			<table id="dtable" class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<%-- <th>ID</th>--%>
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
							<%-- <td><c:out value="${streamer.id}" /></td>--%>
							<td><c:out value="${streamer.name}" /></td>
							<td><c:out value="${streamer.online}" /></td>
							<td><c:out value="${streamer.subscribers}" /></td>
							<td><c:out value="${streamer.followers}" /></td>
							<td><c:out value="${streamer.category_id}" /></td>
							<td><a href="<%=request.getContextPath()%>/edit?id=<c:out value='${streamer.id}' />"><i
									class="fas fa-edit"></i></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
								href="<%=request.getContextPath()%>/delete?id=<c:out value='${streamer.id}' />"><i
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
	<script src="resources/js/script.js"></script>
	<script>
		$('#dtable').dataTable({
			"processing" : true
		});
	</script>
</body>

</html>