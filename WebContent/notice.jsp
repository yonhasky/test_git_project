<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객센터</title>
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

<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row ">
	<!-- Container (Contact Section) -->
	<a href="NoticeController?action=noticeList&pageNum=1"><span class="glyphicon glyphicon-list-alt logo-small col-xs-4"> 공지사항</span></a>
	<a href="faq.jsp"><span class="glyphicon glyphicon-question-sign logo-small col-xs-4"> FAQ</span></a>
	<a href="RecommendController?action=recommendList&pageNum=1"><span class="glyphicon glyphicon-phone-alt logo-small col-xs-4"> 건의사항</span></a>
	</div>
	</div>
	



</body>
</html>