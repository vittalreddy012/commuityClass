<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="com.ts.model.DistrictExecutiveEngineerSecondEntry"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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


<!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="resources/js/css/datepicker.css" rel="stylesheet" type="text/css">
<script src="resources/js/jquery-2.1.0.min.js"></script>
<script src="resources/js/datepicker.js"></script>-->


	<!-- gallery -->
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="resources/css/jsgallery.css" type="text/css" media="screen" charset="utf-8">
	<script type="text/javascript" src="resources/js/jquery.jsgallery.min.js"></script>
	
	
<link rel="stylesheet" type="text/css" href="resources/js/datepicker/jquery-ui.css" />

<link rel="stylesheet"  href="resources/css/bootstrap.min.css">
<!-- <link href="datepicker.css" rel="stylesheet" type="text/css"> -->
<script src="resources/js/jquery-2.1.4.min.js"></script>
<script src="resources/js/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/datepicker.css" />

<!-- <script src="resources/js/datepicker/jquery.min.js"></script>
<script src="resources/js/datepicker/jquery-ui.min.js"></script> -->
<style>
.datepicker-container.datepicker-dropdown.datepicker-top-left {
    z-index: 11111111 !important;
}
</style>
<script type="text/javascript">
	$('#tentativeDateForCompletion').datepicker({
    changeMonth: true,
    changeYear: true,
		yearRange: "-10:+10",
    showButtonPanel: true,
    dateFormat: "dd-mm-yy",
        oreintation: "top",
        autoHide: true
		
});
	</script>

