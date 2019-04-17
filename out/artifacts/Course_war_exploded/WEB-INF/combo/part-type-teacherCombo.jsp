<%@ page import="az.model.Type" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/20/2018
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<option value="-1">Choose Type</option>--%>
<%--<c:forEach var="type" items="${types}">--%>
    <%--<option value="${type.id}">--%>
            <%--${type.type}--%>
    <%--</option>--%>
<%--</c:forEach>--%>

<%List<Type> types = (List<Type>) request.getAttribute("type");%>

<option value="-1">Choose Type</option>
<%for (Type type : types) {%>

<option value="<%= type.getId()%>">
    <%= type.getType()%>
</option>
<%}%>