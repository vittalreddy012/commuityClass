<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">
<script src="resources/js/jquery-2.1.4.min.js"></script>
<script src="resources/js/datepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/datepicker.css" />
<style>
div#example_info {
	width: 50%;
	text-align: left;
	float: left;
}
div#example_paginate a {
	padding: 11px 8px !important;
	border: 1px solid #f79400;
	cursor: pointer;
	border-radius: 2px;
	margin-right: 2px;
	color: #040101;
}
div#example_length {
	width: 50%;
	float: left;
	display: flex;
}
tfoot th {
	text-align: center;
	background-color: #f79400;
	font-size: 13px;
	color: white;
	padding: 5px 0;
}
.table-responsive {
	overflow: hidden !important;
	overflow-x: scroll !important;
}
th a, td a {
	color: #588ab3 !important;
}
</style>
<script type="text/javascript">
function checkval(evt){
	var data = document.getElementById('estimatedAmount').value;
	if((evt.charCode>= 48 && evt.charCode <= 57) || evt.charCode== 46 ||evt.charCode == 0){
	if(data.indexOf('.') > -1){
	 if(evt.charCode== 46)
	  evt.preventDefault();
	}
	}else
	evt.preventDefault();
	};
	function allowCharacters(evt){
		if((evt.charCode>= 39 && evt.charCode <= 43) || (evt.charCode>= 60 && evt.charCode <= 63)
				|| (evt.charCode>= 91 && evt.charCode <= 96)|| (evt.charCode>= 123 && evt.charCode <= 126)|| evt.charCode== 32|| evt.charCode== 33||evt.charCode== 34)
		{
		return false;
		}else{
		return true;	
		}	
	}
</script>
<script>
	function getInventoryData(schval){
		$("#intervention").empty().append("<option value='0'>--Select--</option>");
		$("#Component").empty().append("<option value='0'>--Select--</option>");
		 if(schval=='98'){
			 $("#intervention").append("<option value=DIET>DIET</option><option value=MRC>MRCs</option>");
		}else{
			var intv=["SSA","RMSA","KGBV","Girls Hostel","DIET","MRC","Residential Schools"]
			for (var i = 0; i < intv.length; i++) {
			 $("#intervention").append("<option value='"+intv[i]+"'>" + intv[i] + "</option>");
			}
	     	}
	}
	function isNumber(evt) { /* onlyNumbers */
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
	        document.forms[1].action = "deleteDistrictExecutiveEngineerFromStateEntry";
	  		document.forms[1].submit();
	      }else{
	     return false;
		 } 
	}
	function onSubmitDetails() {
		
	   if ($("#intervention").val()=="0") {
			alert("Please Select Intervention");
			return false;
		}
		else if ($("#Component").val()=="0") {
			alert("Please Select Component");
			return false;
		}
		
		else if ($("#sanctionAmount").val()==null||$("#sanctionAmount").val() == "") {
			alert("Please Enter Sanction Amount");
			return false;
		}
		else if ($("#sanctionYear").val() == "0") {
			alert("Please Select Year of Sanction");
			return false;
		}
		else if ($("#units").val() == "0") {
			alert("Please Select No of Units");
			return false;
		}
		
		else if ($("#estimatedAmount").val()==null||$("#estimatedAmount").val() == "") {
			alert("Please Enter Estimation Amount");
			return false;
		}
		
		 else if((parseInt($("#estimatedAmount").val()))<parseInt($("#amountUsed").val())){
			alert("Please Enter Estimation Amount more than : Rs "+$("#amountUsed").val());
			return false;
		} 
		
		 else if ($("#ecv").val() == "") {
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
		  else if (new Date($("#dateOfCompletionWork").val()) < new Date($("#dateOfAgreement").val()) ) {
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
		                 alert("please select at least once check box");
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

		        document.forms[1].action = "tenderEdit";
		  		document.forms[1].submit();
		            }else{
		              return false;
		               } 
		         } else {
		        	 return false;
		         }
	}
