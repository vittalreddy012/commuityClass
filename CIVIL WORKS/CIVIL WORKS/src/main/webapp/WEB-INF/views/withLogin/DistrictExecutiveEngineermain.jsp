<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="resources/js/css/datepicker.css" rel="stylesheet" type="text/css">
 <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  
<script src="resources/js/datepicker.js"></script>  -->

<!-- <link rel="stylesheet" type="text/css" href="resources/js/datepicker/jquery-ui.css" /> -->
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">

<!-- 
<script src="resources/js/datepicker/jquery.min.js"></script>
<script src="resources/js/datepicker/jquery-ui.min.js"></script> -->
<script type="text/javascript">
	$('#date1').datepicker({
    changeMonth: true,
    changeYear: true,
		yearRange: "-100:+5",
    showButtonPanel: true,
    dateFormat: "dd-mm-yy"
		
});

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
		
		
		
		$("#"+toId).empty().append("<option value=''>--Select--</option><option value='ALL'>ALL</option>");
			
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

	function getTenderEditDetails(){
		 if ($("#intervention").val()=="") {
			alert("Please Select Intervention");
			return false;
		}
		else if ($("#component").val()=="") {
			alert("Please Select Component");
			return false;
		}
		
		 document.forms[0].action = "DistrictExecutiveEngineerEntryMain";
			document.forms[0].submit();
			}

	function getSelectList(){
		$("#intervention").val('${intervention}');
		changeInventory('intervention','component');
		$("#component").val('${component}');
	}
	</script>


<style>
div#example_info {
	width: 50%;
	text-align: left;
	float: left;
}

div#example_paginate a {
	padding: 8px !important;
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

</style>


<style>

.navbar-inverse {
    background-color: #f79400 !important;
    border-color: #f79400 !important;
}

@media ( min-width : 768px) {
	.modal-content {
		-webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.18) !important;
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.18) !important;
		border: none !important;
	}
}

.modal-header {
	background-color: #008405 !important;
}

.modal-footer button {
	background: #12382b !important;
	line-height: 34px !important;
	height: 34px !important;
	padding: 3px 14px !important;
}

.modal-header .close {
	margin-top: 0px !important;
	font-size: 25px !important;
	color: #000 !important;
}

@media ( min-width : 768px) {
	.modal-dialog {
		width: 1200px !important;
	}
}
</style>



</head>
<body onload="getSelectList();">
<input type="hidden" name="distExecEngId" id="distExecEngId" class="form-control"	value="" /> 
	<jsp:include page="../Tiles/withLogin/Header.jsp" />
	<jsp:include page="../Tiles/withLogin/Menu.jsp" />
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">District Executive
							Engineer Entry Form </legend>
						<div class="control-group">
						<form method="post" >
						<div class="row">
                            <div class="form-group col-xs-12 col-sm-3">
									<label for="stackedFirstName">Intervention</label> <select
										name="intervention" id="intervention"
										onchange="return changeInventory('intervention','component');"
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
										name="component" id="component" class="form-control">
										<option value="">--select--</option>
									</select>
								</div>
							    <div class="form-group col-xs-12 col-sm-3"
									style="margin-top: 31px;">
									<button class="btn btn-primary"
										onclick="return getTenderEditDetails();">Submit</button>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-xs-12">
								
									<br />
									<c:if test="${not empty msg}">
										<div style="margin-top: 13%; margin-bottom: 13%">
											<h4 style="color: red; text-align: center"
												id="successMessage">${msg}</h4>
										</div>
									</c:if>
									<%-- <% String message =(String) request.getAttribute("message");
										 out.println(message); 
									%> --%>

									 <h4 style="color: red; text-align: center" id="statusmsg">${msg1}</h4> 
									<c:if test="${not empty tenderlist}">
                                   <div class="table-responsive">
										<table id="example" class="table table-striped table-bordered"
										cellspacing="0" width="100%">
											<thead>
												<tr>
													<th style="text-align: center" valign="middle">Reference
														No
														</th>
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
													<th style="text-align: center" valign="middle">No of
														Units</th>
													<th style="text-align: center" valign="middle">Estimated
														Cost In (Rupees)</th>
														<th style="text-align: center" valign="middle"> Action </th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${tenderlist}" var="list">
													<tr>
														<td style="text-align: center"><a href="#"
															class="advisor" data-toggle="modal"
															data-target="#myModal" id="loginClick"
															data-backdrop="static" data-keyboard="false" data-id="${list.tenderId}" >${list.tenderId}</a></td>
														<td style="text-align: left">${list.mandalName}</td>
														<c:if test="${list.schcd==98}">
															<td style="text-align: left">${list.workName}</td>
														</c:if>
														<c:if test="${list.schcd !=98}">
															<td style="text-align: left">${list.schcd}-${list.workName}</td>
														</c:if>
														<td style="text-align: left">${list.intervention}</td>
														<td style="text-align: left">${list.component}</td>
														<td style="text-align: left">${list.sancAmpount}</td>
														<td style="text-align: right">${list.unit}</td>
														<td style="text-align: right" class="curr">${list.estAmount}</td>
														<c:if test="${list.editcount!=0}"> 
														 <td style="text-align: center"><a href="#"
															class="advisor" data-toggle="modal"
															data-target="#myModal" id="editClick"
															data-backdrop="static" data-keyboard="false" data-id="${list.tenderId}" ><button class="btn btn-primary">Edit</button></a></td>
													 </c:if>
													 <c:if test="${list.editcount==0}">
													 <td>--</td>
													  </c:if> 
													 </tr>
												</c:forEach>
											</tbody>
										</table>
										</div>
										<!-- <div class="col-md-4">
										<input type="text" class="datepicker-here form-control" placeholder="date picker">
										</div> -->
										
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
						</form>
						</div>
				</div>
				</fieldset>
			</div>
		</div>
	</div>
	

	<!-- Footer -->

	<jsp:include page="../Tiles/withLogin/Footer.jsp" />
    <script>
		$(function() {
			$("#statusmsg").delay(5000).fadeOut(0);
		});
	 
$(document).ready(function(){
	 $(".advisor").click(function () {
		 var action=$(this).text();
		 var myBookId = $(this).data('id');
		 $(".modal-body #distExecEngId").val( myBookId );
		 /* alert("myBookId==="+myBookId); */
		  document.getElementById("distExecEngId").value=myBookId;
		    var test= document.getElementById("distExecEngId").value;
		    var intervention= document.getElementById("intervention").value;
			var component= document.getElementById("component").value;
			var com = component.trim().split(" ").join("~");
			var inter = intervention.trim().split(" ").join("~");
         if(action!='Edit'){
        	$('.modal-body').load('RedirectionPage?testval='+test+'&intervention='+inter+'&component='+com,function(){
		        $('#myModal').modal({show:true});
		    });
         }else{
            $('.modal-body').load('EditRedirectionPage?testval='+test+'&intervention='+inter+'&component='+com,function(){
 		        $('#myModal').modal({show:true});
 		    });
             }
		 /* $(".modal-body #distExecEngId").val( myBookId ); */
		  
	    });
	    
	   
	});

</script>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script src="resources/js/jquery-2.1.4.min.js"></script>

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			  let x = document.querySelectorAll(".curr"); 
				
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



