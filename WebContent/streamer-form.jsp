<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Streamer Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: purple">
			<div>
				<a href="streamer-list.jsp" class="navbar-brand"> TwitchTrack3r </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Streamers</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${streamer != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${streamer == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${streamer != null}">
            			Edit Streamer
            		</c:if>
						<c:if test="${streamer == null}">
            			Add New Streamer
            		</c:if>
					</h2>
				</caption>

				<c:if test="${streamer != null}">
					<input type="hidden" name="id" value="<c:out value='${streamer.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Streamer Name</label> <input type="text"
						value="<c:out value='${streamer.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Streamer Online</label> <input type="text"
						value="<c:out value='${streamer.online}' />" class="form-control"
						name="online" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Streamer Subscribers</label> <input type="text"
						value="<c:out value='${streamer.subscribers}' />" class="form-control"
						name="subscribers" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Streamer Followers</label> <input type="text"
						value="<c:out value='${streamer.followers}' />" class="form-control"
						name="followers" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Streamer Category</label> <input type="text"
						value="<c:out value='${streamer.category_id}' />" class="form-control"
						name="category_id" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>