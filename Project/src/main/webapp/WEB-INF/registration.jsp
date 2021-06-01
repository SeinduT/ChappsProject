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
		<h3>Register New Account</h3>
	</div>
	<div class="row">
	<div class="col"></div>
		<div class="col">
				<form:form method="POST" action="/register" modelAttribute="user">
					<div class="form-group">
						<form:label path="firstName">First Name:</form:label>
						<form:errors path="firstName"/>
						<form:input class="form-control" path="firstName"/>
					</div>
					<div class="form-group">
						<form:label path="lastName">Last Name:</form:label>
						<form:errors path="lastName"/>
						<form:input class="form-control" path="lastName"/>
					</div>
					<div class="form-group">
						<form:label path="email">Email:</form:label>
						<form:errors path="email"/>
						<form:input class="form-control" path="email"/>
					</div>
					<div class="form-group">
						<form:label path="password">Password:</form:label>
						<form:errors path="password"/>
						<form:input class="form-control" path="password"/>
					</div>
					<div class="form-group">
						<form:label path = "confirmPassword">Confirm Password:</form:label>
						<form:errors path="confirmPassword"/>
						<form:input class="form-control" path="confirmPassword"/>
					</div>
					<div class="d-flex justify-content-center">
						<input class="btn btn-danger" type="submit" value="Submit"/>
					</div>
				</form:form>
				<br>
				<div>
					<a href="/">Already have an account? Click here to Log in</a>
				</div>
				<br>
		</div>
		<div class="col"></div>
	</div>
</body>
</html>