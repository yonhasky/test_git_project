<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css">
<script src="script/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.books').hide();
		$('.movies').hide();
		$('.music').hide();

		$('a').hover(function(event) {
			$(this).addClass('rightselectfig');
			$(this).parent().addClass('leftselectfig');
		}, function() {
			$(this).removeClass('rightselectfig');
			$(this).parent().removeClass('leftselectfig');
		});

		$('#booksbutton').click(function(event) {
			event.preventDefault();
			$('.books').show('slow');
			$('.movies').hide();
			$('.music').hide();
		});

		$('#moviesbutton').click(function(event) {
			event.preventDefault();
			$('.movies').show('slow');
			$('.books').hide();
			$('.music').hide();
		});

		$('#musicbutton').click(function(event) {
			event.preventDefault();
			$('.music').show('slow');
			$('.books').hide();
			$('.movies').hide();
		});
	});
</script>
</head>
<body>
	<%@ include file="topMenu.jsp"%>

	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row ">
			<span class="buttons"><a href="example.com" id="booksbutton">
					질문유형1 </a></span> <span class="buttons"><a href="example.com"
				id="moviesbutton"> 질문유형2 </a></span> <span class="buttons"><a
				href="example.com" id="musicbutton"> 질문유형3 </a></span><br>
			<br>
			<p class="books">답변 1</p>
			<p class="movies">답변 2</p>
			<p class="music">답변 3</p>
				</div>
	</div>
</body>