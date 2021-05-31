<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<p><a href="/dashboard">Dashboard</a> </p>
<html>
<%--@elvariable id="lookify" type="java"--%>
<form:form action="/newForm" method="post" modelAttribute="lookify">
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


    <input type="submit" value="Add Song">

</form:form>
</html>