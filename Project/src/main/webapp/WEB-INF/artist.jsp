<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<html>
<a href="/dashboard">Dashboard</a>
<p>Songs by artist: ${artist}
<form action="/song/search" method="get">
    <input type="text" name="artist">
    <input type="submit" value="New Search">
</form>
</p>

<table class="table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Rating</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${songs}" var="song">

        <tr>
            <td><a href="/${song.id}"><c:out value="${song.title}"/></a></td>
            <td><c:out value="${song.rating}"/></td>
            <td><a href="/delete/${song.id}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</html>