var request = getXmlHttpRequestObject();
var response = getXmlHttpRequestObject();
var lastMessage = 0;
var mTimer;
var user;

function startChat() {
    document.getElementById('chatMessage').focus();
    getChatText();
}		

function getXmlHttpRequestObject() {				
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else if(window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}
			
function getChatText() {

    if (response.readyState == 4 || response.readyState == 0) {       
        response.open("GET", 'chat.do?mode=getChatText&chat=1&last=' + lastMessage, true);
        response.onreadystatechange = handleReceiveChat;
        response.send(null);
    }
}

function getChatTextToUser(userId) {
     
    if (response.readyState == 4 || response.readyState == 0) {
        response.open("GET", 'chatPage.do?mode=getChatText&userId='+userId+'&chat=1&last=' + lastMessage, true);
        response.onreadystatechange = handleReceiveChat;
        response.send(null);
    }
}

function sendChatText() {
    if(document.getElementById('chatMessage').value == '') {
        alert("You have not entered a message");
        return;
    }
    if (request.readyState == 4 || request.readyState == 0) {
        request.open("POST", 'chat.do?mode=sendChatMsg&chat=1&last=' + lastMessage, true);
        request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        request.onreadystatechange = handleSendChat;
        var param = 'message=' + document.getElementById('chatMessage').value;
        param += '&chat=1';
        request.send(param);
        document.getElementById('chatMessage').value = '';
    }
}

function handleSendChat() {				
    clearInterval(mTimer);
    getChatText();
}

function sendChatTextToUser(userId) {
    if(document.getElementById('chatMessage').value == '') {
        alert("You have not entered a message");
        return;
    }
    user = userId;
    if (request.readyState == 4 || request.readyState == 0) {
        request.open("POST", 'chatPage.do?mode=sendChatMsg&chat=1&userId='+userId+'&last=' + lastMessage, true);
        request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        request.onreadystatechange = handleSendChatToUser;
        var param = 'message=' + document.getElementById('chatMessage').value;
        param += '&chat=1';
        request.send(param);
        document.getElementById('chatMessage').value = '';
    }
}
function handleSendChatToUser() {
    // clearInterval(mTimer);
    getChatTextToUser(user);
}

			
function handleReceiveChat() {   
    if (response.readyState == 4) {       
        var xmldoc = response.responseText;
        document.getElementById("rawData").innerHTML="";
        document.getElementById("chatTest").innerHTML=xmldoc;
    }
}

function blockSubmit() {
    sendChatText();
    return false;
}

function blockSubmitToUser(userId) {
    sendChatTextToUser(userId);
    return false;
}

function resetChat() {
    if (request.readyState == 4 || request.readyState == 0) {
        request.open("POST", 'chat.do?chat=1&last=' + lastMessage, true);
        request.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        request.onreadystatechange = handleResetChat;
        var param = 'action=reset';
        request.send(param);
        document.getElementById('chatMessage').value = '';
    }
}

function handleResetChat() {
    document.getElementById('chat').innerHTML = '';
    getChatText();
}
