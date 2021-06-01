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
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container">
<%-- 		<h1>Welcome, ${user.firstName} ${user.lastName}</h1> --%>
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
		<table class="table">
		    <p><a href="/dashboard"></a></p>
		
		    <thead>
			    <tr>
			        <th>Name</th>
			        <th>Rating</th>
			        <th>Action</th>
			    </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${topTen}" var="topTen">
		
		        <tr>
		            <td><a href="/${topTen.id}"><c:out value="${topTen.title}"/></a></td>
		            <td><c:out value="${topTen.rating}"/></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>
	</div>
</body>