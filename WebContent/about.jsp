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
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="topMenu.jsp"%>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
				<h2>삼육대학교 커뮤니티</h2>
				<br>
				<h4>삼육대학교 재학생과 졸업생 모두가 소통할 수 있는 공간. 지금 우리에게 필요한 소통은 우리학교 학생들과의
					소통입니다. 학교내의 인프라를</h4>
				<br>
				<p>재학생과 졸업생이 서로 정보를 주고받는 윈윈전략을</p>
				<br>
				<button class="btn btn-default btn-lg">삼육대학교 바로가기</button>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-signal logo"></span>
			</div>
		</div>
	</div>

	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-globe logo slideanim"></span>
			</div>
			<div class="col-sm-8">
				<h2>MVP pettern</h2>
				<br>
				<p>
					<strong>MISSION:</strong>미션
				</p>
				<br>
				<p>
					<strong>VISION:</strong>비전
				</p>
				<br>
				<p>
					<strong>PASSION:</strong>열정
				</p>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>



</body>
</html>