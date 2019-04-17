function addStudent() {
    var name = $('#name').val();
    var surname = $('#surname').val();
    var parent = $('#parent').val();
    var birthdate = $('#datepickerForStudent').val();
    var phone = $('#phone').val();
    var gmail = $('#gmail').val();
    var gmailCode = $('#gmailCode').val();
    var sector = $('#sectorAddStudent').val();
    var gender = $("input[name='genderAddStudent']:checked").val();
    // console.log(gender);
    // var action = $("input[name='action']:checked").val();
    // var langs =[];
    // $("input[name='language']:checked").each(function () {
    //     langs.push(this.value);
    // });
    ////////////////////////////////
    // var data = {
    //     name:name,
    //
    // }
    /////////////////////////////
    $.ajax({
        url: 'controller?action=studentRegister',
        type: 'post',
        dataType: 'text',
        data: 'name=' + name + '&surname=' + surname + '&parent=' + parent + '&birthdate=' + birthdate + '&phone=' + phone + '&gmail=' + gmail + '&gmailCode=' + gmailCode + '&sector=' + sector + '&genderAddStudent=' + gender,

        success: function (data) {
            getStudentList();
            alert('Success Added');
        },
        error: function (data) {
            alert('Unsuccess');
        }
    })
}

function addTeacher() {
    var name = $('#nameforUser').val();
    var surname = $('#surnameforUser').val();
    var username = $('#username').val();
    var password = $('#password').val();
    var email = $('#emailforUser').val();
    var datepickerForTeacher = $('#datepickerForTeacher').val();
    var typeUser = $('#typeAddUser').val();

    $.ajax({
        url: 'controller?action=teacherRegister',
        type: 'post',
        dataType: 'text',
        data: 'name=' + name + '&surname=' + surname + '&username=' + username + '&password=' + password + '&email=' + email + '&datepickerForTeacher=' + datepickerForTeacher + '&typeUser=' + typeUser,
        success: function (data) {
            getTeacherList();
            alert('Teacher Added');
        },
        error: function (data) {
            alert('Unsuccess');
        }
    })
}

function getStudentList() {
    $.ajax({
        url: 'controller?action=getStudentList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#studentTablePanel').html(data);
        }
    })
}

function getTeacherList() {
    $.ajax({
        url: 'controller?action=getTeacherList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#teacherTablePanel').html(data);
        }
    })
}

function menuStudentsBtn() {
    $('#studentTablePanel').show();
    $('#teacherTablePanel').hide();
    $('#addStudentPanel').hide();
}

function menuTeachersBtn() {
    $('#studentTablePanel').hide();
    $('#teacherTablePanel').show();
    $('#addStudentPanel').hide();
}

function addStudentPanel() {
    datepickers();
    $('#studentTablePanel').hide();
    $('#teacherTablePanel').hide();
    $('#addStudentPanel').show();
    $('#saveStudent').click(function () {
        console.log("men isledim")
        addStudent();
        clearStudentImputs();
        // getStudentList();
    });
}

function addTeacherDialog() {
    $("#addTeacherDialog").dialog({
        // autoOpen: false,
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "Save": function () {
                checkExistUser();
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });
    $("#datepickerForTeacher").datepicker({
        changeMonth: true,
        changeYear: true
    });
    // $( "#addTeacherDialog" ).dialog('open');
}

function editStudentDialog() {
    $("#editStudentDialog").dialog({
        // autoOpen: false,
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "Delete": function () {
                deleteStudent();

                $(this).dialog("close");
            },
            "Update": function () {
                updateStudent();

                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });
    // $( "#addTeacherDialog" ).dialog('open');
}

function datepickers() {
    $("#datepickerForStudent").datepicker({
        changeMonth: true,
        changeYear: true
    });
}

function clearStudentImputs() {
    $("input[id=name], textarea").val("");
    $("input[id=surname], textarea").val("");
    $("input[id=parent], textarea").val("");
    $('#datepickerForStudent').datepicker().val('');
    $("input[id=phone], textarea").val("");
    $("input[id=gmail], textarea").val("");
    $("input[id=gmailCode], textarea").val("");
    $("select[id=sector], select").val("-1");
    $('#MaleAddStudent').prop('checked', false);
    $('#FemaleAddStudent').prop('checked', false);
}

var globalStudentId;

function getStudent(studentId) {
    globalStudentId = studentId;
    $.ajax({
        url: 'controller?action=getStudent',
        type: 'get',
        data: 'studentId=' + studentId,
        dataType: 'html',
        success: function (data) {
            editStudentDialog();
            $('#editStudentDialog').html(data);
            $('#editStudentDialog').dialog('open');
        }
    })
}

function updateStudent() {
    var name = $('#nameforUpdate').val();
    var surname = $('#surnameforUpdate').val();
    var parent = $('#parentforUpdate').val();
    var birthdate = $('#datepickerForUpdate').val();
    var phone = $('#phoneforUpdate').val();
    var gmail = $('#gmailforUpdate').val();
    var gmailCode = $('#gmailCodeforUpdate').val();
    var sector = $('#sectorforUpdate').val();
    var groupName = $('#groupname').val();
    var gender = $("input[name='gender']:checked").val();
    console.log(name + " " + surname);
    $.ajax({
        url: 'controller?action=updateStudent',
        type: 'post',
        dataType: 'text',
        data: 'nameforUpdate=' + name + '&surnameforUpdate=' + surname + '&parentforUpdate=' + parent + '&birthdate=' + birthdate + '&phoneforUpdate=' + phone + '&gmailforUpdate=' + gmail + '&gmailCodeforUpdate=' + gmailCode + '&sector=' + sector + '&groupname=' + groupName + '&gender=' + gender + '&studentId=' + globalStudentId,

        success: function (data) {
            alert('Success Update');
            getStudentList();
        },
        error: function (data) {
            alert('Unsuccess Update');
        }
    })
}

function deleteStudent() {
    $.ajax({
        url: 'controller?action=deleteStudent',
        type: 'post',
        dataType: 'text',
        data: 'studentId=' + globalStudentId,
        success: function (data) {
            getStudentList();
        },
        error: function (data) {
            alert('Unsuccess');
        }
    })
}

function accardion() {
    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };
    $("#accordion").accordion({
        collapsible: true,
        active: false,
        icons: icons
    });
    $('#advancedSearch').load('views/advancedSearch.jsp', function () {
        getGrupNameSearchComboList();
        getStudentSearchComboList(-1);
    });
}
function getStudentByAdvancedSearch(groupNameId, studentId) {
    $.ajax({
        url: 'controller?action=getStudentByAdvancedSearch',
        type: 'get',
        dataType: 'html',
        data: 'groupNameId='+groupNameId+'&studentId='+studentId,
        success: function (data) {
            $('#studentTablePanel').html(data);
        }
    })
}
function checkExistUser() {
    var username = $('#username').val();
    $.ajax({
        url: 'controller?action=checkExistUser',
        type: 'get',
        dataType: 'html',
        data: 'username='+username,
        success: function (data) {
            $('#existsUsernameSpan').html(data);
            var exists = $('#existsUsername').val();
            console.log(exists);
            if (exists === 'false'){
                alert('Username already exists!');
                addTeacherDialog();
            }  else {
                addTeacher();
                $("#addTeacherDialog").dialog("close");
            }
        }
    })
}