function changeInventory(fromId,toId) {
        var inventory = $("#"+fromId).val();

		var SSA = ["Additional Class Rooms", "Dilapidated Class Rooms", "Drinking Water",
				"Electrification","Ramps", "Girls Toilet", "Boys Toilet",
				"Major Repairs", "Kitchen Sheds","CWSN Toilets" ];
	
		 var RMSA = [ "Phase I", "Phase II", "Phase III","Phase IV"];
		
		 var KGBV = [ "Construction of 34 KGBVs @ Rs. 270.00 lakhs",
				"Construction of 21 KGBVs @ Rs. 335.00 Lakhs",
				"Construction of 30 KGBVs @ Rs. 335.00 Lakhs",
				"Construction of 58 Up gradation KGBVs @ Rs. 135.00 Lakhs",
				"Construction of 54 Up gradation KGBVs @ Rs. 205.00 Lakhs",
				"Construction of 07 Up gradation KGBVs @ Rs. 205.00 Lakhs",
				"Repairs to existing KGBV Buildings"];
		
		 var GirlsHstl=["Construction of 192 Girls Hostels attached to Model Schools @ Rs. 128.81 Lakhs",
			            "Construction of 2 Girls Hostels attached to Model Schools @ Rs. 154.00 Lakhs",
			            "Construction of 38 Girls Hostels attached to KGBVs @ Rs. 154.00 Lakhs",
			            "Construction of 23 Girls Hostels attached to KGBVs @ Rs. 205.87 Lakhs",
			            "Repairs to Girls Hostel Building attached to Model School"];
		 
	   /*  var UR = ["Residential School", "Residential Hostel",
				"Repairs to URs"]; */
	    
		var DIET = [ "Construction of DIET Administrative and Academic Building @ Rs.400.00 Lakhs", "Repairs to DIET Building"];
		var MCR = ["Construction of Mandal Resource Centre Buildings @ Rs.31.00 Lakhs"];
		var Residential=["Urban Residential School","Residential HostelRepairs to Residential Schools"];
		
		
		if(toId=='component1'){
			$("#component1").empty().append("<option value=''>--Select--</option><option value='ALL'>ALL</option>");
			}else{
		$("#Component").empty().append("<option value='0'>--Select--</option>");
			}
		if (inventory == "SSA") {
			for (var i = 0; i < SSA.length; i++) {
				$("#"+toId).append(
						"<option value='"+SSA[i]+"'>" + SSA[i] + "</option>");
			}
		} else if (inventory == "RMSA") {
			for (var i = 0; i < RMSA.length; i++) {
				$("#"+toId).append(
						"<option value='"+RMSA[i]+"'>" + RMSA[i] + "</option>");
			}
		} else if (inventory == "KGBV") {
			for (var i = 0; i < KGBV.length; i++) {
				$("#"+toId).append(
						"<option value='"+KGBV[i]+"'>" + KGBV[i] + "</option>");
			}
		} else if (inventory == "Girls Hostel") {
			for (var i = 0; i < GirlsHstl.length; i++) {
				$("#"+toId).append(
						"<option value='"+GirlsHstl[i]+"'>" + GirlsHstl[i] + "</option>");
			}
		} 
		/* else if (inventory == "UR") {
			for (var i = 0; i < UR.length; i++) {
				$("#Component").append(
						"<option value="+UR[i]+">" + UR[i] + "</option>");
			}
		} */
		else if (inventory == "DIET") {
			for (var i = 0; i < DIET.length; i++) {
				$("#"+toId).append(
						"<option value='"+DIET[i]+"'>" + DIET[i] + "</option>");
			}
		} else if (inventory == "MRC") {
			for (var i = 0; i < MCR.length; i++) {
				$("#"+toId).append(
						"<option value='"+MCR[i]+"'>" + MCR[i] + "</option>");
			}
		}else if (inventory == "Residential Schools") {
			for (var i = 0; i < Residential.length; i++) {
				$("#"+toId).append(
						"<option value='"+Residential[i]+"'>" + Residential[i] + "</option>");
			}
		}
	}

	function getSanctionYear(){
		var yr=new Date().getFullYear();
		 $("#sanctionYear").empty().append("<option value='0'>--Select--</option>");
		for(var ind=yr-10;ind<=yr+10;ind++){
			 $("#sanctionYear").append("<option value="+ind+">"+ind+"</option>");
		}	
	}
