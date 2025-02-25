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
  
<!--<script src="resources/js/datepicker/jquery.min.js"></script>
<script src="resources/js/datepicker/jquery-ui.min.js"></script>-->

<link rel="stylesheet"  href="resources/css/bootstrap.min.css">
<!-- <link href="datepicker.css" rel="stylesheet" type="text/css"> -->
<script src="resources/js/jquery-2.1.4.min.js"></script>
<script src="resources/js/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/datepicker.css" />


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

<style>
div#datepickers-container {
	
    z-index:11111111 !important;
}
</style>
<style>
.datepicker-container.datepicker-dropdown.datepicker-top-left {
    z-index: 11111111 !important;
}
</style>
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

/* function addingMonths(){
	var enteredDate = document.getElementById("dateOfAgreement").value;
	var array = new Array();
	array = enteredDate.split('-');
	var year = array[0];
	var month = array[1];
	var currentmonth = (month)-01;
	var day = array[2];
	
	var enteredMonths =document.getElementById("monthsTakenToCompletionWork").value;
	var totalMonths = Number(currentmonth) + Number(enteredMonths);
	
	var dt = new Date(year,currentmonth,day);
	console.log("dt======"+dt);
	dt.setMonth(totalMonths);
	console.log("Dt final===========:"+dt);
}
 */

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
	 else if ($("#siteHandedOverDate").val() == "") {
			alert("Please Enter Site Handed over Date/Site Grounded Date");
			$("#siteHandedOverDate").focus();
			return false;
		}

	 else if (doc < doa ) {
			alert(" Time Of Completion Work Should be Greater then or equal to Date of Agreement");
			$("#dateOfCompletionWork").val("");
			$("#dateOfCompletionWork").focus();
			return false;
		} 
	
	
		
	

}
 
</script>

</head>

<body>

	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">District Executive
							Engineer Entry Form</legend>
						<div class="control-group">
							<div class="row">
								<br />
								<% String stateid =(String) request.getAttribute("stateid");
										/* out.println(" stateid========stateid========" + stateid); */
									%>

								<%-- <% String message =(String) request.getAttribute("message");
										/* out.println(" stateid========stateid========" + stateid); */
									%> --%>

								<h4 style="color: red; text-align: center" id="successMessage">${msg}</h4>
								<br />
								<form action="saveDistrictExecutiveEngineerFirstEntry"	method="post">

									<input type="hidden" name="distExecEngId" id="distExecEngId"
										class="form-control" value="${stateid}" />
										<input type="hidden" name="intervention" id="intervention"
										class="form-control" value="${intervention}" />
										<input type="hidden" name="component" id="component"
										class="form-control" value="${component}" />
											<div class="row" align="center">
									<c:if test="${interventionfromdb !='KGBV'}">
									 <input type="hidden" name="ecv"	id="ecv" value="0"/>
									<input	type="hidden" name="tenderDiscount" id="tenderDiscount" value="0"/>
									 <input type="hidden" name="tcv" id="tcv" value="0"/>
									
									</c:if>
									<c:if test="${interventionfromdb =='KGBV'}">
									<div class="form-group col-xs-12 col-sm-4">
										<label for="ecv">ECV:</label> <input type="text" name="ecv"
											id="ecv" class="form-control" maxlength="10" 
											onkeypress="return onlyNumbers(event);" placeholder="ECV" autocomplete="off"/>
										</div>
										
									<div class="form-group col-xs-12 col-sm-4">
										 <label for="tenderDiscount">Tender Discount:</label>  <input
											type="text" name="tenderDiscount" id="tenderDiscount"
											class="form-control" maxlength="10" 
											onkeypress="return onlyNumbers(event);"
											placeholder="Tender Discount" autocomplete="off" />
									</div>
									<div class="form-group col-xs-12 col-sm-4">
										 <label for="tcv">TCV:</label>  <input type="text" name="tcv"
											id="tcv" class="form-control" maxlength="10" 
											onkeypress="return onlyNumbers(event);" placeholder="TCV" autocomplete="off"/>
									</div>
									</c:if>
									
									</div>
									<div class="row">
									<div class="form-group col-xs-12 col-sm-4">
										<label for="dateOfAgreement">Date Of Agreement:</label> <input
											type="text"  data-toggle="datepicker" name="dateOfAgreement" id="dateOfAgreement" onkeypress="return onlyNumbers(event);"
											class="form-control" placeholder="Date Of Agreement" autocomplete="off" />
									</div>

									<div class="form-group col-xs-12 col-sm-4">
										<label for="dateOfCompletionWork"> Time of Completion as per agreement : </label> <input type="text" data-toggle="datepicker"
											name="dateOfCompletionWork" id="dateOfCompletionWork" onkeypress="return onlyNumbers(event);"
											class="datepicker-here form-control" placeholder="Time Of Completion as per agreement"
											autocomplete="off" />

									</div>
									<div class="form-group col-xs-12 col-sm-4">
										<label for="siteHandedOverDate">Site Handed over
											Date/Site Grounded Date :</label> <input type="text" data-toggle="datepicker"
											name="siteHandedOverDate" id="siteHandedOverDate" onkeypress="return onlyNumbers(event);"
											class="datepicker-here form-control" placeholder="Site Handed over date" autocomplete="off"/>
									</div>
									</div>
									<div class="row" align="center">
									<div>
										<button class="btn btn-primary"
											style="text-align: center; margin-top: 35px;"
											onclick="return onSubmitDetails();">Submit</button>


									</div>
									</div>
							</div>
							</form>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>



	<script>
		showUploads();

	</script>

 <script>
    $(function() {
      $('[data-toggle="datepicker"]').datepicker({
        autoHide: true,
        zIndex: 2048,
      });
    });
  </script>
 


</body>
</html>



