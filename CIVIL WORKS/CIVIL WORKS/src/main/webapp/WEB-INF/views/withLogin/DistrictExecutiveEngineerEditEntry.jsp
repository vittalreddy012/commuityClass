<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Civil Works</title>

<!-- CSS -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400|Roboto:300,400,500">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery-2.1.4.min.js"></script>
<script src="resources/js/datepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/datepicker.css" />
<style>
.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: 700 !important;
	font-size: 12px !important;
}

.form-control {
	font-size: 13px !important;
}
</style>

<script type="text/javascript">
	$('#dateOfAgreement').datepicker({
    changeMonth: true,
    changeYear: true,
		yearRange: "-10:+10",
    showButtonPanel: true,
    dateFormat: "dd-mm-yy",
    oreintation: "top",
    autoHide: true
		
});
	$('#dateOfCompletionWork').datepicker({
	    changeMonth: true,
	    changeYear: true,
			yearRange: "-10:+10",
	    showButtonPanel: true,
	    dateFormat: "dd-mm-yy",
	    oreintation: "top",
	    autoHide: true
			
	});
	$('#siteHandedOverDate').datepicker({
	    changeMonth: true,
	    changeYear: true,
			yearRange: "-10:+10",
	    showButtonPanel: true,
	    dateFormat: "dd-mm-yy",
	    oreintation: "top",
	    autoHide: true
			
	});
</script>
<script>
 	function getPhotosListAjax(stageOfWork, stateid,year,month,filename) {
 		
 		var paraData = "stageOfWork=" + stageOfWork + "&stateid="+ stateid +"&year="+year +"&month="+month +"&filename="+filename ;
 		$.ajax({
 			type : "GET",
 			url : "getAjaxListPhotoByFileName",
 			data : paraData,
 			success : function(response) {
 	 			var img= response.split('~~');
 	 			var image0=img[0];
 	 			$("#image0").attr("src","data:image/jpg;base64,"+image0);
 	 		},
 			error : function(e) {
 				// alert('Error: ' + e);
 			}
 		});
 	}
     </script>
<style>
div#datepickers-container {
	z-index: 11111111 !important;
}
</style>
<style>
.datepicker-container.datepicker-dropdown.datepicker-top-left {
	z-index: 11111111 !important;
}
</style>
<script>
 $(function() {
  $('#dateOfAgreement,#dateOfCompletionWork,#siteHandedOverDate').keydown(function (e) {
	   if (e.shiftKey || e.ctrlKey || e.altKey) {
	     e.preventDefault();
	    } else {
	      var key = e.keyCode;
	      if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
	       e.preventDefault();
	      }
 }
	  });
	});  
 </script>
<script>
function showUploads(){
	if($("#stagework").val()=="0") 
		$(".upload").hide();
	else
		$(".upload").show();
}

function onlyNumbers(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
      }
     return true;
}

function onPaymentSubmitDetails(){
     var returnval= confirm("Are You Sure to Delete the Payment Details.");
     if(returnval){
        document.forms[1].action = "deleteDistrictExecutiveEngineerEntry";
  		document.forms[1].submit();
      }else{
     return false;
	 } 
}

