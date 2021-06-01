<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- <link href="/css/style.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>


	<div class="container">
				<br>
				  <ul class="nav justify-content-end">
				    <li class="nav-item">
				      <a class="nav-link" href="/dashboard">Home</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="/logout">Logout</a>
				    </li>
				  </ul>
				  <br>
	<%--@elvariable id="lookify" type="java"--%>
			<form:form action="/newForm" method="post" modelAttribute="lookify" >

			    <p>
			        <form:label path="title">Title</form:label>
			        <form:errors path="title"></form:errors>
			        <form:input path="title"></form:input>
			    </p>

			    <p>
			        <form:label path="artist">Artist</form:label>
			        <form:errors path="artist"></form:errors>
			        <form:input path="artist"></form:input>
			    </p>
			
			    <p>
			        <form:label path="rating">Rating</form:label>
			        <form:errors path="rating"></form:errors>
			        <form:input type="number" path="rating"></form:input>
			    </p>
			
			
			    <input type="submit" class="btn btn-info" value="Add Song">
			
			</form:form>
	</div>
</body>
</html>