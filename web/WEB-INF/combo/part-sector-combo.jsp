<%@ page import="java.util.List" %>
<%@ page import="az.model.Sector" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 11/30/2018
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--<%List<Sector> sectors = (List<Sector>) request.getAttribute("sectors");%>--%>

<option value="-1">Choose Sector</option>
<c:forEach var="sector" items="${sectors}">
    <option value="${sector.id}">
        ${sector.name}
    </option>
</c:forEach>


