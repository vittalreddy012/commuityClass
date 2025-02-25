<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Image</title>
</head>
<body>
                                  <%
									 String b64 =(String)request.getAttribute("b64");
									/*   String checkStageOfWorkList = (String)request.getAttribute("checkStageOfWorkList");
									   out.println("=="+checkStageOfWorkList+"==");    */ 
								%>
			                       <%
										if (b64 != null) {
									%>
									<img src="data:image/jpg;base64, <%=b64%>"
										 />
									<%
										}else {%>
                                        <%out.println(b64);%>
                                        <% }%>
									
									
								
</body>
</html>