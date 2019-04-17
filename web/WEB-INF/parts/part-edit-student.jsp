<%@ page import="az.model.Student" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 12/6/2018
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student) request.getAttribute("student");
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
%>
<%--<script type="text/javascript" src="resourcrs/js/custom.js"></script>--%>
<script>
    $(function () {
        $("#datepickerForUpdate").datepicker({
            changeMonth: true,
            changeYear: true
        });
        getGrupNameComboList();
        getSelectedSectorComboList(<%= student.getSectorId()%>);
        getSelectedGrupNameComboList(<%= student.getGroupNameId()%>);
        <%if ("Male".equalsIgnoreCase(student.getGender())){%>
        document.getElementById("Male").checked = true;
        <%} else{%>
        document.getElementById("Female").checked = true;
        <%}%>
        <%--getSelectedGender(<%= student.getGender()%>);--%>
    });
</script>

<%--<fieldset class="fieldset">--%>
<%--<form action="controller?action=studentRegister" method="post">--%>
<div class="textField">Name:</div>
<input id="nameforUpdate" type="text" name="name" title="Name" class="inputField" value="<%= student.getName()%>"/>
<div class="textField">Surname:</div>
<input id="surnameforUpdate" type="text" name="surname" title="Surname" class="inputField"
       value="<%= student.getSurname()%>"/>
<div class="textField">Parent:</div>
<input id="parentforUpdate" type="text" name="parent" title="Parent" class="inputField"
       value="<%= student.getParent()%>"/>
<div class="textField">Birthdate:</div>
<input id="datepickerForUpdate" type="text" title="Birthdate" name="birthdate" class="inputField"
       value="<%= dateFormat.format(student.getBirthdate())%>"/>
<div class="textField">Phone:</div>
<input id="phoneforUpdate" type="text" name="phone" title="Phone" class="inputField" value="<%= student.getPhone()%>"/>
<div class="textField">Gmail:</div>
<input id="gmailforUpdate" type="text" name="gmail" title="Gmail" class="inputField" value="<%= student.getGmail()%>"/>
<div class="textField">Gmail Code:</div>
<input id="gmailCodeforUpdate" type="text" name="gmailCode" title="Gmail Code" class="inputField"
       value="<%= student.getGmailCode()%>"/>
<div class="textField">Sector:</div>
<select id="sectorforUpdate" class="inputField" placeholder="Choose Sector" style="width: 54%"></select>
<div class="textField">Group Name:</div>
<select id="groupname" class="inputField" placeholder="Group Name" style="width: 54%"></select>
<%--<input id="sector" type="select" name="sector" placeholder="Choose Sector" list="sectorId" class="inputField"/>--%>
<%--<datalist id="sectorId" value="Sector" style="width: 172px">--%>
<%--&lt;%&ndash;<option value="AZ" class="inputField"></option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="EN" class="inputField"></option>&ndash;%&gt;--%>
<%--&lt;%&ndash;<option value="RU" class="inputField"></option>&ndash;%&gt;--%>
<%--</datalist>--%>
<div class="gender">
    <input id="Male" type="radio" value="Male" name="gender"/>
    <label for="Male"> Male </label>
    <input id="Female" type="radio" value="Female" name="gender"/>
    <label for="Female"> Female</label> <br>
    <%--<div style="margin-top: 10px">--%>
    <%--<label for="az">Az:</label>--%>
    <%--<input id="az" type="checkbox" name="language" value="Az" class="language">--%>
    <%--<label for="en">En:</label>--%>
    <%--<input id="en" type="checkbox" name="language" value="En" class="language">--%>
    <%--<label for="ru">Ru:</label>--%>
    <%--<input id="ru" type="checkbox" name="language" value="Ru" class="language">--%>
    <%--</div>--%>
    <%--<br>--%>
    <%--<div>--%>
    <%--<textarea id="address" rows="3" cols="22" name="address"--%>
    <%--class="inputField"></textarea>--%>
    <%--</div>--%>
</div>

<%--<input id="saveStudent" type="button" value="Save Student" class="saveBtn"/>--%>
<%--<div class="generalButtons">--%>


<%--<br>--%>

<%--</div>--%>
<%--</form>--%>
<%--</fieldset>--%>