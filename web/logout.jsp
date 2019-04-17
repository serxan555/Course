<%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/20/2018
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getSession().invalidate();
    request.getSession().removeAttribute("user");
    response.sendRedirect(request.getContextPath()+"/login.jsp");
%>