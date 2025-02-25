
function getUploadedDetails(teacherId) {
    document.forms[0].teacherId.value = teacherId;
    document.forms[0].mode.value = "downloadDetailsoutside";
    document.forms[0].submit();
    //document.statenftform.action = "./stateNftwFormHome.do?mode=downloadDetailsoutside&Rowid=" + Rowid;
    //document.statenftform.submit();
}

function marksPdf(schoolCode, treasuryId, status) {
    document.forms[0].schoolId.value = schoolCode;
    document.forms[0].treasuryId.value = treasuryId;
    document.forms[0].type.value = status;
    document.forms[0].mode.value = "marksPdf";
    document.forms[0].submit();
    return false;
}
function viewPdf(teacherId, schoolCode, type) {
    document.forms[0].schoolId.value = schoolCode;
    document.forms[0].teacherId.value = teacherId;
    document.forms[0].type.value = type;
    //document.forms[0].mode.value = "viewPdf";
    document.forms[0].mode.value = "getPdfDetails";
    document.forms[0].submit();
    return false;
}

function printPdf(teacherId, schoolCode, type) {
    document.forms[0].schoolId.value = schoolCode;
    document.forms[0].teacherId.value = teacherId;
    document.forms[0].setAttribute("target", "_blank");
    document.forms[0].type.value = type;
    document.forms[0].mode.value = "printPdf";
    document.forms[0].submit();
    return false;
}

function onlyNumbers(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode === 46)
        return false;
    else if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
}

function textCounter(field, cntfield, maxlimit) {
    if (field.value.length > maxlimit) {  // if too long...trim it!
        field.value = field.value.substring(0, maxlimit);
        // otherwise, update 'characters left' counter
    }
    else {
        cntfield.value = maxlimit - field.value.length;
    }

}

function textCounter1(field, cntfield, maxlimit) {
    if (field.value.length > maxlimit) {  // if too long...trim it!
        field.value = field.value.substring(0, maxlimit);
        // otherwise, update 'characters left' counter
    }
    else {
        cntfield.value = maxlimit - field.value.length;
    }

}

