<%--
  Created by IntelliJ IDEA.
  User: SS.555
  Date: 11/30/2018
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $( "#student-tabs" ).tabs({
        collapsible: true
    });
</script>
<fieldset class="fieldset">
    <%--<form action="controller?action=studentRegister" method="post">--%>
    <%--<div class="generalButtons">--%>
    <%--<br>--%>
    <%--</div>--%>
    <%--</form>--%>
        <div id="student-tabs" style="width: 413px;">
            <ul>
                <li><a href="#tabs-1">Şəxsi məlumatlar</a></li>
                <li><a href="#tabs-2">İstifadəçi məlumatları</a></li>
            </ul>
            <div id="tabs-1">
                <div class="textField">Name:</div>
                <input id="name" type="text" name="name" title="Name" class="inputField"/>
                <div class="textField">Surname:</div>
                <input id="surname" type="text" name="surname" title="Surname" class="inputField"/>
                <div class="textField">Parent:</div>
                <input id="parent" type="text" name="parent" title="Parent" class="inputField"/>
                <div class="textField">Birthdate:</div>
                <input id="datepickerForStudent" type="text" title="Birthdate" name="birthdate" class="inputField"/>
                <div class="textField">Phone:</div>
                <input id="phone" type="text" name="phone" title="Phone" class="inputField"/>
            </div>
            <div id="tabs-2">
                <div class="textField">Gmail:</div>
                <input id="gmail" type="text" name="gmail" title="Gmail" class="inputField"/>
                <div class="textField">Gmail Code:</div>
                <input id="gmailCode" type="text" name="gmailCode" title="Gmail Code" class="inputField"/>
                <div class="textField">Sector:</div>
                <select id="sectorAddStudent" class="inputField" placeholder="Choose Sector"></select>
                <div class="gender">
                    <input id="MaleAddStudent" type="radio" value="Male" name="genderAddStudent"/>
                    <label for="MaleAddStudent"> Male </label>
                    <input id="FemaleAddStudent" type="radio" value="Female" name="genderAddStudent"/>
                    <label for="FemaleAddStudent"> Female</label> <br>
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
                    <%--<input id="sector" type="select" name="sector" placeholder="Choose Sector" list="sectorId" class="inputField"/>--%>
                    <%--<datalist id="sectorId" value="Sector" style="width: 172px">--%>
                    <%--&lt;%&ndash;<option value="AZ" class="inputField"></option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<option value="EN" class="inputField"></option>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<option value="RU" class="inputField"></option>&ndash;%&gt;--%>
                    <%--</datalist>--%>
                    <input id="saveStudent" type="button" value="Save Student" class="saveBtn"/>
                </div>
            </div>
        </div>
</fieldset>