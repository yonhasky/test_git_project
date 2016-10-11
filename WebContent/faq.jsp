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
			$('.faq5').hide();
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
		
			<span class="buttons"><a href="example.com" id="faq1button"> �Խù��� ���� �Ǵ� �����ϰ� �;��. </a></span><br>
			<span class="buttons"><a href="example.com"	id="faq2button"> ȸ�������� ��𿡼� �ϸ� �ǳ���? </a></span><br>
			<span class="buttons"><a href="example.com" id="faq3button"> ���̵�� ��й�ȣ�� ����� ���� �ʾƿ�. </a></span><br>
			<span class="buttons"><a href="example.com" id="faq4button"> ��������4 </a></span><br>
			<span class="buttons"><a href="example.com"	id="faq5button"> ��������5 </a></span><br>
			<span class="buttons"><a href="example.com" id="faq6button"> ��������6 </a></span><br>
			<br>
			<br>
			<p class="faq1"> ����ڲ��� �ۼ��Ͻ� �ش� �Խù��� �����Ͽ� �Խñ� �Ʒ��� ���� �Ǵ� ���� ��ư�� Ŭ���Ͻø� ���� �Ǵ� ������ ���������� �Ϸ� �˴ϴ�. </p>
			<p class="faq2"> ���� �޴� �������� 'login' ��ư�� Ŭ���Ͻø� �α��� â�� �Բ� 'join us' ��ưâ�� �����ø� ȸ�������� �Ͻ� �� �ֽ��ϴ�. </p>
			<p class="faq3"> ���� �޴� �������� 'login' ��ư�� Ŭ���Ͻø� �α��� â�� �Բ� 'find ID' ��ư�̳� 'find PW' ��ư�� Ŭ���Ͻø� ���̵�� ��й�ȣ�� ã���� �� �ֽ��ϴ�. </p>
			<p class="faq4">  </p>
			<p class="faq5">  </p>
			<p class="faq6">  </p>
				</div>
	</div>
</body>