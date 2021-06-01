<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container-md">
	<div class="container-md">
		<div class="jumbotron text-center">
		  <h1>Welcome to Chapps</h1> 
		</div>
	</div>
	<div class="d-flex col justify-content-center">
		<h3>Login</h3>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<p>${loginError}</p>
			<form method="POST" action="/login">
				<div class="form-group">
					<label>Email:</label>
					<input class="form-control" type="email" name="loginEmail">
				</div>
				<div class="form-group">
					<label>Password:</label>
					<input class="form-control" type="password" name="loginPassword">
				</div>
				<div class="d-flex justify-content-center">
					<button class="btn btn-danger">Login</button>
				</div>
			</form>
			<br>
			<div>
				<a href="/register">Register new account</a>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>