function onSubmitDetails() {
	var doa=new Date($("#dateOfAgreement").val());
	var doc=new Date($("#dateOfCompletionWork").val());

    if ($("#ecv").val() == "") {
		alert("Please Enter ECV Number");
		$("#ecv").focus();
		return false;
	}
	else if ($("#tenderDiscount").val()=="") {
		alert("Please Enter Tender Discount");
		$("#tenderDiscount").focus();
		return false;
	}
	else if ($("#tcv").val()=="") {
		alert("Please Enter TCV");
		$("#tcv").focus();
		return false;
	}
	else if ($("#dateOfAgreement").val() == "") {
		alert("Please Enter Date Of Agreement");
		$("#dateOfAgreement").focus();
		return false;
	}
else if ($("#dateOfCompletionWork").val() == "") {
		alert("Please Enter Time of Completion as per agreement");
		$("#dateOfCompletionWork").focus();
		return false;
	} 
else if (doc < doa ) {
	alert(" Time Of Completion Work Should be Greater then or equal to Date of Agreement");
	$("#dateOfCompletionWork").val("");
	$("#dateOfCompletionWork").focus();
	return false;
} 
else if ($("#siteHandedOverDate").val() == "") {
		alert("Please Enter Site Handed over Date/Site Grounded Date");
		$("#siteHandedOverDate").focus();
		return false;
	}
	     
	 var checkedBoxes = [];   
     var tentativeDateForCompletion="";
     var stageofworkorg="";
     var expenditureMadeTillDate="";
     var flooorWiseRemarks="";
     var delayReasons="";
     var year        ="";
     var month       ="";

     var r = false;
     var chkbox = document.getElementsByName('checkid');
        if(chkbox.length>0){
             for (var i = 0, n = chkbox.length; i < n; i++) {
        if (chkbox [i].checked)
           {
                 checkedBoxes.push(chkbox [i].value);
                  if (($("#tentativeDateForCompletion" + chkbox[i].value).val() == null || $("#tentativeDateForCompletion" + chkbox[i].value).val() == '')) {
                     alert("Please Enter  Tentative Date For Completion");
                     $("#tentativeDateForCompletion" + chkbox[i].value).focus();
                     return false;
                 } 
                 else if (($("#flooorWiseRemarks" + chkbox[i].value).val() == null || $("#flooorWiseRemarks" + chkbox[i].value).val() == '')) {
                     alert("Please Enter Floor Wise Remarks");
                     $("#flooorWiseRemarks" + chkbox[i].value).focus();
                     return false;
                 }
                 else if (($("#delayReasons" + chkbox[i].value).val() == null || $("#delayReasons" + chkbox[i].value).val() == '')) {
                     alert("Please Enter Reasons For Delay");
                     $("#delayReasons" + chkbox[i].value).focus();
                     return false;
                 }
                  else {
                      tentativeDateForCompletion = tentativeDateForCompletion + $("#tentativeDateForCompletion" + chkbox[i].value).val() + "~";
                	  stageofworkorg=stageofworkorg+ $("#stagework" + chkbox[i].value).val() + "~";
                      flooorWiseRemarks=flooorWiseRemarks+$("#flooorWiseRemarks" + chkbox[i].value).val() + "~";
                	  delayReasons=delayReasons+$("#delayReasons" + chkbox[i].value).val() + "~";
                	  year=year+$("#year" + chkbox[i].value).val() + "~";
                	  month=month+$("#month" + chkbox[i].value).val() + "~";
                	  r = true;
                 }
             }
           }
            if(r==false){
                 alert("please select at least one checkk box");
               } 
        }else{
    	    tentativeDateForCompletion="12-12-2012~";
    		stageofworkorg="0~";
    		flooorWiseRemarks="0~";
    		delayReasons
    		year="0~";
    		month="0~";
       		r=true;
           }
        if (r) {
           var returnval= confirm("Please Confirm to update the Details..");
          
           if(returnval==true){ 
        $("#checkedBoxesupdate").val(checkedBoxes);
        $("#tentativeDateForCompletionupdate").val(tentativeDateForCompletion.substring(0,tentativeDateForCompletion.length-1));
        $("#stageofworkoriginal").val(stageofworkorg);
        $("#flooorWiseRemarksupdate").val(flooorWiseRemarks);
        $("#delayReasonsupdate").val(delayReasons);
        $("#yearorginal").val(year);
        $("#monthoriginal").val(month);

        document.forms[1].action = "UpdateDistrictExecutiveEngineerEntry";
  		document.forms[1].submit();
            }else{
              return false;
               } 
         } else {
        	 return false;
         }
}
 
</script>

