/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//	written	by Tan Ling Wee
//	last updated 20 June 2003
//	email :	info@sparrowscripts.com
//      url : www.sparrowscripts.com


var orientation=0	// 0-horizontal 1-vertical
var imgPath = "./js/menu/imgs/"

var Color     = "#000"
var SubMenuBorder = ""

var mainItemForeground = "#000"
var mainItemBorder     = ""
var mainItemBackground = ""


var mainItemHoverForeground = ""
var mainItemHoverBorder     = ""
var mainItemHoverBackground = "#ee8a25"

var subItemForeground = ""
var subItemBorder     = ""
var subItemBackground = "#b75c00"
var subItemHoverForeground = ""
var subItemHoverBorder     = ""
var subItemHoverBackground = "orange"

var menuFont = "Arial"
var menuSize = "12px"

/////////////////////////////////////////////////////////////////////////////

var	ie=(navigator.appName=='Microsoft Internet Explorer')
var	ns=(navigator.appName=='Netscape')
var	dom=document.getElementById
var lw_menuId, lw_trigger, to1
var s1

/////////////////////////////////////////////////////////////////////////////

function Tmenu (id, parentId, url, description, img) {
    this.id = id
    this.parentId = parentId
    this.url = url
    this.description = description
    this.numChild = 0
    this.levelId = 0
    this.img = img
}

/////////////////////////////////////////////////////////////////////////////

var menu = new Array()
var menuCounter = 0
var numLevel = 0
var prevMenuId = -1
var nNowAt = 0

