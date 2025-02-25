<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">

<style>
div#example_info {
	width: 50%;
	text-align: left;
	float: left;
}

div#example_paginate a {
	padding: 8px! important;
	border: 1px solid #f79400;
	cursor: pointer;
	border-radius: 2px;
	margin-right: 2px;
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

.table>tbody>tr>td
{
white-space: nowrap !important;
}
.table>thead>tr>th
{
white-space: nowrap !important;
}
</style>
<!-- CSS style to add the sign of the currency before the number -->
<style>
.currSign:before {
	content: 'Rs';
}
</style>
<script>
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

function getPhotosListAjax(stageOfWork, stateid) {
		
		var paraData = "stageOfWork=" + stageOfWork + "&stateid="+ stateid;
		$.ajax({
			type : "GET",
			url : "getAjaxListPhotos",
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
	
	function getData(id, flag) {
      
		$('#districtCode').val(id);
		$('#flag').val(flag);
		document.forms[0].action = 'getTenderDetails';
		document.forms[0].submit();
	}

	function getExcel(id, flag) {
		$('#districtCode').val(id);
		$('#flag').val(flag);
		document.forms[0].action = 'downloadExcel';
		document.forms[0].submit();
	}
	function goBack() {
		window.history.back();
	}
	function getSelectList(){
		$("#intervention1").val('${intervention1}');
		changeInventory('intervention1','component1');
		$("#component1").val('${component1}');
		getWorkNamesListAjax('${schCode1}');
	}
	function getTenderEditDetails() {

		if ($("#intervention1").val() == "") {
			alert("Please Select Intervention");
			return false;
		} else if ($("#component1").val() == "") {
			alert("Please Select Component");
			return false;
		} else if ($("#schCode1").val() == "") {
			alert("Please Select Work Name");
			return false;
		}
		$('#flag').val("0");
		$('#districtCode').val("0");
		document.forms[0].action = 'getTenderDetails';
		document.forms[0].submit();
	}

	function changeInventory(fromId, toId) {
		var inventory = $("#" + fromId).val();

		var SSA = [ "Additional Class Rooms", "Dilapidated Class Rooms",
				"Drinking Water", "Electrification", "Ramps", "Girls Toilet",
				"Boys Toilet", "Major Repairs", "Kitchen Sheds", "CWSN Toilets" ];

		var RMSA = [ "Phase I", "Phase II", "Phase III", "Phase IV" ];

		var KGBV = [ "Construction of 34 KGBVs @ Rs. 270.00 lakhs",
				"Construction of 21 KGBVs @ Rs. 335.00 Lakhs",
				"Construction of 30 KGBVs @ Rs. 335.00 Lakhs",
				"Construction of 58 Up gradation KGBVs @ Rs. 135.00 Lakhs",
				"Construction of 54 Up gradation KGBVs @ Rs. 205.00 Lakhs",
				"Construction of 07 Up gradation KGBVs @ Rs. 205.00 Lakhs",
				"Repairs to existing KGBV Buildings" ];

		var GirlsHstl = [
				"Construction of 192 Girls Hostels attached to Model Schools @ Rs. 128.81 Lakhs",
				"Construction of 2 Girls Hostels attached to Model Schools @ Rs. 154.00 Lakhs",
				"Construction of 38 Girls Hostels attached to KGBVs @ Rs. 154.00 Lakhs",
				"Construction of 23 Girls Hostels attached to KGBVs @ Rs. 205.87 Lakhs",
				"Repairs to Girls Hostel Building attached to Model School" ];

		/*  var UR = ["Residential School", "Residential Hostel",
				"Repairs to URs"]; */

		var DIET = [
				"Construction of DIET Administrative and Academic Building @ Rs.400.00 Lakhs",
				"Repairs to DIET Building" ];
		var MCR = [ "Construction of Mandal Resource Centre Buildings @ Rs.31.00 Lakhs" ];
		var Residential = [ "Urban Residential School",
				"Residential HostelRepairs to Residential Schools" ];

		if (toId == 'component1') {
			$("#component1")
					.empty()
					.append(
							"<option value=''>--Select--</option><option value='ALL'>ALL</option>");
		} else {
			$("#Component").empty().append(
					"<option value='0'>--Select--</option>");
		}
		if (inventory == "SSA") {
			for (var i = 0; i < SSA.length; i++) {
				$("#" + toId).append(
						"<option value='"+SSA[i]+"'>" + SSA[i] + "</option>");
			}
		} else if (inventory == "RMSA") {
			for (var i = 0; i < RMSA.length; i++) {
				$("#" + toId).append(
						"<option value='"+RMSA[i]+"'>" + RMSA[i] + "</option>");
			}
		} else if (inventory == "KGBV") {
			for (var i = 0; i < KGBV.length; i++) {
				$("#" + toId).append(
						"<option value='"+KGBV[i]+"'>" + KGBV[i] + "</option>");
			}
		} else if (inventory == "Girls Hostel") {
			for (var i = 0; i < GirlsHstl.length; i++) {
				$("#" + toId).append(
						"<option value='"+GirlsHstl[i]+"'>" + GirlsHstl[i]
								+ "</option>");
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
				$("#" + toId).append(
						"<option value='"+DIET[i]+"'>" + DIET[i] + "</option>");
			}
		} else if (inventory == "MRC") {
			for (var i = 0; i < MCR.length; i++) {
				$("#" + toId).append(
						"<option value='"+MCR[i]+"'>" + MCR[i] + "</option>");
			}
		} else if (inventory == "Residential Schools") {
			for (var i = 0; i < Residential.length; i++) {
				$("#" + toId).append(
						"<option value='"+Residential[i]+"'>" + Residential[i]
								+ "</option>");
			}
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
						<legend class="scheduler-border">Tender Details Status
							Report</legend>
						<div class="control-group">
							<form role="form" action="getTenderDetails" method="POST"
								modelAttribute="tender">
								<input type="hidden" name="districtCode" id="districtCode" /> <input
									type="hidden" name="flag" id="flag" />

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
											name="component1" id="component1" class="form-control"
											onchange="getWorkNamesListAjax()">
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
								<br />
								<div class="clearfix"></div>


								<div class="col-xs-12">

									<!-- 	Message Displaying -->
									<c:if test="${not empty msg}">
										<br />
										<div style="margin-top: 13%; margin-bottom: 13%">
											<h4 style="color: red; text-align: center"
												id="successMessage">${msg}</h4>
											<c:if test="${backAvail > 0}">
												<button onclick="getData('0','0')" "class="btn btn-primary">Back</button>
											</c:if>
										</div>
									</c:if>

									<!--  District List -->

									<c:if test="${not empty distList}">
										<a href="#" onclick="getExcel('${excelid}','${excelval}');"><img
											src="resources/images/excel.jpg"
											style="width: 30px; height: 30px; float: right; margin: 5px"
											class="img-responsive" /></a>
										<br />
										<br />
										<table id="example" class="table table-striped table-bordered"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th style="text-align: center" valign="middle">S.No</th>
													<th style="text-align: center" valign="middle">District
														Code</th>
													<th style="text-align: center" valign="middle">District
														Name</th>
													<th style="text-align: center" valign="middle">No of
														Works</th>
													<th style="text-align: center" valign="middle">Estimated
														Cost<br> In (Rupees)
													</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="i" value="1"></c:set>
												<c:set var="totalcost" value="0"></c:set>
												<c:set var="totalschools" value="0"></c:set>
												<c:forEach items="${distList}" var="list">
													<tr>
														<td style="text-align: center">${i}</td>
														<td style="text-align: center">${list.DistCode}</td>
														<td style="text-align: left">${list.DistName}</td>
														<td style="text-align: right">${list.schools}</td>
														<c:choose>
															<c:when test="${list.estimatecost==0}">
																<td style="text-align: right">${list.estimatecost}</td>
															</c:when>
															<c:otherwise>
																<td style="text-align: right"><a href="#"
																	onclick="getData('${list.DistCode}','2')"
																	class="currDIV">${list.estimatecost}</a></td>
															</c:otherwise>
														</c:choose>
														<c:set var="totalschools" value="${i+1}"></c:set>
														<c:set var="totalschools"
															value="${totalschools+list.schools}"></c:set>
														<c:set var="totalcost"
															value="${totalcost+list.estimatecost}"></c:set>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="3" style="text-align: center">Total</th>
													<th style="text-align: right">${totalschools}</th>
													<th style="text-align: right"><a href="#"
														onclick="getData('${totalid}','${totalflag}')"
														class="currDIV">${totalcost}</a></th>
												</tr>
											</tfoot>
										</table>
									</c:if>

									<!-- 	Tender Details Status Report List -->
									<c:if test="${not empty tenderstatusDetailList}">
										<a href="#" onclick="getExcel('${excelid}','${excelval}');"><img
											src="resources/images/excel.jpg"
											style="width: 30px; height: 30px; float: right; margin: 5px"
											class="img-responsive" /></a>
										<c:if test="${backAvail > 0}">
											<button onclick="getData('0','0')" class="btn btn-primary"
												style="float: right;">Back</button>
										</c:if>
										<br />
										<br />
										<div class="table-responsive">
											<table id="example"
												class="table table-striped table-bordered" cellspacing="0"
												width="100%">
												<thead>
													<tr>
														<th style="text-align: center" valign="middle">District Name</th>
															
														<th style="text-align: center"  valign="middle">Work Name</th>
															
														<th style="text-align: center"  valign="middle">Intervention</th>
														
														<th style="text-align: center"  valign="middle">Component</th>
														
														<th style="text-align: center"  valign="middle">Units</th>
														
														<th style="text-align: center"  valign="middle">Sanction Year</th>
															
														<th style="text-align: center"  valign="middle">Administration Sanction</th>
															
														<th style="text-align: center"  valign="middle">Estimated Cost <br> In (Rupees) </th>
															
														
														<!-- <th style="text-align: center" rowspan="2" valign="middle">ECV
														</th>
														<th style="text-align: center" rowspan="2" valign="middle">Tender
															Discount</th>
														<th style="text-align: center" rowspan="2" valign="middle">TCV
														</th> -->
														<th style="text-align: center"  valign="middle">Date
															Of Agreement</th>
														<th style="text-align: center"  valign="middle">Tentative
															Date of Completion</th>
														<th style="text-align: center"  valign="middle">Site
															HandOver Date</th>
														<th style="text-align: center"  valign="middle">Expenditure
															Made Till Date <br> In (Rupees)
														</th>
														<th style="text-align: center"  valign="middle">Balence
															Expenditure To Be Made <br> In (Rupees)
														</th>
														<th style="text-align: center"  valign="middle">Stage
															Of Work</th>
														<th style="text-align: center"  valign="middle">Upload
															Files</th>
														<th style="text-align: center"  valign="middle">Floor
															wise Remarks</th>
														<th style="text-align: center"  valign="middle">Reasons
															for Delay</th>
														<!-- <th style="text-align: center" rowspan="2" valign="middle">Opening
															Balance</th> -->
													</tr>
													<tr>
													<th style="text-align: center">1</th>
													<th style="text-align: center">2</th>
													<th style="text-align: center">3</th>
													<th style="text-align: center">4</th>
													<th style="text-align: center">5</th>
													<th style="text-align: center">6</th>
													<th style="text-align: center">7</th>
													<th style="text-align: center">8</th>
													<th style="text-align: center">9</th>
													<th style="text-align: center">10</th>
													<th style="text-align: center">11</th>
													<th style="text-align: center">12</th>
													<th style="text-align: center">13</th>
													<th style="text-align: center">14</th>
													<th style="text-align: center">15</th>
													<th style="text-align: center">16</th>
													<th style="text-align: center">17</th>
													</tr>

												</thead>
												<tbody>
													<c:forEach items="${tenderstatusDetailList}" var="list">
														<tr>
															<td style="text-align: center">${list.DistName}</td>
															<c:if test="${list.schcd==98}">
																<td style="text-align: left">${list.workName}</td>
															</c:if>
															<c:if test="${list.schcd!=98}">
																<td style="text-align: left">${list.schcd}-${list.workName}</td>
															</c:if> 
															
															<td style="text-align: left">${list.intervention}</td>
															<td style="text-align: left">${list.component}</td>
															<td style="text-align: center">${list.units}</td>
															<td style="text-align: center">${list.sanYear}</td>
															<td style="text-align: left">${list.sanAmount}</td>
															<td style="text-align: center"><span
																class="currDIV">${list.estAmount}</span></td>
															<%-- <td style="text-align: left">${list.ecv}</td>
															<td style="text-align: center">${list.tenderdiscount}</td>
															<td style="text-align: left">${list.tcv}</td> --%>
															<td style="text-align: center">${list.dateofagreement}</td>

															<td style="text-align: center">${list.tentativeDate}</td>
															<td style="text-align: center">${list.siteHandOverDate}</td>
															<td style="text-align: left"><span class="currDIV">
																	${list.expenditureMade}</span></td>
															<td style="text-align: left"><span class="currDIV">${list.balenceExpenditure}</span></td>
															<td style="text-align: left">${list.workStage}</td>
															<c:if test="${list.uploadOne != '-'}">
															<td style="text-align: center"><a href="#"
																class="advisor" data-toggle="modal"
																data-target="#myModal" id="myModelId"
																data-backdrop="static" data-keyboard="false" data-id=""
																onclick="getPhotosListAjax('${list.workStageId}','${list.stateId}');">View
																	Images</a></td>
															</c:if>
															<c:if test="${list.uploadOne == '-'}"><td style="text-align: center">-</td></c:if>
															<td style="text-align: left">${list.remarks}</td>
															<td style="text-align: left">${list.delayresons}</td>
															<%-- <td style="text-align: left">${list.openingbalance}</td> --%>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
								</div>
							</form>

						</div>

					</fieldset>
				</div>

				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog" style="width: 55%;">
						<div class="modal-content" style="text-align: center !important;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<div class="height_body">
									<div class="container" style="width: 100%;">
										<div class="row" style="width: 100%;">
											<div class="col-md-12">
												<fieldset class="scheduler-border">
													<legend class="scheduler-border">Uploaded IMAGES</legend>
													<div class="control-group">
														<div class="row">
															<img id="image0" width="150" height="150" src="" /> <img
																id="image1" width="150" height="150" src="" /> <img
																id="image2" width="150" height="150" src="" /> <img
																id="image3" width="150" height="150" src="" />
														</div>
													</div>
												</fieldset>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- Footer -->

	</div>

	<jsp:include page="../Tiles/withLogin/Footer.jsp" />
	<!-- <script src="resources/js/dataTables.bootstrap.min.js"></script> -->
	<script src="resources/js/jquery.dataTables.min.js"></script>
	<!-- <script src="resources/js/dataTables.fixedColumns.min.js"></script> -->

	<script src="resources/js/demo.js"></script>
	<script>
		$(document).ready(function() {

			  let x = document.querySelectorAll(".currDIV"); 
				
		        for (let i = 0, len = x.length; i < len; i++) { 
		            let num = Number(x[i].innerHTML) 
		                      .toLocaleString('en-IN'); 
	                x[i].innerHTML = num; 
		         //   x[i].classList.add("currSign"); 
		        }

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



