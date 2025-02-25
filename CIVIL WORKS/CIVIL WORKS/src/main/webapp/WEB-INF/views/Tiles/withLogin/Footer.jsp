<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Civil Works</title>
</head>
<body>
<footer>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 footer-copyright">&copy; Civil Works</div>
					<div class="col-sm-6 footer-social">
						Designed & Developed by <img src="resources/images/tsonline.png"
							class="apo" />
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
	
	<!-- Javascript -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.backstretch.min.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('ul.nav li.dropdown').hover(
							function() {
								$(this).find('.dropdown-menu').stop(true, true)
										.delay(200).fadeIn(200);
							},
							function() {
								$(this).find('.dropdown-menu').stop(true, true)
										.delay(200).fadeOut(200);
							});
				});
	</script>
