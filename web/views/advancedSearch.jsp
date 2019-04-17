<%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/12/2018
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../resourcrs/js/custom.js"></script>
<script type="text/javascript">
    $('#grupnameforSearch').change(function () {
        var groupNameId = $('#grupnameforSearch').val();
        getStudentSearchComboList(groupNameId);
    });
    $('#searchBtn').click(function () {
        var groupNameId = $('#grupnameforSearch').val();
        var studentId = $('#studentforSearch').val();
        getStudentByAdvancedSearch(groupNameId,studentId);
    })
</script>
<div><select id="grupnameforSearch" class="inputField" placeholder="Group Name" style="width: 100%; margin-top: 20%"></select></div>
<div><select id="studentforSearch" class="inputField" placeholder="Student" style="width: 100%; margin-top: 15%"></select></div>

<input id="searchBtn" type="button" , value="Search" class="menuBtn"  style="height: 30px; margin-top: 30%;"/>