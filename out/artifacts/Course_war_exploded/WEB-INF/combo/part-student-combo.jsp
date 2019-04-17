<%@ page import="az.model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/13/2018
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--<%List<Student> students = (List<Student>) request.getAttribute("studentCombo");%>--%>

<%--<option value="-1">Students</option>--%>
<%--<%for (Student student : students) {%>--%>
<%--<option value="<%= student.getId()%>">--%>
    <%--<%= student.getName() + " "%><%=student.getSurname()%>--%>
<%--</option>--%>
<%--<%}%>--%>

<option value="-1">Students</option>
<c:forEach var="student" items="${studentCombo}">

    <option value="${student.id}">
            ${student.name} ${student.surname}
    </option>
</c:forEach>

<%--jstl ile iwlemedi--%>