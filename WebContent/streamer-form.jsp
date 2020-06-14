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
<link rel="stylesheet" type="text/css" href="./resources/css/style.css">
<style>
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
					class="nav-link" style="color: white">Admins<img
						src="https://i.imgur.com/qmbb0Tt.gif" width="40px" height="40px"
						class="mx-3"></a></li>
			</ul>

		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${streamer != null}">
					<form action="<%=request.getContextPath()%>/updateStreamer" method="post"
						class="needs-validation" novalidate>
				</c:if>
				<c:if test="${streamer == null}">
					<form action="<%=request.getContextPath()%>/insertStreamer" method="post"
						class="needs-validation" novalidate>
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
					<input type="hidden" name="id"
						value="<c:out value='${streamer.id}' />" />
				</c:if>
				
				<fieldset class="form-group md-form">
					<label for="name">Streamer Name</label> <input type="text"
						value="<c:out value='${streamer.name}' />" class="form-control"
						name="name" required="required" placeholder="Name">
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid name!</div>
				</fieldset>

				<fieldset class="form-group">
					<label for="online">Streamer Online</label> <select name="online" id="online"
						class="custom-select form-control" required="required">
						<option disabled selected>- Choose status -</option>
						<option value="Online" ${streamer.online== 'a' ? 'selected' : ''}>Online</option>
						<option value="Offline" ${streamer.online== 'a' ? 'selected' : ''}>Offline</option>
					</select>
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid status!</div>
				</fieldset>

				<fieldset class="form-group">
					<label for="subscribers"><span rel="tooltip" title="Subscriptions cost money and gives benefits to the user">Streamer Subscribers</span></label> <input type="number"
						value="<c:out value='${streamer.subscribers}' />"
						class="form-control" name="subscribers" required="required" id="subscribers">
						<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid number of subscribers!</div>
				</fieldset>

				<fieldset class="form-group">
					<label for="followers"><span rel="tooltip" title="Following a streamer is free and it lets you know when they are going online">Streamer Followers</span></label> <input type="number"
						value="<c:out value='${streamer.followers}' />"
						class="form-control" name="followers" required="required" id="followers">
						<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid number of followers!</div>
				</fieldset>

				<fieldset class="form-group">
					<label for="category">Streamer Category</label> <select name="category_id"
						id="category" class="custom-select" required="required">
						<option disabled selected>- Choose category -</option>
						<option value="Just Chatting"
							${streamer.category_id== 'a' ? 'selected' : ''}>Just
							Chatting</option>
						<option value="League of Legends"
							${streamer.category_id== 'a' ? 'selected' : ''}>League
							of Legends</option>
						<option value="Fortnite"
							${streamer.category_id== 'a' ? 'selected' : ''}>Fortnite</option>
						<option value="Grand Theft Auto V"
							${streamer.category_id== 'a' ? 'selected' : ''}>Grand
							Theft Auto V</option>
						<option value="Call of Duty: Modern Warfare"
							${streamer.category_id== 'a' ? 'selected' : ''}>Call of
							Duty: Modern Warfare</option>
						<option value="Counter-Strike: Global Offensive"
							${streamer.category_id== 'a' ? 'selected' : ''}>Counter-Strike:
							Global Offensive</option>
						<option value="VALORANT"
							${streamer.category_id== 'a' ? 'selected' : ''}>VALORANT</option>
						<option value="Minecraft"
							${streamer.category_id== 'a' ? 'selected' : ''}>Minecraft</option>
						<option value="Dota 2"
							${streamer.category_id== 'a' ? 'selected' : ''}>Dota 2</option>
						<option value="Escape From Tarkov"
							${streamer.category_id== 'a' ? 'selected' : ''}>Escape
							From Tarkov</option>
					</select>
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid category!</div>
				</fieldset>

				<button type="submit" class="btn btn-success btn-rounded">Save</button>
				</form>
			</div>
		</div>
	</div>
	<footer class="page-footer font-small blue">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://twitchtrack3r.com/"> TwitchTrack3r.com</a>
  </div>
  <!-- Copyright -->

</footer>

	<script>
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
		$(function () {
			  $('[data-toggle="tooltip"]').tooltip()
			})
	</script>
</body>
</html>