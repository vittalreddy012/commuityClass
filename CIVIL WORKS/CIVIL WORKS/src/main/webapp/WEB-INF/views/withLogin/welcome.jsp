<!DOCTYPE html>
<html lang="en">
<head>
</head>

<body>
	<jsp:include page="../Tiles/withLogin/Header.jsp" />
	<jsp:include page="../Tiles/withLogin/Menu.jsp" />
	<div class="height_body">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Home</legend>
						<div class="control-group">
							<div class="row">
								<%
									if (session.getAttribute("userName") != null) {
								%>
								<h5
									style="color: #ff6508; font-size: medium; float: right; margin-top: -10px; padding-right: 40px;text-transform: uppercase;">
									USER NAME: <span
										style="color: green; font-weight: bold; font-style: italic; font-size: large;">
									<%=session.getAttribute("userName")%>
									</span>
								</h5>

								<%
									}
								%>
								<div
									style="color: #08a3f1; text-align: center; font-weight: bold; font-size: 16px; margin-top: 13%; margin-bottom: 15%">

									<h4>
										WELCOME TO CIVIL WORKS
										<h4>
								</div>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../Tiles/withLogin/Footer.jsp" />
</body>
</html>
