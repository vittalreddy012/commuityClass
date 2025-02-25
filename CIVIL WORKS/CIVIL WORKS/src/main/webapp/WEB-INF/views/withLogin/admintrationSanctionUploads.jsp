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
	padding: 4px 8px;
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
<script>
	function downloadFile(id, flag) {
     
		$("#tenderId").val(id);
	    $('#flag').val(flag);
	    document.forms[0].action="downloadsanction"
		document.forms[0].submit();
	}

</script>
</head>
<body>

	<jsp:include page="../Tiles/withLogin/Header.jsp" />
	<jsp:include page="../Tiles/withLogin/Menu.jsp" />
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Administration Sanction Uploads Report</legend>
						<div class="control-group">
							<form role="form" method="POST">
								<input type="hidden" name="tenderId" id="tenderId" /> 
								<input type="hidden" name="flag" id="flag" /> 
							
							</form>
							<div class="col-xs-12">
						
					<!-- 	Message Displaying -->
								<c:if test="${not empty message}">
									<br />
									<div style="margin-top: 13%; margin-bottom: 13%">
										<h4 style="color: red; text-align: center" id="successMessage">${message}</h4>
									</div>
								</c:if>

<c:if test="${not empty uploadList}">
									<table id="example" class="table table-striped table-bordered"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th style="text-align: center" valign="middle">S.No</th>
												<th style="text-align: center" valign="middle">Administration 
														Sanction</th>
													<th style="text-align: center" valign="middle">Download
														File</th>
													
											</tr>
										</thead>
										<tbody>
											<%
												int i = 0;
											%>
											<c:forEach items="${uploadList}" var="list">
												<tr>
													<td style="text-align: center"><%=++i%></td>
													<td style="text-align: left">${list.sanctionno}</td>
													<td style="text-align: center"><button class="btn btn-primary" onclick="downloadFile('${list.adminId}','${list.uploadfile}')">DownLoad Sanction</button></button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>


	<!-- Footer -->

	</div>
	</fieldset>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="../Tiles/withLogin/Footer.jsp" />
	<script src="resources/js/dataTables.bootstrap.min.js"></script>
	<script src="resources/js/jquery.dataTables.min.js"></script>
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



