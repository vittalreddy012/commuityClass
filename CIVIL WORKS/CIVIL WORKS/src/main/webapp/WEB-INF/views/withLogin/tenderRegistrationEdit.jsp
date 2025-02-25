<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">
<style>


.modal-dialog {
    width: 95% !important;
    margin: 30px auto;
}

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
	function getNamesListAjax(reqType, nextTypeName) {
		var paraData = "reqType=" + reqType + "&reqName="+ $('#' + reqType).val();
		//alert(paraData);
		$.ajax({
			type : "GET",
			url : "getAjaxListDetails",
			data : paraData,
			success : function(response) {
				$("#" + nextTypeName).empty().append(response);
			},
			error : function(e) {
				// alert('Error: ' + e);
			}
		});
	}
	
	function getWorkNamesListAjax(workval) {
		var paraData = "intervention=" + $("#intervention1").val() + "&component="+ $("#component1").val();
	   $.ajax({
			type : "GET",
			url : "getWorkNamesListDetails",
			data : paraData,
			success : function(response) {
				$("#schCode1").empty().append(response);
				if(workval!=null && workval!="")
				$("#schCode1").val(workval);
			},
			error : function(e) {
				// alert('Error: ' + e);
			}
		});
	}
	function myModelId(refNo,district,mandal,schcd,workname,intervention,component,sacAmt,sacyear,units,estamt,expenditureAmount){
		
		$("#tenderId").val(refNo);
		$("#districtCode").val(district);
		$("#mandalCode").val(mandal);
		$("#schCode").val(workname);
		getInventoryData(schcd);
		$("#intervention").val(intervention);
		changeInventory('intervention','Component')
		$("#Component").val(component);
		$("#units").val(units);
		$("#sanctionAmount").val(sacAmt);
		$("#sanctionYear").val(sacyear)
		$("#estimatedAmount").val(estamt);
		$("#amountUsed").val(expenditureAmount);
		
	}

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
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
	
	function onSubmitDetails() {
		if ($("#districtCode").val() == "0") {
			alert("Please Select District Name");
			return false;
		}
		else if ($("#mandalCode").val() == "0") {
			alert("Please Select Mandal Name");
			return false;
		}
		else if ($("#schcd").val() == "0") {
			alert("Please Select School Name");
			return false;
		}
		else if ($("#intervention").val()=="0") {
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
	
	}
	function getSelectList(){
		$("#intervention1").val('${intervention1}');
		changeInventory('intervention1','component1');
		$("#component1").val('${component1}');
		getWorkNamesListAjax('${schCode1}');
	}
	
	function getTenderEditDetails(){
		 if ($("#intervention1").val()=="") {
			alert("Please Select Intervention");
			return false;
		}
		else if ($("#component1").val()=="") {
			alert("Please Select Component");
			return false;
		}
		else if ($("#schCode1").val()=="") {
			alert("Please Select Work Name");
			return false;
		}
		 document.forms[0].action = "tenderDetailsEdit";
			document.forms[0].submit();
			}
	
	function deleteTender(id){
		$("#tenderId").val(id);
		document.forms[0].action = "deleteTender";
		document.forms[0].submit();
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
</head>
<body onload="getSelectList();">
	<jsp:include page="../Tiles/withLogin/Header.jsp" />
	<jsp:include page="../Tiles/withLogin/Menu.jsp" />
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Tender Details</legend>
						<div class="control-group">
						<form method="POST" autocomplete="off">
						<input type="hidden" name="tenderId" id="tenderId">
							<div class="row">
                            <div class="form-group col-xs-12 col-sm-3">
									<label for="stackedFirstName">Intervention</label> <select
										name="intervention1" id="intervention1"
										onchange="return changeInventory('intervention1','component1');"
										class="form-control">
										<option value="">--select--</option>
										<option value='ALL'>ALL</option>
										<option value="SSA">SSA</option>
										<option value="RMSA">RMSA</option>
										<option value="KGBV">KGBVs</option>
										<option value="Girls Hostel">Girls Hostel</option>
										<!-- <option value="UR">URs</option> -->
                                        <option value="DIET">DIET</option>
										<option value="MRC">MRCs</option>
										<option value="Residential Schools">Residential
											Schools</option>
									</select>
								</div>
								<div class="form-group col-xs-12 col-sm-3">
									<label for="stackedFirstName">Component</label> <select
										name="component1" id="component1" class="form-control" onchange="getWorkNamesListAjax()">
										<option value="">--select--</option>
									</select>
								</div>
								<div class="form-group col-xs-12 col-sm-3">
									<label for="schlcode">Name Of Work</label> <select
										name="schCode1" id="schCode1" class="form-control">
										<option value="">--select--</option>
										
									</select>
								</div>
								<div class="form-group col-xs-12 col-sm-3"
									style="margin-top: 31px;">
									<button class="btn btn-primary"
										onclick="return getTenderEditDetails();">Submit</button>
								</div>
							</div>
							</form>
						
							<div class="row">
								<c:if test="${not empty msg}">
									<br />
									<div style="margin-top: 13%; margin-bottom: 13%">
										<h4 style="color: red; text-align: center" id="successMessage">${msg}</h4>
									</div>
								</c:if>
								<h4 text-align: center" id="statusmsg">${message}</h4>

								<c:if test="${not empty tenderlist}">
									<div class="table-responsive">
										<table id="example" class="table table-striped table-bordered"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th style="text-align: center" valign="middle">Reference
														No</th>
													<th style="text-align: center" valign="middle">District
														Name</th>
													<th style="text-align: center" valign="middle">Mandal
														Name</th>
													<th style="text-align: center" valign="middle">Name of Work
														</th>
													<th style="text-align: center" valign="middle">Intervention
													</th>
													<th style="text-align: center" valign="middle">Component
													</th>
													<th style="text-align: center" valign="middle">
														Administrative sanction</th>
													<th style="text-align: center; width: 150px;"
														valign="middle" colspan="2">Action</th>

												</tr>
												<tr>
													<th style="text-align: center" valign="middle">1</th>
													<th style="text-align: center" valign="middle">2</th>
													<th style="text-align: center" valign="middle">3</th>
													<th style="text-align: center" valign="middle">4</th>
													<th style="text-align: center" valign="middle">5</th>
													<th style="text-align: center" valign="middle">6</th>
													<th style="text-align: center" valign="middle">7</th>
													<th style="text-align: center" valign="middle">8</th>
													<th style="text-align: center" valign="middle">9</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${tenderlist}" var="list">

													<tr>
														<td style="text-align: center">${list.tenderId}</td>
														<td style="text-align: left">${list.distName}</td>
														<td style="text-align: left">${list.mandalName}</td>
														<td style="text-align: left">${list.workname}</td>
														<td style="text-align: left">${list.intervention}</td>
														<td style="text-align: left">${list.component}</td>
														<td style="text-align: left">${list.sancAmpount}</td>
														<td style="text-align: center">
															<a href="#"
															class="advisor" data-toggle="modal"
															data-target="#myModal" id="loginClick"
															data-backdrop="static" data-keyboard="false" data-id="${list.tenderId}" ><button class="btn btn-primary">Edit</button></a>
														</td>
														<td>
															<button class="btn btn-danger"
																onclick="deleteTender('${list.tenderId}')">Delete</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
									</div>
									
									<!-- modal popup -->
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">
                                                 <div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title"></h4>
													</div>
													<div class="modal-body">
													</div>
												</div>
											</div>
										</div>
								</c:if>
							</div>
							
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../Tiles/withLogin/Footer.jsp" />
	<script>
	$(function() {
		$("#statusmsg").delay(10000).fadeOut(0);
	});

	$(document).ready(function() {

		$(".advisor").click(function () {

			        var stateId = $(this).data('id');
				    var intervention= document.getElementById("intervention1").value;
				    var component= document.getElementById("component1").value;
				    var workname= document.getElementById("schCode1").value;
					var com = component.trim().split(" ").join("~");
					var inter = intervention.trim().split(" ").join("~");
					var work = workname.trim().split(" ").join("~");
		            $('.modal-body').load('tenderEditRedirectionPage?testval='+stateId+'&intervention1='+inter+'&component1='+com+'&schCode1='+work,function(){
                      $('#myModal').modal({show:true});
                     
                    }); 
		         });

		});
	</script>
	<!-- <script src="resources/js/jquery-1.12.3.js"></script>
 -->
    <script src="resources/js/jquery-2.1.4.min.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
	<script>
	
	$(document).ready(function() {
		$('#example').DataTable({
			columnDefs : [ {
				orderable : false,
				targets : [ 0 ]
			} ]
		});
	});
	</script>
</body>
</html>

