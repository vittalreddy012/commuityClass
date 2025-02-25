
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.Vector"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%  Vector serviceList = (Vector) session.getAttribute("services");  %>  


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="resources/js/menu/BuildMenu.js"></script>
        <script type="text/javascript" src="resources/js/menu/MenuLayout.js"></script>
        
        <script type = "text/javascript">
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function() {
                null
            };
        </script>
        <style>
        table#mainmenuid {
    margin: auto;
}

div#menu_level_0 {
    left: 268px !important;
    top: 112px !important;
}

            /* menu */
            .menuwrapper{height:42px;}
            .topborder{
                height:1px;
                background-image: url(images/down.png);
                background-repeat: no-repeat;
                background-position: center;
            }
            .fullwidthmenu{
                background-color: #ff9800;
            }
            
            
            .bottomborder{
                height:1px;
                background-repeat: no-repeat;
                background-position: center;
                background-color:#FFFFFF;
            }
            .ddsmoothmenu{
                font: 12px Arial;
                /*height: 35px;*/
                margin: 0 auto;
            }
            .ddsmoothmenu ul{
                z-index:100;
                margin: 0;
                padding: 0;
                list-style-type: none;
                    top: 110px;
    left: 270px;
            }
            /*Top level list items*/
            .ddsmoothmenu ul li{
                position: relative;
                display: inline;
                float: left;
            }
            /*Top level menu link items style*/
            .ddsmoothmenu ul li a{
                display: block; /*background of menu items (default state)*/
                color: #000;
                padding: 10px 20px;	
                text-decoration: none;
            }
            * html .ddsmoothmenu ul li a{ /*IE6 hack to get sub menu links to behave correctly*/
                display: inline-block;
            }
            .ddsmoothmenu ul li a:link, .ddsmoothmenu ul li a:visited{
                color: #000;
            }
            .ddsmoothmenu ul li a:hover{
                background: #043c7f; /*background of menu items during onmouseover (hover state)*/
                color: #fff;
                border-top:2px solid #fff;
                border-bottom:2px solid #fff;
            }
            /*1st sub level menu*/
            .ddsmoothmenu ul li ul{
                position: absolute;
                left: 0;
                display: none; /*collapse all sub menus to begin with*/
                visibility: hidden;
            }
            /*Sub level menu list items (undo style from Top level List Items)*/
            .ddsmoothmenu ul li ul li{
                display: list-item;
                float: none;
            }
            /*All subsequent sub menu levels vertical offset after 1st level sub menu */
            .ddsmoothmenu ul li ul li ul{
                top: 0;
            }
            /* Sub level menu links style */
            .ddsmoothmenu ul li ul li a{
                font: normal 13px Verdana;
                width: 200px; /*width of sub menus*/
                padding: 5px;
                margin: 0;
                border-top-width: 0;
                border-bottom:1px solid #fff;
                border-right:1px solid #ccc;
                background-color: #d9d9d9; 
            }
            /* ######### CSS classes applied to down and right arrow images  ######### */
            .downarrowclass{
                position: absolute;
                top: 12px;
                right: 7px;
                background-image:url(<%=basePath%>arrowimages/down.png); background-repeat:no-repeat;
            }
            .rightarrowclass{
                position: absolute;
                background-image:url(<%=basePath%>images/down.png); background-repeat:no-repeat;
                top: 6px;
                right: 5px;
            }
            /* ######### CSS for shadow added to sub menus  ######### */
            .ddshadow{
                -moz-box-shadow:0px 0px 20px #191919;
                -webkit-box-shadow:0px 0px 20px #191919;
                box-shadow:0px 0px 20px #191919;
                position: absolute;
                left: 0;
                top: 0;
                width: 0;
                height: 0;
                background: #cccccc;
            }
            .toplevelshadow{ /*shadow opacity. Doesn't work in IE*/
                opacity: 0.8;
            }
            ul#links{
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-style: normal;
                line-height:28px;
                font-weight: normal;
                font-variant: normal;
                text-transform: none;
                color:#000;
                text-decoration: none;
                list-style-position: inside;
                list-style-image: url(../images/arw.png);
                list-style-type: square;
                padding: 4px;
                margin: 2px;
                list-style-position:outside;
                padding-left:20px;
            }
            ul#links li {border-bottom:1px dotted #4b4b4b; color:#000;list-style-position:outside;}
            ul#links li a{color:#000; list-style-position:outside; text-decoration:none;}
        </style>
        <script type="text/javascript">
            function altRows(id) {
                if (document.getElementsByTagName) {
                    var table = document.getElementById(id);
                    var rows = table.getElementsByTagName("tr");
                    for (i = 0; i < rows.length; i++) {
                        if (i % 2 == 0) {
                            rows[i].className = "evenrowcolor";
                        } else {
                            rows[i].className = "oddrowcolor";
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
    <div class="fullwidthmenu">
        <%
            if (serviceList != null) {
                out.println("<script LANGUAGE=\"JavaScript\">");
                for (int i = 0; i < serviceList.size(); i++) {
                    String servicedesc[] = (String[]) serviceList.elementAt(i);
                    String serviceId = servicedesc[0];
                    String parentId = servicedesc[1];
                    String target_url = servicedesc[2];
                    String service_name = servicedesc[3];
                    //System.out.println("service_name **********::" + service_name);
                    out.println("AddMenuItem (" + serviceId + ", " + parentId + ", \"" + target_url + "\", \"" + service_name + "\", \"\");");
                    //System.out.println("AddMenuItem (" + serviceId + ", " + parentId + ", \"" + target_url + "\", \"" + service_name + "\", \"\");");
                }
                //   out.println("AddMenuItem ("+999+ ", " + "0" + ", \"" + "#" + "\", \"" + userName + "\", \"\");");
            } else {
                //out.println("could not get services");
                response.sendRedirect("./unAuthorised.do");
            }
            out.println("</script>");
        %>
        <script LANGUAGE="JavaScript" type="text/javascript">
            DrawMenu();
        </script>
        </div>
    </body>
</html>