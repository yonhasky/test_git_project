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

<script type="text/javascript">
	function firstChange() {
		var x = document.form.first.options.selectedIndex;
		var groups = document.form.first.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();

		group[0][0] = new Option("대학분류", "");

		group[1][0] = new Option("학과선택", "");
		group[1][1] = new Option("영어영문학부", "영어영문학부");
		group[1][2] = new Option("중국어학과", "중국어학과");
		group[1][3] = new Option("일본어학과", "일본어학과");
		group[1][4] = new Option("유아교육과", "유아교육과");
		group[1][5] = new Option("경영정보학과", "경영정보학과");
		group[1][6] = new Option("경영학과", "경영학과");

		group[2][0] = new Option("학과선택", "");
		group[2][1] = new Option("물리치료학과", "물리치료학과");
		group[2][2] = new Option("식품영양학과", "식품영양학과");
		group[2][3] = new Option("사회복지학과", "사회복지학과");
		group[2][4] = new Option("상담심리학과", "상담심리학과");
		group[2][5] = new Option("보건관리학과", "보건관리학과");
		group[2][6] = new Option("생활체육학과", "생활체육학과");
		group[2][7] = new Option("간호학과", "간호학과");

		group[3][0] = new Option("학과선택", "");
		group[3][1] = new Option("생명과학과", "생명과학과");
		group[3][2] = new Option("동물생명자원학과", "동물생명자원학과");
		group[3][3] = new Option("환경디자인원예학과", "환경디자인원예학과");
		group[3][4] = new Option("컴퓨터학부", "컴퓨터학부");
		group[3][5] = new Option("컴퓨터-메카트로닉스공학부", "컴퓨터-메카트로닉스공학부");
		group[3][6] = new Option("화학생명과학과", "화학생명과학과");
		group[3][7] = new Option("화학과", "화학과");

		group[4][0] = new Option("학과선택", "");
		group[4][1] = new Option("기초의약과학과", "기초의약과학과");
		group[4][2] = new Option("약학과", "약학과");

		group[5][0] = new Option("학과선택", "");
		group[5][1] = new Option("미술컨텐츠학과", "미술컨텐츠학과");
		group[5][2] = new Option("커뮤니케이션디자인학과", "커뮤니케이션디자인학과");
		group[5][3] = new Option("건축학과", "건축학과");
		group[5][4] = new Option("아트앤디자인학과", "아트앤디자인학과");
		group[5][5] = new Option("음악학과", "음악학과");

		group[6][0] = new Option("학과선택", "");
		group[6][1] = new Option("신학과", "신학과");

		temp = document.form.second;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}

	function secondChange() {
		var first = document.form.first.options.selectedIndex;
		var x = document.form.second.options.selectedIndex;
		var groups = document.form.second.options.length;
		var group = new Array(groups);
		for (i = 0; i < groups; i++)
			group[i] = new Array();
		if (first == 1) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("영어영문학전공", "영어영문학전공");
			group[1][1] = new Option("영어통번역전공", "영어통번역전공");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");

		} else if (first == 2) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 3) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("컴퓨터시스템 전공", "컴퓨터시스템 전공");
			group[4][1] = new Option("소프트웨어 전공", "소프트웨어 전공");
			group[4][2] = new Option("응용컴퓨팅 전공", "응용컴퓨팅 전공");
			group[5][0] = new Option("", "");
			group[6][0] = new Option("", "");

		} else if (first == 4) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");

		} else if (first == 5) {
			group[0][0] = new Option("", "");
			group[1][0] = new Option("", "");
			group[2][0] = new Option("", "");
			group[3][0] = new Option("", "");
			group[4][0] = new Option("", "");

		} else if (first == 6) {
			group[0][0] = new Option("", "");

		}

		temp = document.form.third;
		for (m = temp.options.length - 1; m > 0; m--)
			temp.options[m] = null
		for (i = 0; i < group[x].length; i++) {
			temp.options[i] = new Option(group[x][i].text, group[x][i].value)
		}
		temp.options[0].selected = true
	}
</script>

<style>
.btn-warning {
	background-color: #F7BE81;
}
</style>
</head>
<body>
	<%@ include file="topMenuSuccess.jsp"%>
<%if(session.getAttribute("id") == null) {
		request.setAttribute("message", "로그인 후 이용가능합니다");
		request.getRequestDispatcher("error.jsp").forward(request,response);
}%>
				
	<div class="jumbotron text-center">

		<h1>Mentoring</h1>
		<p>Mentoring Campus in Sahmyook University</p>
		<form name="form" class="form-inline" method="post"
			action="controller?action=graduationList">
			<span class="form-group"> <span class="col-xs-12"> <select
					class="form-control" name="first" onchange="firstChange();" size=1>
						<OPTION value=''>대학분류</OPTION>
						<OPTION value=''>인문사회대학</OPTION>
						<OPTION value=''>보건복지대학</OPTION>
						<OPTION value=''>과학기술대학</OPTION>
						<OPTION value=''>약학대학</OPTION>
						<OPTION value=''>문화예술대학</OPTION>
						<OPTION value=''>신학대학</OPTION>

				</SELECT> <SELECT class="form-control" name="second"
					onchange="secondChange();" size=1>
						<OPTION value=''>학과분류</OPTION>
				</SELECT>
			</span>
			</span> <input type="text" class="form-control" size="50" placeholder="검색">
			<button type="submit" class="btn btn-danger">검색</button>
		</form>
	</div>




	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<div class="row">


			<h2>Mentoring</h2>
			<h4>졸업한 선배님들과의 멘토링</h4>


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


	<%@ include file="footer.jsp"%>
</body>
</html>