<style>
div#datepickers-container {
	
    z-index:11111111 !important;
}
</style>
 <script>
   $(function() {

  	  $('#tentativeDateForCompletion').keydown(function (e) {
  	  
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
 	function getPhotosListAjax(stageOfWork, stateid,year,month) {
 		
 		var paraData = "stageOfWork=" + stageOfWork + "&stateid="+ stateid +"&year="+year +"&month="+month ;
 		$.ajax({
 			type : "GET",
 			url : "getAjaxListPhotos",
 			async : false,
 			data : paraData,
 			success : function(response) {
 	 			var img= response.split('~~');
 	 			
 	 			var image0=img[0];
 	 			var image1= img[1]; 
 	 			var image2= img[2];
 	 			var image3= img[3];
 				$("#image0").attr("src","data:image/jpg;base64,"+image0);
 	 			$("#image1").attr("src","data:image/jpg;base64,"+image1);
 	 			$("#image2").attr("src","data:image/jpg;base64,"+image2);
 	 			$("#image3").attr("src","data:image/jpg;base64,"+image3);
 	 		},
 			error : function(e) {
 				// alert('Error: ' + e);
 			}
 		});
 	}


     </script>

 <script>
function showUploads(){
	if($("#stagework").val()=="00") 
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

/* function ValidateSize(file) {
    var FileSize = file.files[0].size / 1024 / 1024; // in MB
    if (FileSize > 5) {
        alert('File size exceeds 5 MB');
    } 
} */

function blockSpecialChar(e){
    var k;
    document.all ? k = e.keyCode : k = e.which;
    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
    }
    
function ValidateSize(src,id)
{
	
	var file = src.value;
   var sizefile = src.files[0];
 
    var len = file.length;
    var ext = file.slice(len - 3, len);
  
    if(ext.toUpperCase() != "JPG" && ext.toUpperCase() != "JPEG" && ext.toUpperCase() != "PNG"){
    	  alert("Only JPG/JPEG/PNG files allowed.");
    	  $("#"+id).val('');
        return false;
    }
   
    if ((Math.round((sizefile.size / 1048576) * 100) / 100) > 6 ||sizefile.size < 1024) {
        alert('This Image size should not exceeding 5 MB  ');
        $("#"+id).val('');
        return false;
    }
    else {
        return true;
    }
}

function yearMonthValidation(yearMonth){

	
	     var year = $("#year").val();
	     if(year=="00"){
	    	alert("Please Select Year");
	    	$("#year").focus();
	    		return false;
	    	}
		var month = $("#month").val();
		var yeararr =[];
		var montharr=[];
		var monthsdesc=['JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER'];
		var yearMonthListAferSpliting = yearMonth.split(",");
        
		for(var i=0;i<yearMonthListAferSpliting.length;i++){
			yeararr.push(yearMonthListAferSpliting[i+1]);
			montharr.push(yearMonthListAferSpliting[i+2]);
			i=i+2;
		}
       
         if(year<parseInt(yeararr[(yeararr.length)-1])){
 			alert("Please Select Year greater than or equal to "+yeararr[yeararr.length-1]);
 			$("#year").val("00");
 			$("#month").val("00");
 	    	$("#year").focus();
 	    	return false;
 			}
          else if((year==parseInt(yeararr[(yeararr.length)-1])) && (month<=parseInt(montharr[(montharr.length)-1]))){
            alert("Please Select Month greater than "+ monthsdesc[parseInt(montharr[(montharr.length)-1])-1]);
  			$("#month").val("00");
  	    	$("#month").focus();
  	    	return false;
  			} 
		
		return true;
	} 


function orderOfStages(stagelist){
//alert("=====stat==="+stagelist);
var enteredStageWork = $("#stagework").val();
//alert("=====enteredStageWork==="+enteredStageWork);
var year = $("#year").val();
if(year=="00"){
	alert("Please Select Year");
	$(".upload").hide();
	$("#year").focus();
	return false;
}
var month = $("#month").val();
if(month=="00"){
	alert("Please Select Month");
	$(".upload").hide();
	$("#month").focus();
	return false;
}
var stageListFromDb = stagelist;
var workid="";

var stageListAferSpliting = stageListFromDb.split(",");


//alert(workid);
//alert(stageListAferSpliting)
$("#uploadOne").val("");$("#uploadTwo").val("");$("#uploadThree").val("");$("#uploadFour").val("");
//$("#tentativeDateForCompletion").val("");$("#expenditureMadeTillDate").val("");
$("#flooorWiseRemarks").val("");$("#delayReasons").val("");
 
for(var i=0;i<stageListAferSpliting.length;i++){
	workid=workid+stageListAferSpliting[i]+",";
	if(stageListAferSpliting[i]==enteredStageWork && stageListAferSpliting[i+1]==year && stageListAferSpliting[i+2]==month){
		alert("This Stage of Work Already Done");
		$(".upload").hide();
		$("#stagework").val("00");
		
		return false
	}
	i=i+2
}
var splitworkid=(workid.substring(0,workid.length - 1)).split(",");
var maxstageData = parseInt(splitworkid[splitworkid.length-1])+1;
//var minstageData = parseInt(splitworkid[i]);
var selectionList = ['Ground Level','Below Basement level','Basement Level','Slab Laid','Brick work','Plastering','Flooring','Colouring','Plumbing & Electrification','Completed'];

if(maxstageData < parseInt(enteredStageWork)){
   
	alert("Please Select "+selectionList[maxstageData-1]+" Stage");
        
	$(".upload").hide();
	$("#stagework").val("00");
	return false
}
if(parseInt(enteredStageWork)<(maxstageData-1)){
	alert("This Stage of Work Already Done");
	$(".upload").hide();
	$("#stagework").val("00");
	return false
    }
	return true;
}

function downloadImageUpload(stagework,uploadOne){
	var stateid= $("#distExecEngId").val();
 	var stateOfWork = $("#stagework").val(stagework);
 
 	var uploadOne =$("#filedownload").val(uploadOne);
	document.forms[0].action="downloadImage"
	document.forms[0].submit();
	
}
function viewImageUpload(stagework){
	var stateid= $("#distExecEngId").val();
 	var stateOfWork = $("#stagework").val(stagework);
 	/* var uploadOne =$("#filedownload").val(uploadOne); */
	document.forms[0].action="viewImageUpload";
	document.forms[0].submit();
}

function balanceCalculation(){
	
	 var stagework = $("#stagework").val();
     
	   /* var openingBalance = $("#openingBalance").val()- $("#expenditureMadeTillDate").val(); */
	   var expenditureMadeTillPreviousMonth = $("#expenditureMadeTillPreviousMonth").val();
	   var expenditureMadeTillDate = $("#expenditureMadeTillDate").val();
	   var sumOfAmount = Number(expenditureMadeTillPreviousMonth) + Number(expenditureMadeTillDate);
	   var estimatedCost = $("#estimatedCost").val();
	   
	   var openingBalance = Number(estimatedCost) - Number(sumOfAmount);
	   alert(expenditureMadeTillDate);
		var balanceValue = document.getElementById('balenceExpenditureToBeMade');
		 balanceValue.value = openingBalance; 

		

}


function onSubmitDetails() {

	var expenditureMadeTillDate = $("#expenditureMadeTillDate").val();
	var openingBalance = $("#openingBalance").val();

	var expenditureMadeTillPreviousMonth = $("#expenditureMadeTillPreviousMonth").val();
	   var sumOfAmount = Number(expenditureMadeTillPreviousMonth) + Number(expenditureMadeTillDate);
	   
	   var estimatedCost = $("#estimatedCost").val();


	 if ($("#tentativeDateForCompletion").val() == "") {
		alert("Please Enter Tentative Date For Completion");
		$("#tentativeDateForCompletion").focus();
		return false;
	}

	 else if($("#year").val() =="00"){
			alert("Please Select Year ");
			$("#year").focus();
			return false;
		}
	else if($("#month").val() =="00" ){
			alert("Please Select Month ");
			$("#month").focus();
			return false;
		}
		

	else if( ($("#stagework").val()=="00")){
		alert("Please Select Stage of Work");
		$("#stagework").focus();
		return false;
	}
	else if(($("#stagework").val())!="00" && ($("#uploadOne").val()=="")){
		alert("Please Upload jpg or png Format Photo in Upload Photo One ");
		$("#uploadOne").focus();
		return false;
	}
	else if(($("#stagework").val()) !="00" && ($("#uploadTwo").val()=="")){
		alert("Please Upload jpg or png Format Photo in Upload Photo Two ");
		$("#uploadTwo").focus();
		return false;
	}
	else if(($("#stagework").val())  !="00" && ($("#uploadThree").val()=="")){
		alert("Please Upload jpg or png Format Photo in Upload Photo Three ");
		$("#uploadThree").focus();
		return false;
	}
	else if(($("#stagework").val()) !="00" && ($("#uploadFour").val()=="")){
		alert("Please Upload jpg or png Format Photo in Upload Photo Four ");
		$("#uploadFour").focus();
		return false;
	}
	
	else if ($("#expenditureMadeTillDate").val() == "") {
		alert("Please Enter Current Month Expenditure");
		$("#expenditureMadeTillDate").focus();
		return false;
		
	}
     else if (Number(expenditureMadeTillDate) > Number(openingBalance))  {
		alert("The Sum of Expenditure Made till Previous month and Current Month Expenditure should not Greater then Estimated Cost");
		$("#expenditureMadeTillDate").focus();
		return false;
	} 
     else if (Number(estimatedCost) <  Number(sumOfAmount)){
			alert("Your Estimated Amount Completed");			
			$("#expenditureMadeTillDate").focus();
			return false;
			 }

		
	   else if(($("#flooorWiseRemarks").val())==null || ($("#flooorWiseRemarks").val()=="")){
		alert("Please Enter Floor Wise Remarks");
		$("#flooorWiseRemarks").focus();
		return false;
	}
	else if(($("#delayReasons").val())==null || ($("#delayReasons").val()=="")){
		alert("Please Enter  Reasons for Delay");
		$("#delayReasons").focus();
		return false;
	}
    document.forms[0].action="saveDistrictExecutiveEngineerSecondEntry"
    	document.forms[0].submit();
	
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
							Engineer Entry Form
							
							</legend>
						<div class="control-group">
							<div class="row">
								<br />
								<%
									String stateid = (String) request.getAttribute("stateid");
									String estimatedAmount = (String) request.getAttribute("estimatedCost");
									 String balanceInDb = (String)request.getAttribute("balanceInDb");
									 String OpeningAmountDb = (String)request.getAttribute("OpeningAmountDb");
									 String previousMonthAmount = (String)request.getAttribute("previousMonthAmount");
									
									/*   String checkStageOfWorkList = (String)request.getAttribute("checkStageOfWorkList");
									   out.println("=="+checkStageOfWorkList+"==");    */ 
								%>
								<%-- <h4 style="color: red; text-align: center" id="successMessage">${message}</h4> --%>
								<br />
								<form action="saveDistrictExecutiveEngineerSecondEntry"
									method="post" enctype="multipart/form-data">

									<input type="hidden" name="distExecEngId" id="distExecEngId"
										class="form-control" value="${stateid}" />
										<input type="hidden" name="intervention" id="intervention"
										class="form-control" value="${intervention}" />
										<input type="hidden" name="component" id="component"
										class="form-control" value="${component}" />
                                    <input type="hidden" name="uploadOne" id="filedownload"
										class="form-control" />
										<!--  <input type="hidden" name="uploadOne" id="fileView"
										class="form-control" /> -->
										
									<table class="table table-striped"
										style="border-top: 1px solid #c17605; width:48% !important; margin-right:15px; float:left;" id="sortable">
										<thead>
											<tr>
												<!-- <th style="text-align: center" valign="middle">ECV</th>
												<th style="text-align: center" valign="middle">Tender
													Discount</th>
												<th style="text-align: center" valign="middle">TCV</th> -->
												<th style="text-align: center" valign="middle">Date Of
													Agreement</th>
												<th style="text-align: center" valign="middle">Date Of
													Completion Work as per agreement</th>
												<th style="text-align: center" valign="middle">Site
													Handed over Date/Site Grounded Date</th>
												<th style="text-align: center" valign="middle">Estimated Cost In (Rupees)</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach items="${firstEntryData}" var="list">                                                         
													<tr>
														<%-- <td style="text-align: left">${list.ecv}</td>
														<td style="text-align: left">${list.tenderDiscount}</td>
														<td style="text-align: left">${list.tcv}</td> --%>
														<td style="text-align: left">${list.dateOfAgreement}</td>
														<td style="text-align: right">${list.dateOfCompletionWork}</td>
														<td style="text-align: right">${list.siteHandedOverDate}</td>
														<td class="currDIV"><%out.println(estimatedAmount);%></td>
													</tr>
												</c:forEach>
											</tbody>
											
									</table>
									<table class="table table-striped"
										style="border-top: 1px solid #c17605;  width:48% !important; margin-bottom:20px; " id="sortable">
										<thead>
											<tr>
												<th style="text-align: center" valign="middle">Stage Of Work</th>
												<th style="text-align: center" valign="middle">Tentative date of completion</th>
												<th style="text-align: center" valign="middle">Year</th>
												<th style="text-align: center" valign="middle">Month</th>
												<th style="text-align: center" valign="middle">Total Expenditure In (Rupees)</th>
												<th style="text-align: center" valign="middle">Balance Expenditure to be made In (Rupees)</th>
												<th style="text-align: center" valign="middle">Uploaded Photos</th>
											</tr>
										</thead>
										
										
											<tbody>
											<c:set var="works" value=""/>
												<c:forEach items="${stageOfWorksDataList}" var="list">
													<tr>
														<td style="text-align: left">${list.stageOfwork}</td>
														<td style="text-align: left">${list.tentativeDateForCompletion}</td>
														<td style="text-align: left">${list.year}</td>
														<td style="text-align: left">${list.month}</td>
														<td style="text-align: left" class="currDIV">${list.expenditureMadeTillDate}</td>
														<td style="text-align: left" class="currDIV">${list.balenceExpenditureToBeMade}</td>
														<td style="text-align: center"><a class="advisor"
															 id="loginClick" onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}');" href="#popup1">View Images</a>
															</td>
													</tr>
												</c:forEach>
												
											</tbody>

									</table>
                           
	<div class="box">
	
</div>

<div id="popup1" class="overlay">
	<div class="popup">
		<h2>Uploaded Photos</h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
		
	<div>
	<div>
		<div >
		<div media="slider" class="">
			
	<img  id="image0" width="100" height="100" src=""/>
	<img  id="image1" width="100" height="100" src=""/>
	<img  id="image2" width="100" height="100" src=""/>
	<img  id="image3" width="100" height="100" src=""/>
	  
	</div>
		</div>
		</div>
	</div>
		</div>
	</div>
</div>
									
									<div class="form-group col-xs-12 col-sm-3">
										<label for="tentativeDateForCompletion">Tentative Date of Completion</label> <input type="text"
											name="tentativeDateForCompletion"
											id="tentativeDateForCompletion" class="form-control mydatepicker" data-toggle="datepicker"
											placeholder="Tentative date for completion" autocomplete="off" onkeypress="return onlyNumbers(event);"/>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="estimatedCost"> Estimated Cost </label> <input
											type="text" name="estimatedCost"
											value="<%out.println(estimatedAmount);%>" id="estimatedCost"
											class="form-control" readonly="readonly" />

									</div>
									<%-- <div class="form-group col-xs-12 col-sm-3">
										<label for="openingBalance">Opening Balance </label> 
										
										<c:if test="${(balanceInDb==0 && (OpeningAmountDb==0))}">
										<input
											type="text" name="openingBalance"
											value="<%out.println(estimatedAmount);%>" id="openingBalance"
											class="form-control"  readonly="readonly"/>
										</c:if>
										<c:if test="${balanceInDb!=0 || (OpeningAmountDb==1)}">
										<input
											type="text" name="openingBalance"
											value="<%out.println(balanceInDb);%>" id="openingBalance"
											class="form-control"  readonly="readonly"/>
										</c:if>

									</div> --%>
									<!-- <div class="form-group col-xs-12 col-sm-3"> -->
										<!-- <label for="openingBalance">Opening Balance </label> 
										 -->
										<c:if test="${balanceInDb==0}">
										<input
											type="hidden" name="openingBalance"
											value="<%out.println(estimatedAmount);%>" id="openingBalance"
											class="form-control"  readonly="readonly"/>
										</c:if>
										<c:if test="${balanceInDb!=0}">
										<input
											type="hidden" name="openingBalance"
											value="<%out.println(balanceInDb);%>" id="openingBalance"
											class="form-control"  readonly="readonly"/>
										</c:if>

									<!-- </div> -->
									
									<div class="form-group col-xs-12 col-sm-3">
										<label for="year">Year</label> <select
											name="year" id="year" class="form-control" onchange ="return yearMonthValidation('${stageorder}')">
											<option value="00" selected>--select--</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>   
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option>
											<option value="2025">2025</option>
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="month">Month</label> <select
											name="month" id="month" class="form-control" onchange ="return yearMonthValidation('${stageorder}')">
											<option value="00" selected>--select--</option>
											<option value="01">January</option>
											<option value="02">February</option>   
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
										</select>
									</div>
									 <div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Stage Of Work</label> <select
											name="stageOfwork" id="stagework" class="form-control"
											onchange="showUploads();return orderOfStages('${stageorder}')">
											<option value="00" selected>--select--</option>
											<option value="01">Ground Level</option>
											<option value="02">Below Basement
												level</option>   
											<option value="03">Basement Level</option>
											<option value="04">Slab Laid</option>
											<option value="05">Brick work</option>
											<option value="06">Plastering</option>
											<option value="07">Flooring</option>
											<option value="08">Colouring</option>
											<option value="09">Plumbing & Electrification</option>
											<option value="10">Completed</option>
										</select>
									</div>

									<div class="form-group col-xs-12 col-sm-3 upload">
										<label for="upload1">Upload Photo One</label><span style="color:red">(jpg/png upto 5MB)</span> <input
											type=file name="upload1" id="uploadOne" class="form-control" accept="image/x-png,image/jpeg" onchange="ValidateSize(this,'uploadOne')"/>
									</div>
									<div class="form-group col-xs-12 col-sm-3 upload">
										<label for="upload2">Upload Photo Two</label><span style="color:red">(jpg/png upto 5MB)</span> <input
											type=file name="upload2" id="uploadTwo" class="form-control" accept="image/x-png,image/jpeg" onchange="ValidateSize(this,'uploadTwo')"/>
									</div>

									<div class="form-group col-xs-12 col-sm-3 upload">
										<label for="upload3">Upload Photo Three</label><span style="color:red">(jpg/png upto 5MB)</span> <input
											type=file name="upload3" id="uploadThree"
											class="form-control" accept="image/x-png,image/jpeg" onchange="ValidateSize(this,'uploadThree')"/>
									</div>
									<div class="form-group col-xs-12 col-sm-3 upload">
										<label for="upload4">Upload Photo Four</label><span style="color:red">(jpg/png upto 5MB)</span> <input
											type=file name="upload4" id="uploadFour" class="form-control" accept="image/x-png,image/jpeg" onchange="ValidateSize(this,'uploadFour')"/>
									</div>
									 
									<div class="form-group col-xs-12 col-sm-3">
										<label for="expenditureMadeTillPreviousMonth">Expenditure Made till Previous month
											</label> <input type="text"
											name="expenditureMadeTillPreviousMonth" value="<%out.println(previousMonthAmount);%>"  id="expenditureMadeTillPreviousMonth"
											maxlength="10" onkeypress="return onlyNumbers(event);" autocomplete="off" readonly="readonly"
											class="form-control" placeholder="Expenditure Made till Previous month" />
									</div>
									
									<div class="form-group col-xs-12 col-sm-3">
										<label for="expenditureMadeTillDate">Current Month Expenditure
											</label> <input type="text"
											name="expenditureMadeTillDate" id="expenditureMadeTillDate"
											maxlength="10" onkeypress="return onlyNumbers(event);" autocomplete="off"
											class="form-control" placeholder="Expenditure made till Date" onchange="return balanceCalculation(this);" />
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="balenceExpenditureToBeMade">Balance
											Expenditure to be made</label> <input type="text"
											name="balenceExpenditureToBeMade"
											id="balenceExpenditureToBeMade" class="form-control"
											maxlength="10" onkeypress="return onlyNumbers(event);"
											placeholder="Balence Expenditure To Be Made"
											readonly="readonly" autocomplete="off" />
									</div>

									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Floor Wise Remarks</label> <input
											type=text name="flooorWiseRemarks" id="flooorWiseRemarks" placeholder="Floor Wise Remarks"
											class="form-control" autocomplete="off" onkeypress="return blockSpecialChar(event)"/>

									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="district"> Reasons for Delay</label> <input
											type="text" name="delayReasons" id="delayReasons"
											class="form-control" placeholder="Delay reasons" autocomplete="off" onkeypress="return blockSpecialChar(event)"/>
									</div>
									<div>
									</div>
									<div  class="form-group col-xs-12" style="text-align: center;">
										<button class="btn btn-primary" onclick="return onSubmitDetails();">Submit</button>
									</div>
									<!-- <a href="/DistrictExecutiveEngineerEntryMain" ><button class="btn btn-primary" 
											style="text-align: center">Back</button></a> -->
							</div>

							</form>


						</div>
				</div>
				</fieldset>
			</div>
		</div>
	</div>
	</div>
	<script>
		showUploads();
	</script>
	
	<style>
	
	
	 .box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}
span#customHTMLFooter {
    display: none;
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
  z-index:111;
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
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 95%;
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

@media screen and (max-width: 700px){
  .box{
    width: 80%;
  }
  .popup{
    width: 80%;
  }
}
	
	</style>
	
	
	
	<link rel="stylesheet" href="resources/css/custom.css" type="text/css" media="screen" charset="utf-8">
	
	<link rel="stylesheet" href="resources/css/jsgallery.css" type="text/css" media="screen" charset="utf-8">
	<script type="text/javascript" src="resources/js/jquery.jsgallery.min.js"></script>
 <script>
    $(function() {
      $('[data-toggle="datepicker"]').datepicker({
        autoHide: true,
        zIndex: 2048,
      });
    });

    $(document).ready(function() {
		  let x = document.querySelectorAll(".currDIV"); 
			
	        for (let i = 0, len = x.length; i < len; i++) { 
	            let num = Number(x[i].innerHTML) 
	                      .toLocaleString('en-IN'); 
              x[i].innerHTML = num; 
	         //   x[i].classList.add("currSign"); 
	        }
    });
	        </script>
	


	
</body>
</html>





