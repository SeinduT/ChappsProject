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
</head>
<body>
<div class="container">
	<h1>Welcome, ${user.firstName} ${user.lastName}</h1>
		<ul class="nav justify-content-end">
			<li class="nav-item">
				<a class="nav-link" href="/dashboard">Home</a>
			</li>
			<li class="nav-item">
				 <a class="nav-link" href="/logout">Logout</a>
			</li>
		</ul>
		<table class="table">
		    <thead>
		    <tr>
		        <th>Title</th>
		        <th>Artist</th>
		        <th>Rating (1-10)</th>
		    </tr>
		    </thead>
		    <tbody>
<%-- 		    <c:forEach items="${songList}" var="song"> --%>
		        <tr>
		            <td><a href="/${song.id}"><c:out value="${song.title}"/></a></td>
		            <td><c:out value="${song.artist}"/></td>
		            <td><c:out value="${song.rating}"/></td>
		        </tr>
<%-- 		    </c:forEach> --%>
		    </tbody>
		</table>
<%-- 		<p>Title: <c:out value="${song.title}"></c:out></p>
		<p>Artist: <c:out value="${song.artist}"></c:out></p>
		<p>Rating (1-10): <c:out value="${song.rating}"></c:out></p>
		<p><a href="/delete/${id}">Delete</a></p> --%>
</div>
</body>
</html>