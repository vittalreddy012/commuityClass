<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type = "text/javascript" >
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
		$.ajax({
			type : "GET",
			url : "getAjaxListDetails",
			data : paraData,
			success : function(response) {
				$("#" + nextTypeName).empty().append("<option value='0'>--Select--</option>");
				if(nextTypeName=='schcd'){
					$("#" + nextTypeName).append("<option value='98'>No Udise Code</option>");
					}
				$("#" + nextTypeName).append(response);
			},
			error : function(e) {
				// alert('Error: ' + e);
			}
		});
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
			alert("Please Select School Code");
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
		else if ($("#workName").val() == "0" || $("#workName").val().trim() == "" ) {
			if($("#workName").val() == "0"){
			alert("Please Select Name of Work");
		}else{
			alert("Please Enter Name of Work");
			}
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
		
		/* else if(parseInt($("#estimatedAmount").val())<parseInt($("#sanctionAmount").val())){
			alert("Please Enter Sanction Amount less than Estimation Amount");
			return false;
		} */
	
	}
	
	function changeInventory() {

		var inventory = $("#intervention").val();

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
		
		
		
		$("#Component").empty().append("<option value='0'>--Select--</option>");

		if (inventory == "SSA") {
			for (var i = 0; i < SSA.length; i++) {
				$("#Component").append(
						"<option value='"+SSA[i]+"'>" + SSA[i] + "</option>");
			}
		} else if (inventory == "RMSA") {
			for (var i = 0; i < RMSA.length; i++) {
				$("#Component").append(
						"<option value='"+RMSA[i]+"'>" + RMSA[i] + "</option>");
			}
		} else if (inventory == "KGBV") {
			for (var i = 0; i < KGBV.length; i++) {
				$("#Component").append(
						"<option value='"+KGBV[i]+"'>" + KGBV[i] + "</option>");
			}
		} else if (inventory == "Girls Hostel") {
			for (var i = 0; i < GirlsHstl.length; i++) {
				$("#Component").append(
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
				$("#Component").append(
						"<option value='"+DIET[i]+"'>" + DIET[i] + "</option>");
			}
		} else if (inventory == "MRC") {
			for (var i = 0; i < MCR.length; i++) {
				$("#Component").append(
						"<option value='"+MCR[i]+"'>" + MCR[i] + "</option>");
			}
		}else if (inventory == "Residential Schools") {
			for (var i = 0; i < Residential.length; i++) {
				$("#Component").append(
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

	  function showChangeWorkField(){
		  var schval=$("#schcd").val();
		  if(schval=='98'){
			  $("#worknamefield").empty().html("<input type=text name='workName' class='form-control'style='text-transform: uppercase;' id='workName' maxlength='45' onkeypress='return (event.charCode ==32) ||(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)'/>");
			  }else{
			  $("#worknamefield").empty().html("<select class='form-control' name='workName' id='workName'/>");
			  getNamesListAjax('schcd','workName');
			 }
		 } 
	
function getInventoryData(){
	var schval=$("#schcd").val();
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
</script>
</head>

<body onload="getSanctionYear()" oncopy="return false" oncut="return false" onpaste="return false">
	<jsp:include page="../Tiles/withLogin/Header.jsp"/>
<jsp:include page="../Tiles/withLogin/Menu.jsp"/>
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Tender Details</legend>
						<div class="control-group">
							<div class="row">
								<form method="POST" autocomplete="off">
									<br/>
									<h4 style="color: red; text-align: center" id="successMessage">${message}</h4>
									<div class="col-xs-12 col-sm-3 form-group">
										<label for="district">District Name</label> <select
											class="form-control" name="districtCode" id="districtCode" onchange="getNamesListAjax('districtCode','mandalCode');">
											<option value="0">--select--</option>
											<c:forEach items="${distList}" var="list">
												<option value="${list.key}">${list.value}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="mandal">Mandal Name</label> <select
											class="form-control" name="mandalCode" id="mandalCode" onchange="getNamesListAjax('mandalCode','schcd');">
											<option value="0">--select--</option>
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="schlcode">Udise Code</label> <select
											class="form-control" name="schCode" id="schcd" onchange="showChangeWorkField();getInventoryData();">
											<option value="0">--select--</option>
										</select>
										</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Intervention</label> <select
											name="intervention" id="intervention"
											onchange="return changeInventory();" class="form-control">
											<option value="0">--select--</option>
											
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Component</label> <select
											name="component" id="Component" class="form-control">
											<option value="0">--select--</option>
										</select>
									</div>
									
									<div class="form-group col-xs-12 col-sm-3">
										<label for="work">Name Of Work/School Name</label>
										<span id="worknamefield"><select
											class="form-control" name="workName" id="workName">
											<option value="0">--select--</option>
										</select></span>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Administrative Sanction</label>
										<input type=text name="sanctionAmount" class="form-control" id="sanctionAmount" maxlength="45" onkeypress="return allowCharacters(event);"/>
									</div>

									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Year of Sanction</label> <select
											name="sanctionYear" id="sanctionYear" class="form-control">
											<option value="0">--select--</option>
											
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">No Of Units</label> <select
											name="units" id="units" class="form-control">
											<option value="0">--select--</option>
										<c:forEach begin="1" end="99" var="list">
											<option value='${list}'>${list}</option>
											</c:forEach>
										</select>                                         
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Estimation Amount
											</label> <input type="text"  name="estimatedAmount" 
											class="form-control"  id="estimatedAmount" maxlength="10"  onKeyPress="return checkval(event)" />
									</div>
									<div class="col-xs-12">

										<button class="btn btn-primary"
											style="text-align: center;" onclick="return onSubmitDetails();">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../Tiles/withLogin/Footer.jsp"/>
<script>
	$(function() {
		$("#successMessage").delay(10000).fadeOut(0);
	});
	</script>
</body>
</html>

