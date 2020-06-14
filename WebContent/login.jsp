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
<style>
body {
	font-family: Verdana;
}

#access {
	margin-top: 80px;
}
#access:hover {
  box-shadow: 0 0 33px rgba(166, 77, 255,.5); 
}

</style>
</head>
<body>
	<div align="center" id="access">
		<a href="<%=request.getContextPath()%>/smListStreamer"><img
			src="https://i.imgur.com/DGCtDKD.png"></a>
	</div>
	<div align="center" id="logo">
		<img src="https://i.imgur.com/scvAq55.png" width="30%" height="30%">
	</div>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<h3>Login as administrator</h3>
				<form action="<%=request.getContextPath()%>/loginAccess"
					method="post">
					<fieldset class="form-group md-form">
						<label for="name">Username</label> <input type="text" name="name"
							class="form-control" required="required" placeholder="Name">
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Provide a valid name!</div>
					</fieldset>
					<fieldset class="form-group md-form">
						<label for="password">Password</label> <input type="password"
							name="password" class="form-control" required="required"
							placeholder="">
						<div class="valid-feedback">Looks good!</div>
						<div class="invalid-feedback">Provide a valid name!</div>
					</fieldset>
					<input type="submit" value="Submit" />
				</form>
			</div>
		</div>
	</div>


</body>
</html>