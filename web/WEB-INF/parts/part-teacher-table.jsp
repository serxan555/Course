<%@ page import="az.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 11/27/2018
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%--<%List<User> users = (List<User>) request.getAttribute("users");%>--%>
<script type="text/javascript">
    $(function () {
        $('#teacherTable').DataTable();
    });
</script>

<table id="teacherTable" class="display" style="width:100%">
    <thead>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Username</th>
        <th>Birthdate</th>
        <th>Email</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <%--<%for (User user : users){%>--%>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.name}</td>
            <td>${user.surname}</td>
            <td>${user.username}</td>
            <td>${user.birthdate}</td>
            <td>${user.email}</td>
            <td>${user.status}</td>
        </tr>
    </c:forEach>
    <%--<%}%>--%>
    </tbody>
    <tfoot>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Username</th>
        <th>Birthdate</th>
        <th>Email</th>
        <th>Status</th>
    </tr>
    </tfoot>
</table>