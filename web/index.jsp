<%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 11/19/2018
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SS.555</title>

    <link rel="stylesheet" type="text/css" href="resourcrs/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="resourcrs/css/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="resourcrs/css/style.css"/>
    <script type="text/javascript" src="resourcrs/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="resourcrs/js/custom.js"></script>
    <script type="text/javascript" src="resourcrs/js/comboList.js"></script>
    <script type="text/javascript" src="resourcrs/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="resourcrs/js/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            getStudentList();
            getTeacherList();
            accardion();
            history.pushState(null, null, "index.jsp");
            window.addEventListener("popstate", function (ev) {
                history.pushState(null, null, "index.jsp");
            });
            var globalBtnId = "menuStudentsBtn";
            $('.menuBtn').click(function () {
                if ($(this).attr("id") != 'menuAddBtn') {
                    globalBtnId = $(this).attr("id");
                }
            });
            $('#menuAddBtn').click(function () {
                switch (globalBtnId) {
                    case 'menuStudentsBtn':
                        $("#addStudentPanel").load('views/addStudentInputs.jsp', function () {
                            getSectorComboList();
                            addStudentPanel();
                        });
                        break;
                    case 'menuTeachersBtn' :
                        $('#addTeacherDialog').load('views/add-inputs.jsp', function () {
                            addTeacherDialog();
                            getTypeUser();
                        });
                        break;
                }
            });
            $('#menuStudentsBtn').click(function () {
                menuStudentsBtn();
            });
            $('#menuTeachersBtn').click(function () {
                menuTeachersBtn();
            });
        });
    </script>
</head>
<body style="background-color: #9F9F9F;">
<div id="container" class="container">
    <div id="header" class="header">
        <h1 style="margin-bottom:0;"><em>Welcome ${sessionScope.get("user").username}</em></h1>
        <a href="logout.jsp"><img class="logout-img" src="resourcrs/images/logout.png"></a>
    </div>
    <div id="menu" class="menu">
        <div id="accordion">
            <h3>Genaral</h3>
            <div style="height: 200px">
                <input id="menuStudentsBtn" type="button" , value="Students" class="menuBtn"/>
                <input id="menuTeachersBtn" type="button" , value="Teachers" class="menuBtn"/>
                <c:if test="${sessionScope.get('user').typeId == 1}">
                    <input id="menuAddBtn" type="button" , value="Add" class="menuBtn"/>
                </c:if>
            </div>
            <h3>Search</h3>
            <div id="advancedSearch">

            </div>
        </div>
    </div>
    <div id="general" class="general">
        <div id="studentTablePanel"></div>
        <div id="teacherTablePanel" style="display: none"></div>
        <div id="addStudentPanel" style="display: none"></div>
        <div id="addTeacherDialog" style="display: none"></div>
        <div id="editStudentDialog" style="display: none"></div>
    </div>
    <span style="display: none" id="existsUsernameSpan"></span>
    <div id="footer" class="footer">Copyright © SS.555</div>
</div>
</body>
</html>
