/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function getPersonalDeatailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "PersonalDetails";
    document.employeeISForm.submit();

//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=PersonalDetails&OldUser=OldUser";
//    document.employeeISForm.submit();
}


function educationDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "saveEducationalDetails";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=saveEducationalDetails&OldUser=OldUser";
//    document.employeeISForm.submit();
}


function appointmentDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "saveProfessionalDetailsNew";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=saveProfessionalDetailsNew&OldUser=OldUser";
//    document.employeeISForm.submit();
}



function transferDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "saveTransferDetails";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=saveTransferDetails&OldUser=OldUser";
//    document.employeeISForm.submit();
}

function healthCardDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "saveHealthCardDetails";
    document.employeeISForm.submit();

//document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=saveHealthCardDetails&OldUser=OldUser";
//                document.employeeISForm.submit();
}





function promotionDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "savePromotionalDetails";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=savePromotionalDetails&OldUser=OldUser";
//    document.employeeISForm.submit();
}

function departmentTestDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "saveDepartmentTestDetails";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=saveDepartmentTestDetails&OldUser=OldUser";
//    document.employeeISForm.submit();
}

function finalConfirmationDEO() {
    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=finalConfirmation&section=TeacherStatus";
    document.employeeISForm.submit();

}
function getSpouseDetailsDEO() {

    document.employeeISForm.oldUser.value = "OldUser";
    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "SavespouseDetails";
    document.employeeISForm.submit();
//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=SavespouseDetails&OldUser=OldUser";
//    document.employeeISForm.submit();

}

function printDetailsDEO() {

    document.employeeISForm.action = "employeeISOTPDEOEdit.do";
    document.employeeISForm.mode.value = "getPrintDetails";
    document.employeeISForm.submit();

//    document.employeeISForm.action = "./employeeISOTPDEOEdit.do?mode=getPrintDetails";
//    document.employeeISForm.submit();

}

function getPersonalDeatails() {

// document.employeeISForm.oldUser.value = "OldUser";
// document.employeeISForm.action = "employeeISOTP.do";
// document.employeeISForm.mode.value = "PersonalDetails";
//  document.employeeISForm.submit();
    document.employeeISForm.action = "./employeeISOTP.do?mode=PersonalDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}


function educationDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=saveEducationalDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}


function appointmentDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=saveProfessionalDetailsNew&OldUser=OldUser";
    document.employeeISForm.submit();
}



function transferDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=saveTransferDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}

function healthCardDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=saveHealthCardDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}




function promotionDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=savePromotionalDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}

function departmentTestDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=saveDepartmentTestDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}

function finalSubmit() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=finalConfirmation&section=TeacherStatus";
    document.employeeISForm.submit();

}
function getSpouseDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=SavespouseDetails&OldUser=OldUser";
    document.employeeISForm.submit();

}

function printDetails() {
    document.employeeISForm.action = "./employeeISOTP.do?mode=getPrintDetails";
    document.employeeISForm.submit();

}
function printDetails1() {
    document.employeeISForm.action = "./PrivateEmployeeISOTPDEOEdit.do?mode=getPrintDetails";
    document.employeeISForm.submit();

}
function getPrivatePersonalDeatailsDEO() {


    document.employeeISForm.action = "./PrivateEmployeeISOTPDEOEdit.do?mode=PersonalDetails&OldUser=OldUser";
    document.employeeISForm.submit();
}




function space(evt, thisvalue)
{
    var number = thisvalue.value;
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (number.length < 1) {
        if (evt.keyCode == 32) {
            return false;
        }
    }
    return true;
}
function ValidatePAN(Obj) {
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        if (ObjVal.search(panPat) == -1) {
            alert("Invalid Pan No");
            $("#panCard").val("")
            Obj.focus();
            return false;
        }
    }
}
    function CheckEmail(Obj)
    {
       
          var email = Obj.value;
        alert(email)
         if (Obj.value != "") {
        ObjVal = Obj.value;
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      
        if (reg.test(email) == false)
        {
            alert("Not a valid e-mail address!");
            document.forms[0].emailTeacher.value = "";
            document.forms[0].emailTeacher.focus();
            return false;
        }
    }
    
}