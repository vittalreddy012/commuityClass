<%--
    Document   : unAuthorised
    Created on : Jun 29, 2020, 19:40:52 PM
    Author     : APTOL301461
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::Civil Works::</title>
        <script type = "text/javascript" >

            function preventBack(){
                window.history.forward();
            }

            setTimeout("preventBack()", 0);

            window.onunload=function(){null};

        </script>
    </head>
    <body style="padding: 0px;margin: 0px;">
        <table align="center" cellpadding="0" cellspacing="0" border="0" height="60%">
            <tr>
                <td style="padding-top: 35% !important;">
                    <b><font color="red" size="4">This Service is not Available for this Login User.</font></b>
                </td>
            </tr>
        </table>
    </body>
</html>
