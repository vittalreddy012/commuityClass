
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
       <script type = "text/javascript" >
            function preventBack(){
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload=function(){null}; 
        </script>
    </head>
    <body style="padding: 0px;margin: 0px;">

        <table align="center" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td><br/><br/><br/><br/><br/>
                    <b><font color="red" size="6">Your Session Has Expired</font></b>
                </td>
            </tr>
            <tr>
                <td align="center"><br/>
                    <a href="<%=basePath%>"> <font color="Blue" size="4"><b>Login Again</b></font></a>
                </td>
            </tr>
        </table>
    </body>
</html>
