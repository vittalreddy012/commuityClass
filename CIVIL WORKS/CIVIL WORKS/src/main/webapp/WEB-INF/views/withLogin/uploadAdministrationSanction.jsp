<%@page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
      function onSubmitDetails() {
		
	  
		 if ($("#intervention").val()=="0") {
			alert("Please Select Intervention");
			return false;
		}
		else if ($("#Component").val()=="0") {
			alert("Please Select Component");
			return false;
		}
		else if ($("#sanctionAmount").val()==null||$("#sanctionAmount").val() == "0") {
			alert("Please Select Sanction Amount");
			return false;
		}
		else if ($("#sancUpload").val()=="") {
			alert("Please Upload File");
			return false;
		}
	
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
	function getSanctionListAjax() {
		var paraData = "intervention=" + $('#intervention').val() + "&component="+ $('#Component').val();
		//alert(paraData);
		$.ajax({
			type : "GET",
			url : "getSanctionDetails",
			data : paraData,
			success : function(response) {
				$("#sanctionAmount").empty().append(response);
			},
			error : function(e) {
				// alert('Error: ' + e);
			}
		});
	}
	  
</script>
<script type="text/javascript">
function uploadpdf(id)
{
	var file = id.value;
   var sizefile = id.files[0];
 
    var len = file.length;
    var ext = file.slice(len - 3, len);
  
    if(ext.toUpperCase() != "PDF"){
    	  alert("Only PDF files allowed.");
    	  $("#sancUpload").val('');
        return false;
    }
   
    if ((Math.round((sizefile.size / 1048576) * 100) / 100) > 5||sizefile.size <1024) {
        alert('This Image size should be less than 5 MB and more than 1 KB ');
        $("#sancUpload").val('');
        return false;
    }
    else {
        return true;
    }
}

</script>
</head>

<body>
	<jsp:include page="../Tiles/withLogin/Header.jsp"/>
<jsp:include page="../Tiles/withLogin/Menu.jsp"/>
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Upload Administration Sanctions</legend>
						<div class="control-group">
							<div class="row">
								<form method="POST" enctype="multipart/form-data">
									<br/>
									<h4 style="color: red; text-align: center" id="successMessage">${message}</h4>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Intervention</label> <select
											name="intervention" id="intervention"
											onchange="return changeInventory();" class="form-control">
											<option value="0">--select--</option>
											<option value="SSA">SSA</option>
											<option value="RMSA">RMSA</option>
											<option value="KGBV">KGBVs</option>
											<option value="Girls Hostel">Girls Hostel</option>
											<!-- <option value="UR">URs</option>
 -->											<option value="DIET">DIET</option>
											<option value="MRC">MRCs</option>
											<option value="Residential Schools">Residential Schools</option>
										</select>
									</div>
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Component</label> <select
											name="component" id="Component" class="form-control" onchange="getSanctionListAjax()">
											<option value="0">--select--</option>
										</select>
									</div>
									<div class="col-xs-12 col-sm-3 form-group">
										<label for="district">Administrative Sanction</label> <select
											class="form-control" name="sanctionAmount" id="sanctionAmount">
											<option value="0">--select--</option>
										</select>
									</div>  
									<div class="form-group col-xs-12 col-sm-3">
										<label for="stackedFirstName">Upload Pdf File (<span style="color:red">Max Size :5MB</span>)</label> 
										<input type=file name="sancUpload" class="form-control" id="sancUpload" onchange="return uploadpdf(this)"  accept="application/pdf" />
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

