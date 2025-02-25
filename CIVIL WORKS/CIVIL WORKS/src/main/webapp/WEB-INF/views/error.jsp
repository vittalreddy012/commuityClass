<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<title>::Civil Works::</title>
</head>
<body>

 <table align="center" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td><br/><br/><br/><br/><br/>
            <b><font color="red" size="6">Error (${status} : ${error}) on ${timestamp} </font></b>
            <%--  ${message} ${trace} ${exception} --%>
                </td>
            </tr>
             <tr>
                <td align="center"><br/>
                 <font color="Blue" size="4">  Please  try again : <a href="<%=basePath%>"> <b>Civil Works</b></a></font>
                </td>
            </tr>
            </table>
</body>
</html>