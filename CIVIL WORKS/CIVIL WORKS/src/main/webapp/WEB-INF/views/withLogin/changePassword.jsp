<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>::Civil Works::</title>
 <script src="resources/js/md5/md5.js"></script>
 <script type="text/javascript">
         function changePwd() {
            	 if (document.getElementById('encryptedPassword').value == "") {
                    alert("Please Enter Old Password");
                    $("#encryptedPassword").focus();
                    return false;
                }  if (document.getElementById('password').value == "") {
                    alert("Please Enter New Password");
                    $("#password").focus();
                    return false;
                } 
            	 check('password');
                 if (document.getElementById('confirmPwd').value == "") {
                    alert("Please Enter Confirm Password");
                    $("#confirmPwd").focus();
                    return false;
                } 
                 check('confirmPwd');
                if (document.getElementById('confirmPwd').value != document.getElementById('password').value) {
                    alert("Please check Confirm  Password  and Old Password must match");
                    $("#confirmPwd").focus();
                    return false;
                }
               if (document.getElementById('txtCaptcha').value == "") {
                    alert("Please Enter Captcha Code");
                   
                    $("#txtCaptcha").focus();
                    return false;
                }  
               if (document.getElementById('txtCaptcha').value != '${captchapwd}') {
                   alert("Please Enter Correct Captcha Code");
                   $("#txtCaptcha").focus();
                   return false;
               }  
                else {
                    with (document.forms[0]) {
                    	encryptedPassword.value = calcMD5(elements["encryptedPassword"].value);
                    	newEncryptedPwd.value = calcMD5(elements["password"].value);
                    	confirmPwd.value = calcMD5(elements["confirmPwd"].value);
                    	 document.forms[0].submit();
                    }
                }
            }
            
            
            function check(id) {
           	   var  pattern =new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
              var  str=$("#"+id).val();
                if (!pattern.test(str)) {
                    alert("atleast one number/one Lower Alphabet/one Upper Alphabet/one special character/more 8 digits");
                    $("#"+id).focus(); 
                    $("#"+id).val("");
                    return false;
                } 
            }

            function onlyNumbers(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {

                      return false;
                  }
                 return true;
            }
        </script>
</head>
<body oncopy="return false" oncut="return false" onpaste="return false" ondragover="return false">
<jsp:include page="../Tiles/withLogin/Header.jsp"/>
<% if(session.getAttribute("userName") !=null){%>
<jsp:include page="../Tiles/withLogin/Menu.jsp" />
<%} %>
<div class="height_body">
		<div class="container">
			<div class="row"  style="float: left; margin-left: 17%;">
				<div class="col-md-7">
					<fieldset class="scheduler-border">
						<legend class="scheduler-border">Change Password</legend>
						<div class="control-group">
							<div class="row">
	
<form role="form" action="changePassword"  method="POST" modelAttribute="passwordcmd" autocomplete="off">
								
								<br/>
									<h4 style="color: red; text-align: center" id="successMessage">${message}</h4>
								 
								  <input type="hidden" name="username" id="username" value="${user}">
								   <input type="hidden" name="newEncryptedPwd" id="newEncryptedPwd">
								
								<div class="form-group col-xs-12">
									<label class="sr-only" for="r-form-1-email">Old Password</label>
									<input type="password" name="encryptedPassword" placeholder="Old Password" class="r-form-1-name form-control" id="encryptedPassword">
								</div>
								<div class="form-group col-xs-12">
									<label class="sr-only" for="r-form-1-email">New Password</label>
									<input type="password" name="password" placeholder="New Password" class="r-form-1-name form-control" id="password" onchange="return check('password');">
								</div>
								<div class="form-group col-xs-12">
									<label class="sr-only" for="r-form-1-email">Confirm Password</label>
									<input type="password" name="confirmPwd" placeholder="Confirm Password" class="r-form-1-name form-control" id="confirmPwd" onchange="return check('confirmPwd');">
								</div>
								<div class="form-group col-xs-12">
									<span style="letter-spacing: 2px; font-weight: bold;
												 color: #f79400; font-size: 20px;">${captchaCode}</span>
								</div>
								<div class="form-group col-xs-12">
									<label class="sr-only" for="r-form-1-name">Captcha</label>
									<input type="text" name="txtCaptcha" id="txtCaptcha"  maxlength="5" onkeypress="return onlyNumbers(event); placeholder="Enter Captcha" class="r-form-1-name form-control" id="r-form-1-name">
								</div>
								<div class="col-xs-12">
								<button class="btn btn-primary"
											style="text-align: center;" class="btn" onclick="return changePwd();">Update</button>
									</div>
							</form>
</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../Tiles/withLogin/Footer.jsp"/>
<script>
	$(function() {
		$("#successMessage").delay(10000).fadeOut(0);
	});
	</script>
</body>
</html>
