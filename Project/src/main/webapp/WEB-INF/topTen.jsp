<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<a href="/dashboard">Dashboard</a>
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
            <td><c:out value="${topTen.rating}"/> <a href="/${topTen.id}"><c:out value="${topTen.title}"/></a>
                <c:out value="${song.artist}"></c:out></td>
        </tr>
    </c:forEach>
    </tbody>
</table>