<style>
body {
	padding: 0 !important;
}
</style>
</head>
<body>
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">District Executive
							Engineer Entry Form</legend>
						<form 	method="POST" enctype="multipart/form-data">
						<div class="control-group">
							<div class="row">
								<c:if test="${msg!=null && msg!=''}">
								<h4 style="color: red; text-align: center" id="successMessage">${msg}</h4>
								<br/>
								</c:if>
								<!-- action="UpdateDistrictExecutiveEngineerEntry" -->
								
									<input type="hidden" name="checkedBoxesupdate"
										id="checkedBoxesupdate"> <input type="hidden"
										name="tentativeDateForCompletionupdate"
										id="tentativeDateForCompletionupdate"> <input
										type="hidden" name="uploadOneupdate" id="uploadOneupdate">
									<input type="hidden" name="flooorWiseRemarksupdate"
										id="flooorWiseRemarksupdate"> <input type="hidden"
										name="delayReasonsupdate" id="delayReasonsupdate">

									<input type="hidden" name="yearorginal" id="yearorginal">
									<input type="hidden" name="monthoriginal" id="monthoriginal">
									<input type="hidden" name="stageofworkoriginal"	id="stageofworkoriginal"> 
									<input type="hidden" name="distExecEngId" id="distExecEngId" value="${stateid}" />
									<input type="hidden" name="intervention" id="intervention"
										value="${intervention}" /> <input type="hidden"
										name="component" id="component" value="${component}" />

									<div class="row" style="margin: 0;">
										<!--  First Entry Screen -->
										<c:if test="${interventionfromdb !='KGBV'}">
											<input type="hidden" name="ecv" value="${ecv}" id="ecv"
												value="0" />
											<input type="hidden" name="tenderDiscount"
												value="${tenderDiscount}" id="tenderDiscount" />
											<input type="hidden" name="tcv" id="tcv" value="${tcv}"
												value="0" />
										</c:if>
										<c:if test="${interventionfromdb =='KGBV'}">
											<div class="form-group col-xs-12 col-sm-4">
												<label for="ecv">ECV:</label> <input type="text" name="ecv"
													id="ecv" class="form-control" maxlength="10" value="${ecv}"
													onkeypress="return onlyNumbers(event);" placeholder="ECV"
													autocomplete="off" />
											</div>
											<div class="form-group col-xs-12 col-sm-4">
												<label for="tenderDiscount">Tender Discount:</label> <input
													type="text" name="tenderDiscount" id="tenderDiscount"
													class="form-control" maxlength="10"
													value="${tenderDiscount}"
													onkeypress="return onlyNumbers(event);"
													placeholder="Tender Discount" autocomplete="off" />
											</div>
											<div class="form-group col-xs-12 col-sm-4">
												<label for="tcv">TCV:</label> <input type="text" name="tcv"
													id="tcv" class="form-control" maxlength="10" value="${tcv}"
													onkeypress="return onlyNumbers(event);" placeholder="TCV"
													autocomplete="off" />
											</div>
										</c:if>
									</div>
									<div class="row" style="margin: 0;">
										<div class="form-group col-xs-12 col-sm-4">
											<label for="dateOfAgreement">Date Of Agreement:</label> <input
												type="text" data-toggle="datepicker" name="dateOfAgreement"
												id="dateOfAgreement" onkeypress="return onlyNumbers(event);"
												value="${dateOfAgreement}" class="form-control"
												placeholder="Date Of Agreement" autocomplete="off" />
										</div>

										<div class="form-group col-xs-12 col-sm-4">
											<label for="dateOfCompletionWork"> Time of Completion
												as per agreement : </label> <input type="text"
												data-toggle="datepicker" name="dateOfCompletionWork"
												id="dateOfCompletionWork"
												onkeypress="return onlyNumbers(event);"
												class="datepicker-here form-control"
												value="${dateOfCompletionWork}"
												placeholder="Time Of Completion as per agreement"
												autocomplete="off" />

										</div>
										<div class="form-group col-xs-12 col-sm-4">
											<label for="siteHandedOverDate">Site Handed over
												Date/Site Grounded Date :</label> <input type="text"
												data-toggle="datepicker" name="siteHandedOverDate"
												id="siteHandedOverDate"
												onkeypress="return onlyNumbers(event);"
												class="datepicker-here form-control"
												value="${siteHandedOverDate}"
												placeholder="Site Handed over date" autocomplete="off" />
										</div>
									</div>
									<!-- End First Entry Screen -->

									<!-- Second Entry Screen -->
                                    <c:if test="${SecondEntryData!=null && SecondEntryData!=''}">
									<br/>
										<c:set var="i" value="0"></c:set>
										<c:set var="swid" value="00"></c:set>
										<c:set var="swid2" value="01"></c:set>
										<div class="row myownrow">
											<div class="col">
												<div class="tabs">
													<c:forEach items="${SecondEntryData}" var="list">
													<c:if test="${list.stageOfworkId!=swid2}">
											  </div>
											</div>
											<c:set var="swid2" value="${list.stageOfworkId}"></c:set>
									</c:if> 
									<c:if test="${list.stageOfworkId!=swid}">
										<%-- <h5 style="color: #fff; font-weight: 500; padding: 7px 10px; margin-bottom: 15px; border-radius: 20px; text-align: center; background-color: #f79400;">${list.stageOfwork}</h5>
										 --%>			
										<div class="tab">
											<input class="myown" type="checkbox" id="chck${list.stageOfworkId}"> <label
												class="tab-label" for="chck${list.stageOfworkId}">${list.stageOfwork}</label>
											<div class="tab-content">
											<c:set var="swid" value="${list.stageOfworkId}"></c:set>
									</c:if>
									<input type="hidden" name="uploadOneoriginal"
										id="uploadOneorg${i}" value="${list.uploadOne}"> <input
										type="hidden" name="uploadTwooriginal" id="uploadTwoorg${i}"
										value="${list.uploadTwo}"> <input type="hidden"
										name="uploadThreeoriginal" id="uploadThreeorg${i}"
										value="${list.uploadThree}"> <input type="hidden"
										name="uploadFouroriginal" id="uploadFourorg${i}"
										value="${list.uploadFour}"> <input type=hidden
										name="stageOfwork" id="stagework${i}" class="form-control"
										value="${list.stageOfworkId}" />
									<div class="row">
										<table class="owntable">
											<tr>
												<td>
													<div class="form-group">
														<input type="checkbox" class="checkbox"
															style="display: block; margin: auto; margin-top: 25px;"
															name="checkid" id="checkid${i}" value="${i}">
													</div>
												</td>

												<td>

													<div class="form-group">
														<label for="tentativeDateForCompletion">Tentative
															Date of Completion</label> <input type="text"
															name="tentativeDateForCompletion"
															id="tentativeDateForCompletion${i}"
															class="form-control mydatepicker"
															data-toggle="datepicker"
															value="${list.tentativeDateForCompletion}"
															placeholder="Tentative date for completion"
															autocomplete="off"
															onkeypress="return onlyNumbers(event);" />
													</div>

												</td>

												<td>


													<div class="form-group">
														<label for="month">Month</label> <input type=text
															name="month" id="month${i}" class="form-control"
															value="${list.month}" readonly />
													</div>


												</td>


												<td>

													<div class="form-group">
														<label for="year">Year</label> <input type=text
															name="year" id="year${i}" class="form-control"
															value="${list.year}" readonly />
													</div>

												</td>



												<td>

													<div class="form-group">
														<label for="upload1">Upload Photo</label><span
															style="color: red; font-size: 12px;">(MAX 5MB)</span> <input
															type=file name="uploadOne" id="uploadOne${i}"
															class="form-control"
															onchange="ValidateSize(this,'uploadOne')" /> <a
															class="advisor" id="loginClick"
															onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}','${list.uploadOne}');"
															href="#popup1" style="font-size: 13px;">View Image</a>
													</div>

												</td>
												<td>
													<div class="form-group">
														<label for="upload2">Upload Photo</label><span
															style="color: red; font-size: 12px;">(MAX 5MB)</span> <input
															type=file name="uploadTwo" id="uploadTwo${i}"
															class="form-control" accept="image/x-png,image/jpeg"
															onchange="ValidateSize(this,'uploadTwo')" /> <a
															class="advisor" id="loginClick"
															onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}','${list.uploadTwo}');"
															href="#popup1" style="font-size: 13px;">View Image</a>
													</div>
												</td>
												<td>
													<div class="form-group">
														<label for="upload3">Upload Photo</label><span
															style="color: red; font-size: 12px;">(MAX 5MB)</span> <input
															type=file name="uploadThree" id="uploadThree${i}"
															class="form-control" accept="image/x-png,image/jpeg"
															onchange="ValidateSize(this,'uploadThree')" /> <a
															class="advisor" id="loginClick"
															onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}','${list.uploadThree}');"
															href="#popup1" style="font-size: 13px;">View Image</a>
													</div>
												</td>
											</tr>



											<tr>


												<td></td>

												<td>

													<div class="form-group">
														<label for="upload4">Upload Photo</label><span
															style="color: red; font-size: 12px;">(MAX 5MB)</span> <input
															type=file name="uploadFour" id="uploadFour${i}"
															class="form-control" accept="image/x-png,image/jpeg"
															onchange="ValidateSize(this,'uploadFour')" /> <a
															class="advisor" id="loginClick"
															onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}','${list.uploadFour}');"
															href="#popup1" style="font-size: 13px;">View Image</a>
													</div>

												</td>

												<td colspan="2">
													<div class="form-group">
														<label for="expenditureMadeTillDate">Current Month
															Expenditure </label> <input type="text"
															value="${list.expenditureMadeTillDate}"
															name="expenditureMadeTillDate"
															id="expenditureMadeTillDate${i}" readonly maxlength="10"
															onkeypress="return onlyNumbers(event);"
															autocomplete="off" class="form-control"
															placeholder="Expenditure made till Date"
															onchange="return balanceCalculation(this)" />
													</div>
												</td>


												<td>

													<div class="form-group">
														<label for="stackedFirstName">Floor Wise Remarks</label> <input
															type=text name="flooorWiseRemarks"
															id="flooorWiseRemarks${i}"
															value="${list.floorwiseremarks}" class="form-control"
															autocomplete="off" />
													</div>

												</td>



												<td>

													<div class="form-group">
														<label for="district"> Reasons for Delay</label> <input
															type="text" name="delayReasons" id="delayReasons${i}"
															value="${list.delayreasons}" class="form-control"
															placeholder="Delay reasons" autocomplete="off" />
													</div>

												</td>

											</tr>



										</table>

										<c:set var="i" value="${i+1}"></c:set>
									</div>

									</c:forEach>
						 	</div>
						</div>
				</div> 
				
			</div>
		</div>
		
		</c:if>
		</form>
		<!--End Second Entry Screen -->

		<div class="row" align="center">
			<div>
				<button class="btn btn-primary"
					style="text-align: center; margin-top: 35px;"
					onclick="return onSubmitDetails();">Update</button>
				 <c:if test="${SecondEntryData!=null && SecondEntryData!=''}">
				<button class="btn btn-primary"
					style="text-align: center; margin-top: 35px;"
					onclick="return onPaymentSubmitDetails();">Edit Payment Details</button>
					</c:if>
			</div>
		</div>
	</div>
	
	</div>
	</fieldset>
	</div>
	</div>

	
	<!-- View Photo popup -->
	<div id="popup1" class="overlay">
		<div class="popup">
			<h4
				style="color: #fff; font-weight: 500; padding: 10px 10px; margin-bottom: 15px;
	/* border-radius: 20px; */ text-align: center; background-color: #f79400; width: 132%; display: block; position: relative; top: -50px; left: -40px; border-top-left-radius: 5px; border-top-right-radius: 5px;">
				View Photo <a class="close"
					style="position: absolute; top: 5px !important; right: 10px; transition: all 200ms; font-size: 30px; font-weight: bold; text-decoration: none; color: #000; display: block;"
					href="#">&times;</a>
			</h4>
			<div class="content">
				<div>
					<div>
						<div>
							<div media="slider" style="text-align: center;">
								<img id="image0" width="200" height="200" src="" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End of  View Photo popup -->

	</div>
	</div>
	<script>
    $(function() {
      $('[data-toggle="datepicker"]').datepicker({
        autoHide: true,
        zIndex: 2048,
      });
    });
  </script>
   <style>
