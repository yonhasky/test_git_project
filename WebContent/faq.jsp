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
		$('.faq1').hide();
		$('.faq2').hide();
		$('.faq3').hide();
		$('.faq4').hide();
		$('.faq5').hide();
		$('.faq6').hide();


		$('a').hover(function(event) {
			$(this).addClass('rightselectfig');
			$(this).parent().addClass('leftselectfig');
		}, function() {
			$(this).removeClass('rightselectfig');
			$(this).parent().removeClass('leftselectfig');
		});

		$('#faq1button').click(function(event) {
			event.preventDefault();
			$('.faq1').show('slow');
			$('.faq2').hide();
			$('.faq3').hide();
			$('.faq4').hide();
			$('.faq5').hide();
			$('.faq6').hide();
		});

		$('#faq2button').click(function(event) {
			event.preventDefault();
			$('.faq2').show('slow');
			$('.faq1').hide();
			$('.faq3').hide();
			$('.faq4').hide();
			$('.faq5').hide();
			$('.faq6').hide();
		});
		
		$('#faq3button').click(function(event) {
			event.preventDefault();
			$('.faq3').show('slow');
			$('.faq2').hide();
			$('.faq1').hide();
			$('.faq4').hide();
			$('.faq5').hide();
			$('.faq6').hide();
		});
		
		$('#faq4button').click(function(event) {
			event.preventDefault();
			$('.faq4').show('slow');
			$('.faq2').hide();
			$('.faq3').hide();
			$('.faq1').hide();
			$('.faq5').hide();
			$('.faq6').hide();
		});
		
		$('#faq5button').click(function(event) {
			event.preventDefault();
			$('.faq5').show('slow');
			$('.faq2').hide();
			$('.faq3').hide();
			$('.faq4').hide();
			$('.faq1').hide();
			$('.faq6').hide();
		});
		
		$('#faq6button').click(function(event) {
			event.preventDefault();
			$('.faq6').show('slow');
			$('.faq2').hide();
			$('.faq3').hide();
			$('.faq4').hide();
			$('.faq5').hide();
			$('.faq1').hide();
		});
	});
</script>
</head>
<body>
	<%@ include file="topMenu.jsp"%>

	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row ">
		
			<span class="buttons"><a href="example.com" id="faq1button"> 게시물을 삭제 또는 수정하고 싶어요. </a></span><br>
			<p class="faq1"> 사용자께서 작성하신 해당 게시물에 접속하여 게시글 아래의 수정 또는 삭제 버튼을 클릭하시면 수정 또는 삭제가 정상적으로 완료 됩니다. </p>
			<span class="buttons"><a href="example.com"	id="faq2button"> 회원가입은 어디에서 하면 되나요? </a></span><br>
			<p class="faq2"> 메인 메뉴 페이지의 'login' 버튼을 클릭하시면 로그인 창과 함께 'join us' 버튼창을 누르시면 회원가입을 하실 수 있습니다. </p>
			<span class="buttons"><a href="example.com" id="faq3button"> 아이디와 비밀번호가 기억이 나지 않아요. </a></span><br>
			<p class="faq3"> 메인 메뉴 페이지의 'login' 버튼을 클릭하시면 로그인 창과 함께 'find ID' 버튼이나 'find PW' 버튼을 클릭하시면 아이디와 비밀번호를 찾으실 수 있습니다. </p>
			<span class="buttons"><a href="example.com" id="faq4button"> 내 정보를 수정하고 싶습니다. 어디서 해야 하나요? </a></span><br>
			<p class="faq4"> 로그인한 회원의 메뉴에서 '회원정보 수정'을 누르시면 모든 페이지를 수정할 수 있고, 비밀번호의 경우 회원메뉴에서 '비밀번호 변경' 메뉴를 클릭하면 비밀번호 확인 후 수정할 수 있습니다.</p>
			<span class="buttons"><a href="example.com"	id="faq5button"> 내가 쓴 모든 게시글들을 열람하고 싶습니다. </a></span><br>
			<p class="faq5"> '회원메뉴'에서 '나의 스터디', '나의 멘토링', '나의 지식인', '나의 문의내역' 을 클릭하시면 확인하실 수 있습니다. </p>
			<span class="buttons"><a href="example.com" id="faq6button"> 기타 건의사항은 어디에서 작성하나요? </a></span><br>
			<p class="faq6"> '고객센터' - '건의사항' 페이지에서 건의 할 수 있습니다. 많은 이용 부탁드립니다. </p>
			<br>
			<br>
			
			
			
			
				</div>
	</div>
</body>