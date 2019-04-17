<%@ page import="java.util.List" %>
<%@ page import="az.model.Student" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 11/23/2018
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--<%List<Student> students = (List<Student>) request.getAttribute("students");%>--%>
<script type="text/javascript">
    $(function () {
        $('#studentTable').DataTable();
    });
</script>

<table id="studentTable" class="display" style="width:100%">
    <thead>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Parent</th>
        <th>Birthdate</th>
        <th>Phone</th>
        <th>Gmail</th>
        <th>Gmail Code</th>
        <th>Gender</th>
        <th>Sector</th>
        <th>Edit</th>
    </tr>
    </thead>
    <tbody>
    <%--<%for (Student student : students){%>--%>
    <c:forEach var = "student" items="${students}">
        <tr>
            <%--<td><%= student.getName()%></td>--%>
            <td>${student.name}</td>
            <td>${student.surname}</td>
            <td>${student.parent}</td>
            <td>${student.birthdate}</td>
            <td>${student.phone}</td>
            <td>${student.gmail}</td>
            <td>${student.gmailCode}</td>
            <td>${student.gender}</td>
            <td>${student.sectorName}</td>
            <td><a href="javascript: getStudent(${student.id});">Update</a></td>
        </tr>
    </c:forEach>

    <%--<%}%>--%>
    </tbody>
    <tfoot>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Parent</th>
        <th>Birthdate</th>
        <th>Phone</th>
        <th>Gmail</th>
        <th>Gmail Code</th>
        <th>Gender</th>
        <th>Sector</th>
        <th>Edit</th>
    </tr>
    </tfoot>
</table>