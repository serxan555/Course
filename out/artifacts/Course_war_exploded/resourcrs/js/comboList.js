function getSectorComboList() {
    $.ajax({
        url: 'controller?action=getSectorComboList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#sectorAddStudent').html(data);
        }
    })
}
function getSelectedSectorComboList(sectorId) {
    $.ajax({
        url: 'controller?action=getSectorComboList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#sectorforUpdate').html(data);
            $('#sectorforUpdate').val(sectorId);
        }
    })
}
function getGrupNameComboList() {
    $.ajax({
        url: 'controller?action=getGrupNameComboList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#groupname').html(data);
        }
    })
}
function getSelectedGrupNameComboList(groupNameId) {
    $.ajax({
        url: 'controller?action=getGrupNameComboList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#groupname').html(data);
            $('#groupname').val(groupNameId);
        }
    })
}
function getGrupNameSearchComboList() {
    $.ajax({
        url: 'controller?action=getGrupNameComboList',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#grupnameforSearch').html(data);
        }
    })
}
function getStudentSearchComboList(groupNameId) {
    $.ajax({
        url: 'controller?action=getStudentSearchComboList',
        type: 'get',
        dataType: 'html',
        data: 'groupNameId='+groupNameId,
        success: function (data) {
            $('#studentforSearch').html(data);
        }
    })
}
function getTypeUser() {
    $.ajax({
        url: 'controller?action=getTypeUser',
        type: 'get',
        dataType: 'html',
        success: function (data) {
            $('#typeAddUser').html(data);
        }
    })
}