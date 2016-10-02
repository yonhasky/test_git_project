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
		<%@ include file="topMenuSuccess.jsp"%>
	<div class="jumbotron text-center">
		<h1>지식 IN</h1>
		<p>질문 & 답변</p>
		<form class="form-inline">
			<input type="text" class="form-control" size="50" placeholder="검색"
				required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="row">
			<div class="text-center">
				<h2>Pricing</h2>
				<h4>Choose a payment plan that works for you</h4>
			</div>
			<div class="row slideanim">
				
				<div class="col-xs-12" style=" margin:0 auto;">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h1>Premium</h1>
						</div>
						<div class="panel-body">
							<p>
								<strong>100</strong> Lorem
							</p>
							<p>
								<strong>50</strong> Ipsum
							</p>
							<p>
								<strong>25</strong> Dolor
							</p>
							<p>
								<strong>10</strong> Sit
							</p>
							<p>
								<strong>Endless</strong> Amet
							</p>
						</div>
						<div class="panel-footer">
							<h3>$49</h3>
							<h4>per month</h4>
							<button class="btn btn-lg">Sign Up</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>