.myown {
	position: absolute;
	opacity: 0;
	z-index: -1;
}

.row.myownrow {
	display: -webkit-box;
	display: flex;
}

.row.myownrow .col {
	-webkit-box-flex: 1;
	flex: 1;
}

.row.myownrow .col:last-child {
	margin-left: 1em;
}

/* Accordion styles */
.tabs {
	border-radius: 8px;
	overflow: hidden;
	/* box-shadow: 0 4px 4px -2px rgba(0, 0, 0, 0.5); */
}

.row.myownrow .tab {
	width: 99%;
	color: white;
	overflow: hidden;
}

label.tab-label {
	color: white;
}

.row.myownrow .tab-label {
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 1em;
	background: #f79400;
	font-weight: bold;
	cursor: pointer;
	/* Icon */
}

.row.myownrow .tab-label:hover {
	background: #b56c00;
}

.tab-label::after {
	content: "\276F";
	width: 1em;
	height: 1em;
	text-align: center;
	-webkit-transition: all .35s;
	transition: all .35s;
}

.row.myownrow .tab-content {
	max-height: 0;
	padding: 0 1em;
	color: #2c3e50;
	background: white;
	-webkit-transition: all .35s;
	transition: all .35s;
}

.row.myownrow .tab-close {
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: end;
	justify-content: flex-end;
	padding: 1em;
	font-size: 0.75em;
	background: #2c3e50;
	cursor: pointer;
}

