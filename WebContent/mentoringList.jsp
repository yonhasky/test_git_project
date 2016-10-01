<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.util.ArrayList"%>
<%@ page import="work.model.dto.Student"%>
<%@ page import="work.util.Utility"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style>
.btn-warning {
	background-color: #F7BE81;
}
</style>
</head>
<body>
	<%@ include file="topMenu.jsp"%>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">


			<h2>Mentoring</h2>
			<h4>졸업한 선배님들과의 멘토링</h4>

			<form class="form-inline">

				<div class="btn-group col-xs-12"
					style="margin: 0 auto; padding-left: 25%" data-toggle="buttons">
					<label class="btn"> <input type="hidden" name="options">
						인문사회대학
					</label>

					<div class="btn-group" style="width: 500px">
						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 경영학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 영어영문학부
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 중국어학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 일본어학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 유아교육과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 경영정보학과
						</label>
					</div>

					<br> <br> <br> <label class="btn "> <input
						type="hidden" name="options" id="option3" autocomplete="on">
						보건복지대학
					</label>

					<div class="btn-group" style="width: 500px">

						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 간호학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 물리치료학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 식품영양학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 사회복지학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 상담심리학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 보건관리학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 생활체육학과
						</label>

					</div>
					<br> <br>
					<br> <label class="btn "> <input type="hidden"
						id="option3" autocomplete="on"> 과학기술대학
					</label>

					<div class="btn-group" style="width: 500px">

						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 화학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 생명과학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 동물생명자원학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 환경디자인원예학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 컴퓨터학부
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off">
							컴퓨터-메카트로닉스공학부
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 화학생명과학과
						</label>
					</div>

					<br> <br> <br> <label class="btn "> <input
						type="hidden" name="options" id="option3" autocomplete="off">
						&nbsp;&nbsp; &nbsp;&nbsp;약학대학 &nbsp;&nbsp;&nbsp;&nbsp;
					</label>

					<div class="btn-group" style="width: 500px">

						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 약학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 기초의약과학과
						</label>
					</div>
					<br> <br> <label class="btn "> <input
						type="hidden" name="options" id="option3" autocomplete="off">
						문화예술대학
					</label>

					<div class="btn-group" style="width: 500px">

						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 음악학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 미술컨텐츠학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off">
							커뮤니케이션디자인학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 건축학과
						</label><label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 아트앤디자인학과
						</label>
					</div>
					<br> <br>
					<br>
					<label class="btn "> <input type="hidden" name="options"
						id="option3" autocomplete="off"> &nbsp;&nbsp;
						&nbsp;&nbsp;신학대학&nbsp;&nbsp; &nbsp;&nbsp;
					</label>
					<div class="btn-group" style="width: 500px">

						<label class="btn btn-warning"> <input type="radio"
							name="options" id="option3" autocomplete="off"> 신학과
						</label>
					</div>

				</div>

				<br> <br> <br> <br> <input type="text"
					class="form-control" size="50" placeholder="검색" required
					style="margin-top: 50px;">
				<button type="button" class="btn btn-danger"
					style="margin-top: 50px;">검색</button>
			</form>

			<div class="row">
				<div class="col-xs-6 ">
					<div class="thumbnail">
						<span class="col-xs-4"> <img src="images/ceci1.jpg"
							alt="..." class="img-circle"
							style="width: 150px; height: 150px; margin: 10px">
						</span> <span class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</span>
					</div>
				</div>
			</div>

		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>