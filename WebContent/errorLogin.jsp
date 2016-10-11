<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MCS-소개</title>
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

		<%@ include file="topMenuSuccess.jsp"%>

	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-offset-2 col-sm-4">
				<span class="glyphicon glyphicon-remove logo slideanim"></span>
			</div>
			<div class="col-sm-6">
			<br>
				<p>
					<strong>ERROR</strong>
				</p>
				<h2><%=request.getAttribute("message")%></h2>
							<button class="btn btn-default btn-lg"><a href="index.jsp">홈 바로가기</a></button>
			
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>



</body>
</html>