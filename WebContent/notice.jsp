<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="topMenu.jsp"%>


	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<div class="row">

			<h2 class="text-center">CONTACT</h2>
			<div class="row">
				<div class="col-sm-5">
					<p>Contact us and we'll get back to you within 24 hours.</p>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span> Chicago, US
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span> +00 1515151515
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>
						myemail@something.com
					</p>
				</div>
				<div class="col-sm-7 slideanim">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name"
								placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments"
						placeholder="Comment" rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-sm-12 form-group">
							<button class="btn btn-default pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>