function displayMenuItem(menuId) {
    var sHTML

    if (menu[menuId].parentId>0)
    {
        ItemForeground = subItemForeground
        Border = subItemBorder
        Background = subItemBackground

        HoverForeground = subItemHoverForeground
        HoverBorder = subItemHoverBorder
        HoverBackground = subItemHoverBackground
    }
    else
    {
        ItemForeground = mainItemForeground
        Border = mainItemBorder
        Background = mainItemBackground

        HoverForeground = mainItemHoverForeground
        HoverBorder = mainItemHoverBorder
        HoverBackground = mainItemHoverBackground
    }

    if ((orientation==1)||(menu[menuId].levelId>0))
    {
        sHTML += "<table cellpadding='0' cellspacing='0' border='0' align='center' style='color:white;' bgcolor='red'><tr>"
    }

    if (menu[menuId].description!='-')
    {
        sHTML = "<td id='menu_"+menuId+"' height='24px' style='cursor:pointer;color:#000;cursor:hand;font-family:arial;background-color:"+ Background +";color=\""+ ItemForeground +"\";border-color:"+ Border +"' onmouseover='clearInterval(s1);this.style.backgroundColor=\"" + HoverBackground + "\";this.style.color=\"" + HoverForeground + "\";this.style.borderColor=\"" + HoverBorder + "\";"

        if (menu[menuId].numChild!=0) {
            sHTML += "showSubmenu("+menu[menuId].id+",this);hideSubmenu(menu["+menuId+"].levelId+1);"
        }
        else
        {
            sHTML += "prevMenuId = "+menuId+";hideSubmenu(menu["+menuId+"].levelId);"
        }

        // window width and height
        var myWidth = 0, myHeight = 0;
        if( typeof( window.innerWidth ) == 'number' ) {
            //Non-IE
            myWidth = window.innerWidth;
            myHeight = window.innerHeight;
        } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
            //IE 6+ in 'standards compliant mode'
            myWidth = document.documentElement.clientWidth;
            myHeight = document.documentElement.clientHeight;
        } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
            //IE 4 compatible
            myWidth = document.body.clientWidth;
            myHeight = document.body.clientHeight;
        }


         sHTML += ";nNowAt="+menuId+";clearAll("+menu[menuId].levelId+","+menu[menuId].parentId+")' onclick='document.location.href=\""+menu[menuId].url+"\"' onmouseout='s1=setInterval(\"resetMenu();hideSubmenu(0)\",100);'><table cellpadding=0 cellspacing=0 border=0 width='100%'><tr>"
     
        /*if(menu[menuId].url!="logout.do") {
            sHTML += ";nNowAt="+menuId+";clearAll("+menu[menuId].levelId+","+menu[menuId].parentId+")' onclick=window.open('"+menu[menuId].url+"','_blank','width="+myWidth+",height="+myHeight+",screenX=100,screenY=0,toolbar=yes,scrollbars=yes,resizable=yes,fullscreen=no,titlebar=yes,status=yes,menubar=yes').moveTo(0,0);return false; onmouseout='s1=setInterval(\"resetMenu();hideSubmenu(0)\",100);'><table cellpadding=0 cellspacing=0 border=0 width='100%'><tr>"
        }else {
            sHTML += ";nNowAt="+menuId+";clearAll("+menu[menuId].levelId+","+menu[menuId].parentId+")' onclick='document.location.href=\""+menu[menuId].url+"\"' onmouseout='s1=setInterval(\"resetMenu();hideSubmenu(0)\",100);'><table cellpadding=0 cellspacing=0 border=0 width='100%'><tr>"
        }*/



        if ((orientation==0) && (menu[menuId].levelId==0))
        {
            nArrowWidth = 0
        }
        else
        {
            nArrowWidth = 25
        }

        sHTML += "<td style='color:#fff; font-weight:bold;font-size:12px;font-family:Arial;padding:5px;' align='left'>" + menu[menuId].description.replace(" ","&nbsp;") + "</td><td width="+nArrowWidth+">"
        if (menu[menuId].numChild>0)
        {
            if ((orientation==0)&&(menu[menuId].levelId==0))
            {
                sHTML += "<img src='" + imgPath + "arrow_down.gif'>"
            }
            else
            {
                sHTML += "<img src='" + imgPath + "arrow_right.gif'>"
            }
        }
        else
        {
            sHTML += "&nbsp;"
        }
        sHTML += "</td></tr></table></td>"
    }
    else
    {
        sHTML = "<td><img src='" + imgPath + "trans.gif' height=2></td></tr><tr><td onmouseover=''><img src='" + imgPath + "trans.gif' height=1></td></tr><tr><td><img src='" + imgPath + "trans.gif' height=2></td>"
    }

    if ((orientation==1)||(menu[menuId].levelId>0))
    {
        sHTML += "</tr>"
    }
    return sHTML
}

function clearAll(levelId, parentId) {

    if (levelId>0)
    {
        Border = subItemBorder
        Background = subItemBackground
    }
    else
    {
        Border = mainItemBorder
        Background = mainItemBackground
    }

    for (i=0;i<menuCounter;i++)
    {
        if (menu[i].levelId==levelId)
        {
            if ((i!=nNowAt) && (menu[i].parentId==parentId) && (menu[i].description!="-")) {
                lw_getObj("menu_"+i).backgroundColor=Background;
                lw_getObj("menu_"+i).borderColor=Border
            }
        }
    }

}

function mapID (id) {
    for (var i=0;i<menuCounter;i++)
    {
        if (menu[i].id==id)
        {
            return i
        }
    }
    return -1
}

function showSubmenu(menuId,trigger) {
    lw_menuId = menuId
    lw_trigger = trigger

    if (ns)
    {
        to1 = setTimeout("showActualSubmenu(lw_menuId,lw_trigger)",50)
    }
    else
    {
        showActualSubmenu(lw_menuId,lw_trigger)
    }
}

