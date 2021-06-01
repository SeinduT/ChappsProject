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
				      <a class="nav-link" href="/logout">Logout</a>
				    </li>
				  </ul>
		<table class="table">
		<nav class="navbar navbar-expand-sm bg-light justify-content-left">
  			<ul class="navbar-nav">
    			<li class="nav-item">
      			<a class="nav-link" href="/new">Add New</a>
    			</li>
    			<li class="nav-item">
      			<a class="nav-link" href="/search/topTen">topSongs</a>
    			</li>
  			</ul>
		</nav>
		<nav class="navbar navbar-expand-sm bg-light navbar-dark">
  			<form class="form-inline" action="/song/search" method="get">
    			<input class="form-control mc-sm-2" type="text" placeholder="Search Artists" name="artist">
    			<button class="btn btn-success" type="submit" value="Search Artists">Search</form>
		</nav>
		
<%-- 		    <form action="/song/search" method="get">
		        <input type="text" name="artist">
		        <input type="submit" value="Search Artists">
		    </form> --%>
		
		    <thead>
		    <tr>
		        <th>Name</th>
		        <th>Rating</th>
		        <th>Action</th>
		    </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${songList}" var="song">
		
		        <tr>
		            <td><a href="/${song.id}"><c:out value="${song.title}"/></a></td>
		            <td><c:out value="${song.rating}"/></td>
		            <td><a href="/delete/${song.id}">delete</a></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>