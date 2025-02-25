<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Civil Works</title>
         
        <!-- CSS -->        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400|Roboto:300,400,500">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/style.css">
        <link rel="stylesheet" href="resources/css/media-queries.css">
          <script src="resources/js/md5/md5.js"></script>
              
         <script type="text/javascript">
            function validateUser() {
            	 if (document.getElementById('username').value == "") {
                    alert("Please Enter Username");
                    $("#username").focus();
                    return false;
                } else if (document.getElementById('password').value == "") {
                    alert("Please Enter Password");
                    $("#password").focus();
                    return false;
                } 
               else if (document.getElementById('txtcaptcha').value == "") {
                    alert("Please Enter Captcha Code");
                    $("#txtcaptcha").focus();
                    return false;
                }  
                else {
                    with (document.forms[0]) {
                        password.value = calcMD5(elements["password"].value);
                        document.forms[0].submit();
                    }
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
		<div style="    border-bottom: 2px solid #0C2D45;">
        <img src="resources/images/logo.jpg" class="img-responsive" style="width:100%;" class="img-responsive" /> </div>
				
        <!-- Top content -->
        <div class="top-content">
        	<div class="container">

				<div class="row">
				
					<div class="col-sm-6 text wow fadeInLeft">
					</div>
				<div class="col-sm-5 col-sm-offset-1 r-form-1-box wow fadeInUp">
						<div class="r-form-1-top">
							<h3><i class="fa fa-expeditedssl" aria-hidden="true" style="font-size: 40px;"></i> Login Details</h3>
						</div>
						           
                                    <font color="red" id="usermsg">${userMessage}</font>
                                
						<div class="r-form-1-bottom">
							<form role="form" action="userLogin"  method="POST"  modelAttribute="userCmd" autocomplete="off">
								<div class="form-group">
									<label class="sr-only" for="r-form-1-name">Username</label>
									<input type="text" name="username" placeholder="Username" class="r-form-1-name form-control" id="username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-email">Password</label>
									<input type="password" name="password" placeholder="Password" class="r-form-1-name form-control" id="password">
								</div>
								<div class="form-group">
									<span style="letter-spacing: 2px; font-weight: bold;
												 color: yellow; font-size: 20px;">${captchaCode}</span>
								</div>
								<div class="form-group">
									<label class="sr-only" for="r-form-1-name">Captcha</label>
									<input type="text" name="txtCaptcha" id="txtcaptcha"  maxlength="5" onkeypress="return onlyNumbers(event);" placeholder="Enter Captcha" class="r-form-1-name form-control" id="r-form-1-name">
								</div>
								<button type="submit" onclick="return validateUser();" class="btn">Login</button>
								<!-- <p class="terms">
									<a href="#" class="launch-modal" data-modal-id="modal-terms">Forgot Password</a>
								</p> -->
							</form>
						</div>
					</div>
					
				</div>
                
            </div>
        </div>

        
        <!-- Footer -->
        <footer>
        	
	        <div class="footer-bottom">
	        	<div class="container">
	        		<div class="row">
	           			<div class="col-sm-6 footer-copyright">
	                    	&copy; Civil Works
	                    </div>
	           			<div class="col-sm-6 footer-social">
	                    	Designed & Developed by <img src="resources/images/tsonline.png" class="apo" />
	                    </div>
	           		</div>
	        	</div>
	        </div>
        </footer>

		
        <!-- Javascript -->
        <script src="resources/js/jquery-1.11.1.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.backstretch.min.js"></script>
        <script src="resources/js/scripts.js"></script>
    </body>

</html>