function showActualSubmenu(menuId,trigger) {
    var nLevel = 0
    var leftpos = 0
    var nIndex=0

    if (menuId>0)
    {
        lw_calcpos(trigger)

        for (var i=0;i<menuCounter;i++)
        {
            if (menu[i].id==menuId)
            {
                nLevel = menu[i].levelId
                nIndex = i
            }
        }

        if ((orientation==1)||(menu[nIndex].parentId>0))
        {
            lw_getObj("menu_level_"+nLevel).top=lw_toppos
            leftpos = lw_leftpos + lw_width + 5

            if (nLevel==0) {
                leftpos -= 3
            }
        }
        else {
            lw_getObj("menu_level_"+nLevel).top = lw_toppos + lw_height + 2
            leftpos = lw_leftpos
        }

        lw_getObj("menu_level_"+nLevel).left=leftpos

        sHTML = "<table cellpadding='0' cellspacing='0' border='0'>"
        for (var i=0;i<menuCounter;i++)
        {
            if (menu[i].parentId==menuId)
            {
                sHTML += displayMenuItem (i)
            }
        }
        sHTML += "</table>"

        document.getElementById("menu_level_"+nLevel+"_content").innerHTML=sHTML
        lw_showLayer('menu_level_'+nLevel)
    }
}

function hideSubmenu(levelId) {
    for (var cnt=levelId; cnt<numLevel; cnt++)
    {
        lw_hideLayerName("menu_level_"+cnt)
    }
}

function DrawMenu ()  {

    for (var i=0; i<numLevel ; i++)
    {
        lw_createLayer("menu_level_"+i,0,0,0,0,"#ffffff","#d0d0d0",100)
    }

    sHTML="<table id='mainmenuid' width='70%' cellpadding='0' cellspacing='0'>"
    for (var i=0; i<menuCounter; i++)
    {
        if (menu[i].parentId==0)
        {
            sHTML += displayMenuItem (i)
        }
        else if (menu[i].parentId==-1)
        {
            sHTML += "<tr><td><img src='imgs/trans.gif' height=2></td></tr><tr bgcolor='"+mainItemBackground+"'><td style='padding:5px'><b>" + menu[i].description + "</b></td></tr>"
        }
    }
    sHTML += "</table>"

    document.writeln(sHTML)

}

function getLevel (menuId) {
    var pId=menuId
    var nLevel=0

    while (pId!=0)
    {
        nLevel++
        for (var i=0;i<menuCounter;i++)
        {
            if (menu[i].id==pId)
            {
                pId = menu[i].parentId
            }
        }
    }

    return nLevel
}

function AddMenuItem (id, parentId, url, description, img)  {

    menu[menuCounter++] = new Tmenu (id, parentId, url, description, img)

    if (parentId>0)
    {
        for (i=0;i<menuCounter;i++)
        {
            if (menu[i].id==parentId)
            {
                menu[i].numChild++
            }
        }
        menu[menuCounter-1].levelId = getLevel(parentId)

        if ( numLevel < menu[menuCounter-1].levelId)
        {
            numLevel = menu[menuCounter-1].levelId
        }
    }
    else if (parentId==0)
    {
        menu[menuCounter-1].levelId = 0
    }
    else
    {
        menu[menuCounter-1].levelId = -1
    }
}

function handleonclick() {
    if (ns)
    {
        lw_closeAllLayers()
    }
    else
    {
        lw_closeAllLayers(event)
    }

    resetMenu()
}

function handlekeypress(e) {
    if (ns)
    {
        var keyCode = e.keyCode?e.keyCode:e.which?e.which:e.charCode;
        if ((keyCode==27)||(keyCode==1))
        {
            handleonclick()
        }
    }
    else
    if ((event.keyCode==0)||(event.keyCode==27))
    {
        handleonclick()
    }
    resetMenu()
}

function resetMenu () {
    for (i=0;i<menuCounter;i++)
    {
        if (menu[i].levelId==0)
        {
            lw_getObj("menu_"+i).backgroundColor=mainItemBackground
            lw_getObj("menu_"+i).borderColor=mainItemBorder
        }
    }
}

document.onkeypress = handlekeypress
document.onclick = handleonclick


