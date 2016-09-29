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

				<div class="btn-group col-xs-12" style="margin: 0 auto; padding-left: 25%"
					data-toggle="buttons">
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

					</div><br> <br><br>

					<label class="btn ">
					
					 <input type="hidden" id="option3"
						autocomplete="on"> 과학기술대학
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
					<br> <br> 
					
					
					<label class="btn "> <input
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
					<br> <br><br><label class="btn "> <input
						type="hidden" name="options" id="option3" autocomplete="off">
						&nbsp;&nbsp; &nbsp;&nbsp;신학대학&nbsp;&nbsp; &nbsp;&nbsp;
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

			<div class="row text-center">
				<h2>Today's TOP 3</h2>

				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="images/ceci1.jpg" alt="Paris">
						<p>
							<strong>김명환 선배님</strong>
						</p>
						<p>농협 유지보수 2년차</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="images/ceci2.jpg" alt="New York">
						<p>
							<strong>김훈호 선배님</strong>
						</p>
						<p>삼성전자 모바일 기획팀 신입</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="images/ceci3.jpg" alt="San Francisco">
						<p>
							<strong>이영걸 선배님</strong>
						</p>
						<p>롯데정보통신 강사 2년차</p>
					</div>
				</div>
			</div>

			<h2>선배님들의 한마디</h2>
			<div id="myCarousel" class="carousel slide text-center"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h4>
							"좌절하지 마세요. 자신감을 가지세요!"<br> <span style="font-style: normal;">이주선,
								nc소프트 게임기획 1년차, 컴퓨터시스템 졸업</span>
						</h4>
					</div>
					<div class="item">
						<h4>
							"우리는 ...강하다!!"<br> <span style="font-style: normal;">김명환,
								농협 유지보수 2년차, 컴퓨터시스템 졸업</span>
						</h4>
					</div>
					<div class="item">
						<h4>
							"네가 가는 그 길...그 것이 바로 너의 길이다!"<br> <span
								style="font-style: normal;">김훈호, 삼성 모바일 신입 1년차, 컴퓨터시스템 졸업</span>
						</h4>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>



</body>
</html>