
<%
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "inline; filename=" + "TenderDetailsStatusReport.xls");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<div class="height_body">
		<div class="container">
			<div class="col-xs-12">

				<h4>Tender Detail Status Report</h4>
				<!-- 	Message Displaying -->
				<c:if test="${not empty msg}">
					<br />
					<div style="margin-top: 13%; margin-bottom: 13%">
						<h4 style="color: red; text-align: center" id="successMessage">${msg}</h4>
					</div>
				</c:if>

				<!--  District List -->

				<c:if test="${not empty distList}">
					<table id="example" class="table table-striped table-bordered"
						cellspacing="0" border="1" width="100%">
						<thead>
							<tr>
								<th style="text-align: center" valign="middle">S.No</th>
								<th style="text-align: center" valign="middle">District
									Code</th>
								<th style="text-align: center" valign="middle">District
									Name</th>
								<th style="text-align: center" valign="middle">No of Works</th>
								<th style="text-align: center" valign="middle">Estimated
									Cost</th>
							</tr>
						</thead>
						<tbody>
							<%
								int i = 0;
							%>
							<c:set var="totalcost" value="0"></c:set>
							<c:set var="totalschools" value="0"></c:set>
							<c:forEach items="${distList}" var="list">
								<tr>
									<td style="text-align: center"><%=++i%></td>
									<td style="text-align: center">${list.DistCode}</td>
									<td style="text-align: left">${list.DistName}</td>
									<td style="text-align: right">${list.schools}</td>
									<c:choose>
										<c:when test="${list.estimatecost==0}">
											<td style="text-align: right">${list.estimatecost}</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: right">${list.estimatecost}</td>
										</c:otherwise>
									</c:choose>
									<c:set var="totalschools" value="${totalschools+list.schools}"></c:set>
									<c:set var="totalcost" value="${totalcost+list.estimatecost}"></c:set>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3" style="text-align: center">Total</th>
								<th style="text-align: right">${totalschools}</th>
								<th style="text-align: right">${totalcost}</th>
							</tr>
						</tfoot>
					</table>
				</c:if>

				<!-- 	Tender Details Status Report List -->
				<c:if test="${not empty tenderstatusDetailList}">

					<div class="table-responsive">
						<table id="example" border="1" class="table table-striped table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th style="text-align: center" rowspan="2" valign="middle">District
										Name</th>
									<th style="text-align: center" rowspan="2" valign="middle">Work
										Name</th>
									<th style="text-align: center" rowspan="2" valign="middle">Intervention
									</th>
									<th style="text-align: center" rowspan="2" valign="middle">Component
									</th>
									<th style="text-align: center" rowspan="2" valign="middle">Units
									</th>
									<th style="text-align: center" rowspan="2" valign="middle">Sanction
										Year</th>
									<th style="text-align: center" rowspan="2" valign="middle">Administration
										Sanction</th>
									<th style="text-align: center" rowspan="2" valign="middle">Estimated
										Cost</th>
									<!-- <th style="text-align: center" rowspan="2" valign="middle">ECV
									</th>
									<th style="text-align: center" rowspan="2" valign="middle">Tender
										Discount</th>
									<th style="text-align: center" rowspan="2" valign="middle">TCV
									</th> -->
									<th style="text-align: center" rowspan="2" valign="middle">Date
										Of Agreement</th>
									<th style="text-align: center" rowspan="2" valign="middle">Tentative
										Date of Completion</th>
										<th style="text-align: center" rowspan="2" valign="middle">Site HandOver Date</th>
									<th style="text-align: center" rowspan="2" valign="middle">Expenditure
										Made Till Date</th>
									<th style="text-align: center" rowspan="2" valign="middle">Balence
										Expenditure To Be Made</th>
									<th style="text-align: center" rowspan="2" valign="middle">Stage
										Of Work</th>
									<th style="text-align: center" valign="middle" colspan="4">Upload
										Files</th>
									<th style="text-align: center" rowspan="2" valign="middle">Floor
										wise Remarks</th>
									<th style="text-align: center" rowspan="2" valign="middle">Reasons for Delay</th>
									<!-- <th style="text-align: center" rowspan="2" valign="middle">Opening
										Balance</th> -->
								</tr>
								<tr>
									<th style="text-align: center" valign="middle">(1)</th>
									<th style="text-align: center" valign="middle">(2)</th>
									<th style="text-align: center" valign="middle">(3)</th>
									<th style="text-align: center" valign="middle">(4)</th>
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
										<td style="text-align: center">${list.estAmount}</td>
										<%-- <td style="text-align: left">${list.ecv}</td>
										<td style="text-align: center">${list.tenderdiscount}</td>
										<td style="text-align: left">${list.tcv}</td> --%>
										<td style="text-align: center">${list.dateofagreement}</td>

										<td style="text-align: center">${list.tentativeDate}</td>
											<td style="text-align: center">${list.siteHandOverDate}</td>
										<td style="text-align: left">${list.expenditureMade}</td>
										<td style="text-align: left">${list.balenceExpenditure}</td>
										<td style="text-align: left">${list.workStage}</td>
										<td style="text-align: left">${list.uploadOne}</td>
										<td style="text-align: left">${list.uploadTwo}</td>
										<td style="text-align: left">${list.uploadThree}</td>
										<td style="text-align: left">${list.uploadFour}</td>
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
	</div>
	</fieldset>
	</div>
	</div>
	</div>
	</div>

	<!-- Footer -->

	</div>
	</fieldset>
	</div>
	</div>
	</div>
	</div>
</body>
</html>



