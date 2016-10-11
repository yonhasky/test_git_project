<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MCS - Mentoring Campus in SahmyookUniv.</title>

<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>	
<link href="css/common.css" rel="stylesheet" type="text/css">

</head>
<body id="myPage">

	<jsp:include page="topMenuSuccess.jsp"/>
	<div class="jumbotron text-center">



		<h1>MC in SYU</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		<form class="form-inline">
			<input type="text" class="form-control" size="50" placeholder="검색"
				required>
			<button type="button" class="btn btn-danger">검색</button>
		</form>
	</div>



	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">


		<!-- content -->
		<div style="width: 90%; height: 400px; margin: 0 auto;">

			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					<li data-target="#carousel-example-generic" data-slide-to="4"></li>

				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/ceci1.jpg" style="width: 100%; height: 400px;"
							alt="...">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="images/ceci2.jpg" style="width: 100%; height: 400px;"
							alt="...">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="images/ceci3.jpg" style="width: 100%; height: 400px;"
							alt="...">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="images/ceci4.jpg" style="width: 100%; height: 400px;"
							alt="...">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img src="images/ceci5.jpg" style="width: 100%; height: 400px;"
							alt="...">
						<div class="carousel-caption"></div>
					</div>

				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

		</div>


		<h2>MCS</h2>
		<h4>함께하는 삼육대</h4>
		<br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-off logo-small"></span>
				<h4>POWER</h4>
				<p>Powered by SYU</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-heart logo-small"></span>
				<h4>LOVE</h4>
				<p>우리들의 러브캠퍼스</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span>
				<h4>JOB DONE</h4>
				<p>취업정보 공유</p>
			</div>
		</div>
		<br> <br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-leaf logo-small"></span>
				<h4>GREEN</h4>
				<p>그린캠퍼스</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-certificate logo-small"></span>
				<h4>CERTIFIED</h4>
				<p>선배들이 보장합니다</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4 style="color: #303030;">HARD WORK</h4>
				<p>함께 이겨내는 삼육대</p>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