</script>
<script>
 $(function() {
  $('#dateOfAgreement').keydown(function (e) {
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
   $(function() {
  	  $('#dateOfCompletionWork').keydown(function (e) {
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


<script>
   $(function() {
  	  $('#siteHandedOverDate').keydown(function (e) {
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
    
 	function showUploads(){
 		if($("#stagework").val()=="0") 
 			$(".upload").hide();
 		else
 			$(".upload").show();
 	}

	function showecvDiscounts(ecv,tenderdiscount,tcv){
		if($("#intervention").val()=="KGBV") {
 	 		$(".interkgbv").show();
 	 		 $("#ecv").val(ecv);
 	 		$("#tenderDiscount").val(tenderdiscount);
 	 		$("#tcv").val(tcv); 
 		}else{
 			$(".interkgbv").hide();
 	 		$("#ecv").val("0");
 	 		$("#tenderDiscount").val("0");
 	 		$("#tcv").val("0");
 	}
	}
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

</head>
<body oncopy="return false" oncut="return false" onpaste="return false">
	<div class="height_body">
		<div class="container" style="width: 100%;">
			<div class="row" style="width: 100%;">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Tender Details</legend>
						<div class="control-group">
							<form method="POST" enctype="multipart/form-data">
								<div class="row">
									<br />
									 <input type="hidden" name="intervention1"
										id="intervention1" value="${intervention1}" /> <input
										type="hidden" name="component1" id="component1"
										value="${component1}" /> <input type="hidden" name="schCode1"
										id="schCode1" value="${schCode1}" />

									<c:if test="${tenderEditlist!=null && tenderEditlist!=''}">
										<c:forEach items="${tenderEditlist}" var="list">
											<script>
							getInventoryData('${list.schcd}');
							$("#intervention").val('${list.intervention}');
							changeInventory('intervention','Component');
							showecvDiscounts('${ecv}','${tenderDiscount}','${tcv}');
							$("#Component").val('${list.component}');
							$("#units").val('${list.unit}');
							getSanctionYear(); 
							$("#sanctionYear").val('${list.sancyear}')
							</script>
											<input type=hidden id="amountUsed"
												value="${tdlist.amountused}" />
											<input type=hidden name="distExecEngId" id="tenderId"
												value="${list.tenderId}" />
											<div class="col-xs-12 col-sm-2 form-group">
												<label for="district">District Name</label> <input type=text
													name="district" class="form-control" id="districtCode"
													value="${list.distName}" readonly />
											</div>
											<div class="form-group col-xs-12 col-sm-2">
												<label for="mandal">Mandal Name</label> <input type=text
													name="mandal" class="form-control" id="mandalCode"
													value="${list.mandalName}" readonly />

											</div>
											<div class="form-group col-xs-12 col-sm-2">
												<label for="schlcode">Name of Work</label> <input type=text
													name="school" class="form-control" id="schCode"
													value="${list.workname}" readonly />
											</div>

											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">Intervention</label> <select
													name="intervention" id="intervention"
													onchange="showecvDiscounts('','',''); return changeInventory('intervention','Component');"
													class="form-control">
													<option value="0">--select--</option>
													<option value="SSA">SSA</option>
													<option value="RMSA">RMSA</option>
													<option value="KGBV">KGBVs</option>
													<option value="Girls Hostel">Girls Hostel</option>
													<!-- <option value="UR">URs</option>-->
													<option value="DIET">DIET</option>
													<option value="MRC">MRCs</option>
													<option value="Residential Schools">Residential
														Schools</option>
												</select>
											</div>
											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">Component</label> <select
													name="component" id="Component" class="form-control">
													<option value="0">--select--</option>
												</select>
											</div>

											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">Administrative
													Sanction</label> <input type=text name="sanctionAmount"
													class="form-control" id="sanctionAmount"
													value="${list.sancAmpount}"
													onkeypress="return allowCharacters(event);" maxlength="45" />
											</div>

											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">Year of Sanction</label> <select
													name="sanctionYear" id="sanctionYear" class="form-control">
													<option value="0">--select--</option>

												</select>
											</div>
											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">No Of Units</label> <select
													name="units" id="units" class="form-control">
													<option value="0">--select--</option>
													<c:forEach begin="1" end="99" var="list1">
														<option value='${list1}'>${list1}</option>
													</c:forEach>
												</select>
											</div>
											<div class="form-group col-xs-12 col-sm-2">
												<label for="stackedFirstName">Estimation Amount</label> <input
													type="text" name="estimatedAmount" class="form-control"
													id="estimatedAmount" maxlength="10"
													value="${list.estAmount}"
													onKeyPress="return checkval(event)" />
											</div>
										</c:forEach>
									</c:if>
								<!-- </div>
								
									<div class="row"> -->
										
										<c:if test="${firstEntry!=null && firstEntry!=''}">
											<!-- action="UpdateDistrictExecutiveEngineerEntry" -->

											<input type="hidden" name="checkedBoxesupdate"
												id="checkedBoxesupdate">
											<input type="hidden" name="tentativeDateForCompletionupdate"
												id="tentativeDateForCompletionupdate">
											<input type="hidden" name="uploadOneupdate"
												id="uploadOneupdate">
											<input type="hidden" name="flooorWiseRemarksupdate"
												id="flooorWiseRemarksupdate">
											<input type="hidden" name="delayReasonsupdate"
												id="delayReasonsupdate">

											<input type="hidden" name="yearorginal" id="yearorginal">
											<input type="hidden" name="monthoriginal" id="monthoriginal">
											<input type="hidden" name="stageofworkoriginal"
												id="stageofworkoriginal">

											<!-- <div class="row" align="center"> -->
												<!--  First Entry Screen -->
												
											
													<div class="form-group col-xs-12 col-sm-2 interkgbv">
														<label for="ecv">ECV:</label> <input type="text"
															name="ecv" id="ecv" class="form-control" maxlength="10"
															value="${ecv}" onkeypress="return onlyNumbers(event);"
															placeholder="ECV" autocomplete="off" />
													</div>
													<div class="form-group col-xs-12 col-sm-2 interkgbv">
														<label for="tenderDiscount">Tender Discount:</label> <input
															type="text" name="tenderDiscount" id="tenderDiscount"
															class="form-control" maxlength="10"
															value="${tenderDiscount}"
															onkeypress="return onlyNumbers(event);"
															placeholder="Tender Discount" autocomplete="off" />
													</div>
													<div class="form-group col-xs-12 col-sm-2 interkgbv">
														<label for="tcv">TCV:</label> <input type="text"
															name="tcv" id="tcv" class="form-control" maxlength="10"
															value="${tcv}" onkeypress="return onlyNumbers(event);"
															placeholder="TCV" autocomplete="off" />
													</div>
												
											<!-- </div>
											<div class="row" style="margin: 0;"> -->
												<div class="form-group col-xs-12 col-sm-2">
													<label for="dateOfAgreement">Date Of Agreement:</label> <input
														type="text" data-toggle="datepicker"
														name="dateOfAgreement" id="dateOfAgreement"
														onkeypress="return onlyNumbers(event);"
														value="${dateOfAgreement}" class="form-control"
														placeholder="Date Of Agreement" autocomplete="off" />
												</div>

												<div class="form-group col-xs-12 col-sm-2">
													<label for="dateOfCompletionWork">Time Completion as per agreement</label>
														 <input type="text" data-toggle="datepicker" name="dateOfCompletionWork"
														id="dateOfCompletionWork"
														onkeypress="return onlyNumbers(event);"
														class="datepicker-here form-control"
														value="${dateOfCompletionWork}"
														placeholder="Time Of Completion as per agreement"
														autocomplete="off" />

												</div>
												<div class="form-group col-xs-12 col-sm-2">
													<label for="siteHandedOverDate">Site Handed over
														Date:</label> <input type="text"
														data-toggle="datepicker" name="siteHandedOverDate"
														id="siteHandedOverDate"
														onkeypress="return onlyNumbers(event);"
														class="datepicker-here form-control"
														value="${siteHandedOverDate}"
														placeholder="Site Handed over date" autocomplete="off" />
												</div>
											</div>
											<!-- End First Entry Screen -->
										</c:if>
										<!-- Second Entry Screen -->
										<c:if test="${SecondEntryData!=null && SecondEntryData!=''}">
											<br />
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
												<input class="myown" type="checkbox"
													id="chck${list.stageOfworkId}"> <label
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
																style="color: red; font-size: 12px;"> (MAX 5MB)</span> <input
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
																style="color: red; font-size: 12px;"> (MAX 5MB)</span> <input
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
																style="color: red; font-size: 12px;"> (MAX 5MB)</span> <input
																type=file name="uploadThree" id="uploadThree${i}"
																class="form-control" accept="image/x-png,image/jpeg"
																onchange="ValidateSize(this,'uploadThree')" /> <a
																class="advisor" id="loginClick"
																onclick="getPhotosListAjax('${list.stageOfworkId}','${stateid}','${list.year}','${list.month}','${list.uploadThree}');"
																href="#popup1" style="font-size: 13px;">View Image</a>
														</div>
													</td>
												
													</tr><tr>
													<td></td>
													<td>
														<div class="form-group">
															<label for="upload4">Upload Photo</label><span
																style="color: red; font-size: 12px;"> (MAX 5MB)</span> <input
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
															<label for="expenditureMadeTillDate">Current
																Month Expenditure </label> <input type="text"
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
															<label for="stackedFirstName">Floor Wise Remarks</label>
															<input type=text name="flooorWiseRemarks"
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
			<div class="row">
			<br/><br/>
<div class="col-xs-12" style="text-align: center;">
				<button class="btn btn-primary" style="text-align: center;"
					onclick="return onSubmitDetails();">Update</button>
				<c:if test="${SecondEntryData!=null && SecondEntryData!=''}"> 
					<button class="btn btn-primary"
						style="text-align: center;"
						onclick="return onPaymentSubmitDetails();">Edit Payment
						Details</button>
				 </c:if> 
			</div>
			</div>
		</div>
		</fieldset>
	</div>
	</div>
	</div>
	</div>

	<!-- Model Pop Up Ends -->

	<!-- View Photo popup -->
	<div id="popup1" class="overlay">
		<div class="popup">
			<h4
				style="color: #fff; font-weight: 500; padding: 10px 10px; margin-bottom: 15px;
	/* border-radius: 20px; */ text-align: center; background-color: #f79400; width: 125%; display: block; position: relative; top: -50px; left: -40px; border-top-left-radius: 5px; border-top-right-radius: 5px;">
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
	padding: 2px 10px;
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
	padding: 2px 10px;
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
	overflow: hidden;
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
</body>
</html>