$(document).ready(function() {
    $('input, :input').bind("cut copy paste", function(e) {
        alert("Cut copy paste not allowed here");
        e.preventDefault();
    });
    
    var input11 = document.querySelector('#teacher_Qualification1');
    input11.addEventListener('input', function()
    {
        var teacher_Qualification = input11.value;
        if (teacher_Qualification === "")
            teacher_Qualification = "0";

        if (teacher_Qualification === "" || teacher_Qualification === undefined) {
            alert("Enter Qualification");
            $("#teacher_Qualification1").val('');
            teacher_Qualification = "0";
            $("#teacher_Qualification1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Qualification) > 2) {
            alert("Entered qualification must be less than or equal to 2");
            $("#teacher_Qualification1").val('');
            teacher_Qualification = "0";
            $("#teacher_Qualification1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        $('#totalMarks').val("");
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }

    });
    var input12 = document.querySelector('#teacher_LengthOfService1');
    input12.addEventListener('input', function()
    {
        var teacher_LengthOfService = input12.value;
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";

        if (teacher_LengthOfService === "" || teacher_LengthOfService === undefined) {
            alert("Enter Length of Service");
            $("#teacher_LengthOfService1").val('');
            teacher_LengthOfService = "0";
            $("#teacher_LengthOfService1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_LengthOfService) > 5) {
            alert("Entered Length of Service must be less than or equal to 5");
            $("#teacher_LengthOfService1").val('');
            teacher_LengthOfService = "0";
            $("#teacher_LengthOfService1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });

    var input13 = document.querySelector('#teacher_Percentage1');
    input13.addEventListener('input', function()
    {
        var teacher_Percentage = input13.value;
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        if (teacher_Percentage === "" || teacher_Percentage === undefined) {
            alert("Enter Percentage of passes in the subjects taught");
            $("#teacher_Percentage1").val('');
            teacher_Percentage = "0";
            $("#teacher_Percentage1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Percentage) > 20) {
            alert("Entered Percentage of passes in the subjects taught must be less than or equal to 20");
            $("#teacher_Percentage1").val('');
            teacher_Percentage = "0";
            $("#teacher_Percentage1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }

        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input14 = document.querySelector('#teacher_Participation1');
    input14.addEventListener('input', function()
    {
        var teacher_Participation = input14.value;
        if (teacher_Participation === "")
            teacher_Participation = "0";
        if (teacher_Participation === "" || teacher_Participation === undefined) {
            alert("Enter Participation of the Teacher in the activates of Parent-Teacher Association");
            $("#teacher_Participation1").val('');
            teacher_Participation = "0";
            $("#teacher_Participation1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Participation) > 2) {
            alert("Entered Participation of the teacher in the activates of Parent-Teacher Association must be less than or equal to 2");
            $("#teacher_Participation1").val('');
            teacher_Participation = "0";
            $("#teacher_Participation1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });

    var input15 = document.querySelector('#teacher_SpecialWork1');
    input15.addEventListener('input', function() {

        var teacher_SpecialWork = input15.value;
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        if (teacher_SpecialWork === "" || teacher_SpecialWork === undefined) {
            alert("Enter Special Work Done For Raising the Standard of Education");
            $("#teacher_SpecialWork1").val('');
            teacher_SpecialWork = "0";
            $("#teacher_SpecialWork1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_SpecialWork) > 5) {
            alert("Entered Special Work Done For Raising the Standard of Education must be less than or equal to 5");
            $("#teacher_SpecialWork1").val('');
            teacher_SpecialWork = "0";
            $("#teacher_SpecialWork1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    
    var input21 = document.querySelector('#teacher_Activates1');
    input21.addEventListener('input', function()
    {
        var teacher_Activates = input21.value;
        if (teacher_Activates === "")
            teacher_Activates = "0";
        if (teacher_Activates === "" || teacher_Activates === undefined) {
            alert("Enter Activates Undertaken For Strengthening National Integration");
            $("#teacher_Activates1").val('');
            teacher_Activates = "0";
            $("#teacher_Activates1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Activates) > 6) {
            alert("Entered Activates Undertaken For Strengthening National Integration must be less than or equal to 6");
            $("#teacher_Activates1").val('');
            teacher_Activates = "0";
            $("#teacher_Activates1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input22 = document.querySelector('#teacher_Includings1');
    input22.addEventListener('input', function()
    {
        var teacher_Includings = input22.value;
        if (teacher_Includings === "")
            teacher_Includings = "0";
        if (teacher_Includings === "" || teacher_Includings === undefined) {
            alert("Enter Including Interest in Co-Curricular and Extra-curricular Activates Among-Students");
            $("#teacher_Includings1").val('');
            teacher_Includings = "0";
            $("#teacher_Includings1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Includings) > 20) {
            alert("Entered Including Interest in Co-Curricular and Extra-curricular Activates Among-Students must be less than or equal to 20");
            $("#teacher_Includings1").val('');
            teacher_Includings = "0";
            $("#teacher_Includings1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input23 = document.querySelector('#teacher_ContributionForPhysicals1');
    input23.addEventListener('input', function()
    {
        var teacher_ContributionForPhysicals = input23.value;
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        if (teacher_ContributionForPhysicals === "" || teacher_ContributionForPhysicals === undefined) {
            alert("Enter Contribution of the Teacher for Physical Development of the School");
            $("#teacher_ContributionForPhysicals1").val('');
            teacher_ContributionForPhysicals = "0";
            $("#teacher_ContributionForPhysicals1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_ContributionForPhysicals) > 6) {
            alert("Entered Contribution of the Teacher for Physical Development of the School must be less than or equal to 6");
            $("#teacher_ContributionForPhysicals1").val('');
            teacher_ContributionForPhysicals = "0";
            $("#teacher_ContributionForPhysicals1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input24 = document.querySelector('#teacher_ContributionForDevelopment1');
    input24.addEventListener('input', function()
    {
        var teacher_ContributionForDevelopment = input24.value;
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        if (teacher_ContributionForDevelopment === "" || teacher_ContributionForDevelopment === undefined) {
            alert("Enter Contribution of the Teacher for Development of Students Educational Standards");
            $("#teacher_ContributionForDevelopment1").val('');
            teacher_ContributionForDevelopment = "0";
            $("#teacher_ContributionForDevelopment1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_ContributionForDevelopment) > 2) {
            alert("Entered Contribution of the Teacher for Development of Students Educational Standards must be less than or equal to 2");
            $("#teacher_ContributionForDevelopment1").val('');
            teacher_ContributionForDevelopment = "0";
            $("#teacher_ContributionForDevelopment1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }

        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input25 = document.querySelector('#teacher_ContributionForPromotings1');
    input25.addEventListener('input', function()
    {
        var teacher_ContributionForPromotings = input25.value;
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        if (teacher_ContributionForPromotings === "" || teacher_ContributionForPromotings === undefined) {
            alert("Enter Contribution of the Teacher for Promoting Literacy in General");
            $("#teacher_ContributionForPromotings1").val('');
            teacher_ContributionForPromotings = "0";
            $("#teacher_ContributionForPromotings1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_ContributionForPromotings) > 5) {
            alert("Entered Contribution of the Teacher for Promoting Literacy in General must be less than or equal to 5");
            $("#teacher_ContributionForPromotings1").val('');
            teacher_ContributionForPromotings = "0";
            $("#teacher_ContributionForPromotings1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    
    var input31 = document.querySelector('#teacher_Interest1');
    input31.addEventListener('input', function()
    {
        var teacher_Interest = input31.value;
        if (teacher_Interest === "")
            teacher_Interest = "0";
        if (teacher_Interest === "" || teacher_Interest === undefined) {
            alert("Enter Interest in Helping the Gifted/Handicapped/Mentally Retarded and Backward Students");
            $("#teacher_Interest1").val('');
            teacher_Interest = "0";
            $("#teacher_Interest1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Interest) > 5) {
            alert("Entered Interest in Helping the Gifted/Handicapped/Mentally Retarded and Backward Students must be less than or equal to 5");
            $("#teacher_Interest1").val('');
            teacher_Interest = "0";
            $("#teacher_Interest1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input32 = document.querySelector('#teacher_Educational1');
    input32.addEventListener('input', function()
    {
        var teacher_Educational = input32.value;
        if (teacher_Educational === "")
            teacher_Educational = "0";
        if (teacher_Educational === "" || teacher_Educational === undefined) {
            alert("Enter Educational Innovative Writings useful to the Students");
            $("#teacher_Educational1").val('');
            teacher_Educational = "0";
            $("#teacher_Educational1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Educational) > 11) {
            alert("Entered Educational Innovative Writings useful to the Students must be less than or equal to 11");
            $("#teacher_Educational1").val('');
            teacher_Educational = "0";
            $("#teacher_Educational1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    
    var input33 = document.querySelector('#teacher_AwardsReceived1');
    input33.addEventListener('input', function()
    {
        var teacher_AwardsReceived = input33.value;
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        if (teacher_AwardsReceived === "" || teacher_AwardsReceived === undefined) {
            alert("Enter Awards Received Previously");
            $("#teacher_AwardsReceived1").val('');
            teacher_AwardsReceived = "0";
            $("#teacher_AwardsReceived1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_AwardsReceived) > 2) {
            alert("Entered Awards Received Previously must be less than or equal to 2");
            $("#teacher_AwardsReceived1").val('');
            teacher_AwardsReceived = "0";
            $("#teacher_AwardsReceived1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }
        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input34 = document.querySelector('#teacher_Relationship1');
    input34.addEventListener('input', function()
    {
        var teacher_Relationship = input34.value;
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        if (teacher_Relationship === "" || teacher_Relationship === undefined) {
            alert("Enter Relationship with (Students,Teacher,Parents) ");
            $("#teacher_Relationship1").val('');
            teacher_Relationship = "0";
            $("#teacher_Relationship1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_Relationship) > 6) {
            alert("Entered Relationship with (Students,Teacher,Parents) must be less than or equal to 6");
            $("#teacher_Relationship1").val('');
            teacher_Relationship = "0";
            $("#teacher_Relationship1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }

        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });
    var input35 = document.querySelector('#teacher_AnyOtherAchievements1');
    input35.addEventListener('input', function()
    {
        var teacher_AnyOtherAchievements = input35.value;
        if (teacher_AnyOtherAchievements === "")
            teacher_AnyOtherAchievements = "0";
        if (teacher_AnyOtherAchievements === "" || teacher_AnyOtherAchievements === undefined) {
            alert("Enter Any Other Achievements not mentioned above all");
            $("#teacher_AnyOtherAchievements1").val('');
            teacher_AnyOtherAchievements = "0";
            $("#teacher_AnyOtherAchievements1").focus().css({'border': '1px solid red'});
        } else if (parseInt(teacher_AnyOtherAchievements) > 3) {
            alert("Entered Any Other Achievements not mentioned above all must be less than or equal to 3");
            $("#teacher_AnyOtherAchievements1").val('');
            teacher_AnyOtherAchievements = "0";
            $("#teacher_AnyOtherAchievements1").focus().css({'border': '1px solid red'});
        } else {
            true;
        }

        var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
        if (teacher_LengthOfService === "")
            teacher_LengthOfService = "0";
        var teacher_Qualification = $("#teacher_Qualification1").val();
        if (teacher_Qualification === "")
            teacher_Qualification = "0";
        var teacher_Percentage = $("#teacher_Percentage1").val();
        if (teacher_Percentage === "")
            teacher_Percentage = "0";
        var teacher_Participation = $("#teacher_Participation1").val();
        if (teacher_Participation === "")
            teacher_Participation = "0";
        var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
        if (teacher_SpecialWork === "")
            teacher_SpecialWork = "0";
        var teacher_Activates = $("#teacher_Activates1").val();
        if (teacher_Activates === "")
            teacher_Activates = "0";
        var teacher_Includings = $("#teacher_Includings1").val();
        if (teacher_Includings === "")
            teacher_Includings = "0";
        var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
        if (teacher_ContributionForPhysicals === "")
            teacher_ContributionForPhysicals = "0";
        var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
        if (teacher_ContributionForDevelopment === "")
            teacher_ContributionForDevelopment = "0";
        var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
        if (teacher_ContributionForPromotings === "")
            teacher_ContributionForPromotings = "0";
        var teacher_Interest = $("#teacher_Interest1").val();
        if (teacher_Interest === "")
            teacher_Interest = "0";
        var teacher_Educational = $("#teacher_Educational1").val();
        if (teacher_Educational === "")
            teacher_Educational = "0";
        var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
        if (teacher_AwardsReceived === "")
            teacher_AwardsReceived = "0";
        var teacher_Relationship = $("#teacher_Relationship1").val();
        if (teacher_Relationship === "")
            teacher_Relationship = "0";
        var interaction = $("#interaction1").val();
        if (interaction === "" || interaction === undefined)
            interaction = "0";
        var totalMarks = parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements) + parseInt(interaction);
        if (!isNaN(totalMarks)) {
            $('#totalMarks').val(totalMarks);
        } else {
            $('#totalMarks').val("");
        }
    });

    var input36 = document.querySelector('#interaction1');
    if (input36 !== null) {
        input36.addEventListener('input', function()
        {
            var interaction = input36.value;
            if (interaction === "" || interaction === undefined)
                interaction = "0";
            if (interaction === "" || interaction === undefined) {
                alert("Enter Interaction/Interview");
                $("#interaction1").val('');
                interaction = "0";
                $("#interaction1").focus().css({'border': '1px solid red'});
            } else if (parseInt(interaction) > 10) {
                alert("Entered Interaction/Interview must be less than or equal to 10");
                $("#interaction1").val('');
                interaction = "0";
                $("#interaction1").focus().css({'border': '1px solid red'});
            } else {
                true;
            }

            var teacher_LengthOfService = $("#teacher_LengthOfService1").val();
            if (teacher_LengthOfService === "")
                teacher_LengthOfService = "0";
            var teacher_Percentage = $("#teacher_Percentage1").val();
            if (teacher_Percentage === "")
                teacher_Percentage = "0";
            var teacher_Qualification = $("#teacher_Qualification1").val();
            if (teacher_Qualification === "")
                teacher_Qualification = "0";
            var teacher_Participation = $("#teacher_Participation1").val();
            if (teacher_Participation === "")
                teacher_Participation = "0";
            var teacher_SpecialWork = $("#teacher_SpecialWork1").val();
            if (teacher_SpecialWork === "")
                teacher_SpecialWork = "0";
            var teacher_Activates = $("#teacher_Activates1").val();
            if (teacher_Activates === "")
                teacher_Activates = "0";
            var teacher_Includings = $("#teacher_Includings1").val();
            if (teacher_Includings === "")
                teacher_Includings = "0";
            var teacher_ContributionForPhysicals = $("#teacher_ContributionForPhysicals1").val();
            if (teacher_ContributionForPhysicals === "")
                teacher_ContributionForPhysicals = "0";
            var teacher_ContributionForDevelopment = $("#teacher_ContributionForDevelopment1").val();
            if (teacher_ContributionForDevelopment === "")
                teacher_ContributionForDevelopment = "0";
            var teacher_ContributionForPromotings = $("#teacher_ContributionForPromotings1").val();
            if (teacher_ContributionForPromotings === "")
                teacher_ContributionForPromotings = "0";
            var teacher_Interest = $("#teacher_Interest1").val();
            if (teacher_Interest === "")
                teacher_Interest = "0";
            var teacher_Educational = $("#teacher_Educational1").val();
            if (teacher_Educational === "")
                teacher_Educational = "0";
            var teacher_AwardsReceived = $("#teacher_AwardsReceived1").val();
            if (teacher_AwardsReceived === "")
                teacher_AwardsReceived = "0";
            var teacher_Relationship = $("#teacher_Relationship1").val();
            if (teacher_Relationship === "")
                teacher_Relationship = "0";
            var teacher_AnyOtherAchievements = $("#teacher_AnyOtherAchievements1").val();
            if (teacher_AnyOtherAchievements === "")
                teacher_AnyOtherAchievements = "0";

            var totalMarks = parseInt(interaction) + parseInt(teacher_Qualification) + parseInt(teacher_LengthOfService) + parseInt(teacher_Percentage) + parseInt(teacher_Participation) + parseInt(teacher_SpecialWork) + parseInt(teacher_Activates) + parseInt(teacher_Includings) + parseInt(teacher_ContributionForPhysicals) + parseInt(teacher_ContributionForDevelopment) + parseInt(teacher_ContributionForPromotings) + parseInt(teacher_Interest) + parseInt(teacher_Educational) + parseInt(teacher_AwardsReceived) + parseInt(teacher_Relationship) + parseInt(teacher_AnyOtherAchievements);
            if (!isNaN(totalMarks)) {
                $('#totalMarks').val(totalMarks);
            } else {
                $('#totalMarks').val("");
            }
        });
    }
});