.row.myownrow .tab-close:hover {
	background: #b56c00;
}

.row.myownrow .myown:checked+.tab-label {
	background: #b56c00;
}

.row.myownrow .myown:checked+.tab-label::after {
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.row.myownrow .myown:checked ~ .tab-content {
	max-height: 300vh;
	padding: 1em;
	display:block;
}

.tab-content .col-md-1, .tab-content .col-md-3 {
	display: flex !important;
	float: none !important;
}

.owntable td {
	padding: 5px 10px;
}
</style>
 
	<style>
.box {
	width: 40%;
	margin: 0 auto;
	background: rgba(255, 255, 255, 0.2);
	padding: 35px;
	border: 2px solid #fff;
	border-radius: 20px/50px;
	background-clip: padding-box;
	text-align: center;
}

span#customHTMLFooter {
	display: none;
}

.panel-default>.panel-heading {
	color: #fff;
	background-color: #f79400;
	border-color: #f79400;
}

.button {
	font-size: 1em;
	padding: 10px;
	color: #fff;
	border: 2px solid #06D85F;
	border-radius: 20px/50px;
	text-decoration: none;
	cursor: pointer;
	transition: all 0.3s ease-out;
}

.button:hover {
	background: #06D85F;
}

.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 111;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	margin: 100px auto;
	padding: 40px;
	background: #fff;
	border-radius: 5px;
	width: 28%;
	position: relative;
	transition: all 5s ease-in-out;
}

.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}

.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.popup .close:hover {
	color: #06D85F;
}

.popup .content {
	max-height: 30%;
	overflow: auto;
}

@media screen and (max-width: 700px) {
	.box {
		width: 80%;
	}
	.popup {
		width: 80%;
	}
}
</style>
</body>
</html>



