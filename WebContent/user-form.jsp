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
					class="nav-link" style="color: white">Users<img
						src="https://i.imgur.com/qmbb0Tt.gif" width="40px" height="40px"
						class="mx-3"></a></li>
			</ul>

		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="<%=request.getContextPath()%>/updateUser" method="post"
						class="needs-validation" novalidate>
				</c:if>
				<c:if test="${user == null}">
					<form action="<%=request.getContextPath()%>/insertUser" method="post"
						class="needs-validation" novalidate>
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
						
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id"
						value="<c:out value='${user.id}' />" />
				</c:if>
				
				<fieldset class="form-group md-form">
					<label for="name">User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required" placeholder="Name">
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid name!</div>
				</fieldset>
				<fieldset class="form-group md-form">
					<label for="password">User Password</label> <input type="text"
						value="<c:out value='${user.password}' />" class="form-control"
						name="password" required="required">
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid name!</div>
				</fieldset>
				<fieldset class="form-group md-form">
					<label for="email">User Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required">
					<div class="valid-feedback">Looks good!</div>
					<div class="invalid-feedback">Provide a valid name!</div>
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
	</script>
</body>
</html>