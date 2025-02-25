/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var ALERT_TITLE = "Alert Message";
var ALERT_BUTTON_TEXT = "Ok";

if (document.getElementById) {
    window.alert = function(txt) {
        createCustomAlert(txt);
    }
}

function createCustomAlert(txt) {
    d = document;

    if (d.getElementById("modalContainer"))
        return;

    mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
    mObj.id = "modalContainer";
    mObj.style.height = d.documentElement.scrollHeight + "px";

    alertObj = mObj.appendChild(d.createElement("div"));
    alertObj.id = "alertBox";
    if (d.all && !window.opera)
        alertObj.style.top = document.documentElement.scrollTop + "px";
    alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
    alertObj.style.visiblity = "visible";

    h1 = alertObj.appendChild(d.createElement("h1"));
    h1.appendChild(d.createTextNode(ALERT_TITLE));

    msg = alertObj.appendChild(d.createElement("p"));
    //msg.appendChild(d.createTextNode(txt));
    msg.innerHTML = txt;

    btn = alertObj.appendChild(d.createElement("a"));
    btn.id = "closeBtn";
    btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
    btn.href = "#";
    //btn.focus();
    btn.onclick = function() {
        removeCustomAlert();
        return false;

    }

    alertObj.style.display = "block";

}

function removeCustomAlert() {
    document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));

}
function ful() {
    alert('Alert this pages');
}




$(document).bind("contextmenu", function(e) {
    return false;
});



document.onmousedown = disableclick;
status = "Right Click Disabled";
function disableclick(event)
{
    if (event.button == 2)
    {
        alert(status);
        return false;
    }
}
//Disabling F12
$(document).keydown(function(event) {
    if (event.keyCode == 123) {
        alert("F12 Key Disabled");
        return false;
    }
});

document.onkeydown = function(e) {
    if (e.ctrlKey && (e.keyCode === 85 || e.keyCode === 117 || e.keycode === 17)) {//ctrl+u Alt+c, Alt+v will also be disabled sadly.
//            alert('not allowed' + e.keyCode);
        return false;
    }

};







