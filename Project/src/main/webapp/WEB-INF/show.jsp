<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<link rel="stylesheet" href="style.css">

<p><a href="/dashboard">Dashboard</a></p>

<html>

<p>Title: <c:out value="${song.title}"></c:out></p>
<p>Artist: <c:out value="${song.artist}"></c:out></p>
<p>Rating (1-10): <c:out value="${song.rating}"></c:out></p>
<p><a href="/delete/${id}">Delete</a></p>


</html>