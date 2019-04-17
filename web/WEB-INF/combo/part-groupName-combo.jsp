<%@ page import="java.util.List" %>
<%@ page import="az.model.GroupName" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/12/2018
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%List<GroupName> groupNames = (List<GroupName>) request.getAttribute("groupNames");%>--%>

<option value="-1">Group Name</option>
<%--<%for (GroupName groupName : groupNames) {%>--%>
<C:forEach var="groupName" items="${groupNames}">
    <option value="${groupName.id}">
        ${groupName.groupName}
            <%--<%= groupName.getGroupName()%>--%>
    </option>
</C:forEach>

<%--<%}%>--%>

