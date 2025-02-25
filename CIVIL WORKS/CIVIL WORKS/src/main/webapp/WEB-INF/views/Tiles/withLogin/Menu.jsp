<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::Civil Works::</title>

  <script type = "text/javascript">
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function() {
                null
            };
        </script> 
</head>
<body>
	<div style="background: #f79400;" >
		<div class="container" style="margin-bottom: 10px;">
			<nav class="navbar navbar-inverse"> <%
 	if (session.getAttribute("RoleId")!=null) {
 %>
			<ul class="nav navbar-nav">
				<li><a href="home">Home</a></li>
				<%
							if ("129".equals(session.getAttribute("RoleId").toString()) || "130".equals(session.getAttribute("RoleId").toString())) {
						%>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Intervention <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<%
							if ("129".equals(session.getAttribute("RoleId").toString())) {
						%>
						<li><a href="tenderregister">State Activity</a></li>
						<li><a href="tenderEdit">Edit State Activity</a></li>
						<%
							} else if("130".equals(session.getAttribute("RoleId").toString())){
						%>
						<li><a href="DistrictExecutiveEngineerEntryMain">District
								Activity</a></li>
						<%
							}
						%>
					</ul></li>
				    <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Progress Reports <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="getTenderDetails">Tender Details Status Report</a></li>
					</ul></li>
					
					
					
					<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Administrative Sanction <br />Proceedings<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<%
							if ("129".equals(session.getAttribute("RoleId").toString())) {
						%>
						<li><a href="uploadSanction">Upload Administrative Sanction </a></li>
						<%
							}
						%>
						<li><a href="getAdminstrationSactionUploads">Download Administrative Sanction </a></li>
					</ul></li>
					
				<li><a href="#">
				</a></li>
				<!-- <li><a href="#">Financial <br />Proceedings
				</a></li> -->
					<li><a href="changePassword">Change Password
				</a></li>
				<%} %>
				<li><a href="logout">Logout</a></li>
			</ul>
			<%
				}
			%> </nav>
		</div>
	</div>
</body>
</html>